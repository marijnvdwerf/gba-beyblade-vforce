#!/usr/bin/env -S uv run --script
# /// script
# requires-python = ">=3.10"
# dependencies = ["Pillow"]
# ///
"""Render a Beyblade V-Force tilemap asset (*.bbmap) to PNG.

Format (see struct TileMapHeader in src/common.h, sub_8058AA8 in src/layer.c and
src/iwram_tilemap.c), all little-endian:

  0x00 u32 totalBytes    0x10 u32 mapBytes
  0x04 u32 tileOffset    0x14 u32 byte-per-tile table offset (0 = absent)
  0x08 u32 tileBytes     0x18 u8  flags (var18; bit 1 = row-compressed map)
  0x0C u32 mapOffset     0x19 u8  colorMode (bit 0 set = 4bpp, clear = 8bpp:
                                  BGCNT bit 7 = (colorMode & 1) ^ 1)
  0x1A u16 fill entry    0x1C u16 columnCount   0x1E u16 rowCount

Compressed map (flags & 2): at mapOffset a u32 table of row offsets (relative to
the table); each row is a u16 prefix (byte length of the run data that follows;
unused by the game) followed by s16 run records: N > 0 is
followed by N literal screen entries, -N means N copies of the fill entry.
Uncompressed map: columnCount * rowCount raw u16 screen entries at mapOffset.

Screen entries are GBA text-BG entries (tile 0-9, hflip 10, vflip 11, palette
bank 12-15 for 4bpp). A map with tileBytes == 0 has no tiles of its own: the
game points it at character block 0, i.e. the tiles of the first layer in the
same ScreenLayout that does carry tiles -- pass that file with --tileset.

Colour 0 is always transparent.
"""

from __future__ import annotations

import argparse
import struct
import sys
from pathlib import Path

from PIL import Image

HEADER = struct.Struct("<6IBBHHH")


class BBMap:
    def __init__(self, data: bytes):
        if len(data) < HEADER.size:
            raise ValueError(f"file too small ({len(data)} bytes)")
        (
            self.total_bytes,
            self.tile_offset,
            self.tile_bytes,
            self.map_offset,
            self.map_bytes,
            self.tile_table_offset,
            self.flags,
            self.color_mode,
            self.fill,
            self.columns,
            self.rows,
        ) = HEADER.unpack_from(data)
        self.data = data
        # All 8bpp maps in this ROM carry a totalBytes larger than the asset itself
        # (the next ROM symbol starts right after the file), so this is only a note.
        self.size_note = (
            f" (file is {len(data):#x} bytes)" if self.total_bytes != len(data) else ""
        )
        for name, off, size in (
            ("tile", self.tile_offset, self.tile_bytes),
            ("map", self.map_offset, self.map_bytes),
        ):
            if off + size > len(data):
                raise ValueError(f"{name} data {off:#x}+{size:#x} runs past end of file")
        self.bpp = 4 if self.color_mode & 1 else 8
        self.tile_size = 8 * self.bpp
        if self.tile_bytes % self.tile_size:
            raise ValueError(f"tileBytes {self.tile_bytes:#x} not a multiple of {self.tile_size}")
        self.compressed = bool(self.flags & 2)

    @property
    def tile_data(self) -> bytes:
        return self.data[self.tile_offset : self.tile_offset + self.tile_bytes]

    @property
    def tile_count(self) -> int:
        return self.tile_bytes // self.tile_size

    def screen_entries(self) -> list[list[int]]:
        """Decode the map into rows of columnCount u16 screen entries."""
        base, end = self.map_offset, self.map_offset + self.map_bytes
        if not self.compressed:
            need = self.columns * self.rows * 2
            if need > self.map_bytes:
                raise ValueError(f"raw map needs {need:#x} bytes, mapBytes is {self.map_bytes:#x}")
            flat = struct.unpack_from(f"<{self.columns * self.rows}H", self.data, base)
            return [list(flat[r * self.columns : (r + 1) * self.columns]) for r in range(self.rows)]
        if self.rows * 4 > self.map_bytes:
            raise ValueError("row table does not fit in mapBytes")
        offsets = struct.unpack_from(f"<{self.rows}I", self.data, base)
        out = []
        for r, off in enumerate(offsets):
            pos = base + off + 2  # skip the u16 TileMapRow prefix (run-data byte length)
            row: list[int] = []
            while len(row) < self.columns:
                if pos + 2 > end:
                    raise ValueError(f"row {r}: runs past end of map data")
                (run,) = struct.unpack_from("<h", self.data, pos)
                pos += 2
                if run == 0:
                    raise ValueError(f"row {r}: zero-length run at column {len(row)}")
                if run > 0:
                    if pos + run * 2 > end:
                        raise ValueError(f"row {r}: literal run past end of map data")
                    row += struct.unpack_from(f"<{run}H", self.data, pos)
                    pos += run * 2
                else:
                    row += [self.fill] * -run
            if len(row) != self.columns:
                raise ValueError(f"row {r}: runs cover {len(row)} columns, expected {self.columns}")
            out.append(row)
        return out


def decode_tiles(data: bytes, bpp: int) -> list[list[int]]:
    """Each tile -> 64 colour indices, row-major. 4bpp: low nibble = left pixel."""
    size = 8 * bpp
    tiles = []
    for t in range(len(data) // size):
        chunk = data[t * size : (t + 1) * size]
        if bpp == 8:
            tiles.append(list(chunk))
        else:
            px = []
            for b in chunk:
                px += (b & 0xF, b >> 4)
            tiles.append(px)
    return tiles


def load_palette(path: Path | None, bpp: int) -> list[tuple[int, int, int]]:
    if path is None:
        if bpp == 4:  # 16-shade greyscale repeated for every bank
            return [(v * 17,) * 3 for v in range(16)] * 16
        return [(v,) * 3 for v in range(256)]
    raw = path.read_bytes()[:512]
    pal = []
    for (c,) in struct.iter_unpack("<H", raw[: len(raw) & ~1]):
        pal.append(tuple(((c >> s) & 0x1F) * 255 // 31 for s in (0, 5, 10)))
    return pal + [(0, 0, 0)] * (256 - len(pal))


def tile_pixels(tile: list[int], hflip: bool, vflip: bool) -> list[int]:
    if not (hflip or vflip):
        return tile
    rows = [tile[y * 8 : y * 8 + 8] for y in range(8)]
    if vflip:
        rows.reverse()
    if hflip:
        rows = [r[::-1] for r in rows]
    return [p for r in rows for p in r]


def render_map(m: BBMap, tiles: list[list[int]], bpp: int, pal) -> Image.Image:
    # Colour 0 of every palette bank is always transparent on BG layers.
    img = Image.new("RGBA", (m.columns * 8, m.rows * 8))
    px = img.load()
    missing = set()
    for ty, row in enumerate(m.screen_entries()):
        for tx, entry in enumerate(row):
            idx = entry & 0x3FF
            bank = (entry >> 12) * 16 if bpp == 4 else 0
            if idx >= len(tiles):
                missing.add(idx)
                continue
            p = tile_pixels(tiles[idx], bool(entry & 0x400), bool(entry & 0x800))
            for i, c in enumerate(p):
                if c == 0:
                    continue
                px[tx * 8 + (i & 7), ty * 8 + (i >> 3)] = pal[bank + c]
    if missing:
        print(
            f"warning: {len(missing)} tile indices out of range (max {max(missing):#x}, "
            f"have {len(tiles)} tiles); left black",
            file=sys.stderr,
        )
    return img


def render_sheet(tiles: list[list[int]], pal, per_row: int = 16) -> Image.Image:
    rows = max(1, -(-len(tiles) // per_row))
    img = Image.new("RGB", (per_row * 8, rows * 8))
    px = img.load()
    for t, tile in enumerate(tiles):
        ox, oy = (t % per_row) * 8, (t // per_row) * 8
        for i, c in enumerate(tile):
            px[ox + (i & 7), oy + (i >> 3)] = pal[c]
    return img


def scaled(img: Image.Image, n: int) -> Image.Image:
    return img if n == 1 else img.resize((img.width * n, img.height * n), Image.NEAREST)


def render_file(
    path: Path,
    out: Path,
    palette: Path | None = None,
    tileset: Path | None = None,
    tiles_out: Path | None = None,
    scale: int = 1,
) -> None:
    m = BBMap(path.read_bytes())
    print(
        f"{path}: size={m.total_bytes:#x}{m.size_note} tiles@{m.tile_offset:#x}+{m.tile_bytes:#x} "
        f"map@{m.map_offset:#x}+{m.map_bytes:#x} tileTable={m.tile_table_offset:#x} "
        f"flags={m.flags:#x}{' (compressed)' if m.compressed else ''} colorMode={m.color_mode} "
        f"({m.bpp}bpp) fill={m.fill:#06x} {m.columns}x{m.rows} tiles={m.tile_count}",
        file=sys.stderr,
    )

    src = m
    if tileset:
        src = BBMap(tileset.read_bytes())
        if src.bpp != m.bpp:
            print(f"warning: tileset is {src.bpp}bpp, map is {m.bpp}bpp", file=sys.stderr)
        print(f"using {src.tile_count} tiles from {tileset}", file=sys.stderr)
    elif m.tile_count == 0:
        print("warning: map has no tiles of its own; pass --tileset", file=sys.stderr)
    tiles = decode_tiles(src.tile_data, m.bpp)
    pal = load_palette(palette, m.bpp)

    scaled(render_map(m, tiles, m.bpp, pal), scale).save(out)
    print(f"wrote {out}", file=sys.stderr)
    if tiles_out:
        scaled(render_sheet(tiles, pal), scale).save(tiles_out)
        print(f"wrote {tiles_out}", file=sys.stderr)


def main() -> int:
    ap = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument("bbmap", type=Path)
    ap.add_argument("--palette", type=Path, help="512-byte BGR555 palette (.gbapal/.bin); default greyscale")
    ap.add_argument("--tileset", type=Path, help="take tiles from this .bbmap (for maps with tileBytes == 0)")
    ap.add_argument("--out", type=Path, help="output PNG (default: <bbmap>.png next to input)")
    ap.add_argument("--tiles", type=Path, help="also dump the tile sheet (16 tiles per row) to this PNG")
    ap.add_argument("--scale", type=int, default=1)
    args = ap.parse_args()

    out = args.out or args.bbmap.with_suffix(".png")
    render_file(args.bbmap, out, args.palette, args.tileset, args.tiles, args.scale)
    return 0


if __name__ == "__main__":
    sys.exit(main())
