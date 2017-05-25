#include "common.h"

// 87551C0
const u8 Str_87551C0[] = "Error in fastAllocate(), unable to allocate %i bytes\n";

// 87551F8
const u8 Str_87551F8[] = "Error in slowAllocate(), unable to allocate %i bytes\n";

// 8755230
const u8 Str_8755230[] = "deallocating block with 0 start\n";

// 8755254
const u8 Str_8755254[] = "Error in getValidAllocatedBlock(), no further AllocatedBlocks available\n";

// 87552A0
const u8 Str_87552A0[] = "> %i %i\n";

// 87552AC
const u8 Str_87552AC[] = "Total Wram usage %i, free %i, blocks used %i\n";

// 87552DC
const u8 Str_87552DC[] = "Total Exram usage %i, free %i, blocks used %i\n";

// 875530C
const u8 Str_875530C[] = "Error allocating %i bytes for key recording\n";

// 875533C
const u8 Str_875533C[] = "0x%x, ";

// 8755344
const u8 Str_8755344[] = "\n";

// 8755348
const u8 Str_8755348[] = "Error Allocating memory for a Process\n";

// 8755370
const u8 Str_8755370[] = "allocateMenuItems : slowAllocate failed\n";

// 875539C
const u8 Str_875539C[] = "textLayer error: font or background 256 colours.";

// 87553D0
const u8 Str_87553D0[] = "Spline count for collision data exceeds maximum available";

// 875540C
const u8 Str_875540C[] = "Error allocating %i bytes in newCollisionDataRam\n";

// 8755440
const u8 Str_8755440[] = "Error allocating %i bytes for CollisionQuadtree\n";

// 8755474
const u8 Str_8755474[] = "Error allocating %i bytes for CollisionQuadtree dynamic areas\n";

// 87554B4
const u8 Str_87554B4[] = "Not enough space allocated for Quad-tree entries; required ";

// 87554F0
const u8 Str_87554F0[] = ", ";

// 87554F4
const u8 Str_87554F4[] = "Not enough space allocated for Quad-tree nodes; required ";

// 8755530
const u8 Str_8755530[] = "Error adding dynamic BoundingAreas to quadtree, exceeded the allocated %i\n";

// 875557C
const u8 Str_875557C[] = "Warning: quadtree BoundingArea overflow\n";

// 87555A8
const u8 Str_87555A8[] = "Warning: not enough nodes available to subdivide the quadtree further\n";

// 87555F0
const u8 Str_87555F0[] = "Warning: %i areas added to quadtree node; this exceeds the warning threshold (%i)\n";

// 8755644
const u8 Str_8755644[] = "Error allocating memory for render code";

// 875566C
const u8 Str_875566C[] = "Error allocating memory for transformed vertex buffer; requires %i\n";

// 87556B0
const u8 Str_87556B0[] = "Error allocating memory for PolysPerScan table in newPolyTable()\n";

// 87556F4
const u8 Str_87556F4[] = "Error allocating memory for PolyEntrys in newPolyTable()\n";

// 8755730
const u8 Str_8755730[] = "Scan ";

// 8755738
const u8 Str_8755738[] = "; startIndex ";

// 8755748
const u8 Str_8755748[] = "endIndex ";

// 8755754
const u8 Str_8755754[] = "poly ";

// 875575C
const u8 Str_875575C[] = ", next ";

// 8755764
const u8 Str_8755764[] = "Error allocating memory for edge table entries ";

// 8755794
const u8 Str_8755794[] = "Error allocating memory for depth table entries ";

// 87557C8
const u8 Str_87557C8[] = "Error allocating memory for depth table entry list ";

// 87557FC
const u8 Str_87557FC[] = "Depth Table: depth ";

// 8755810
const u8 Str_8755810[] = "startIndex ";

// 875581C
const u8 Str_875581C[] = ", endIndex ";

// 8755828
const u8 Str_8755828[] = "  previous ";

// 8755834
const u8 Str_8755834[] = "Error: maxPacketSize supplied to initMultiPlayer() needs to be a multiple of 2\n";

// 8755884
const u8 Str_8755884[] = "Error allocating %i bytes for multiplayer data\n";

// 87558B4
const u8 Str_87558B4[] = "Error: The status of this multiplayer unit has not been resolved\n";

// 87558F8
const u8 Str_87558F8[] = "> First prev is not zero.\n";

// 8755914
const u8 Str_8755914[] = "> Prev next is not current\n";

// 8755930
const u8 Str_8755930[] = "> Current prev is not prev\n";

// 875594C
const u8 Str_875594C[] = "Not enough RAM for sprites";

// 8755968
const u8 Str_8755968[] = "Not enough RAM for rotation/scale";

// 875598C
const u8 Str_875598C[] = "Error allocating memory for SpriteVramFree list\n";

// 87559C0
const u8 Str_87559C0[] = "There was no free space in Sprite VRAM for requested characters (%i)\n";

// 8755A08
const u8 Str_8755A08[] = "There are no free SpriteVramFree entries remaining on a call to freeSpriteVramLocation()\n";

// 8755A64
const u8 Str_8755A64[] = "Vram space list\n";

// 8755A78
const u8 Str_8755A78[] = "  > %i -> %i\n";

// 8755A88
const u8 Str_8755A88[] = "remaining entries %i\n";

// 8755AA0
const u8 Str_8755AA0[] = "spritesFree = %i\n";

// 8755AB4
const u8 Str_8755AB4[] = "No sprites left!";

// 8755AC8
const u8 Str_8755AC8[] = "No sprites left for block, sprites left: %i, sprites requested: %i\n";

// 8755B0C
const u8 Str_8755B0C[] = "No sprites left for resize!";

// 8755B28
const u8 Str_8755B28[] = "resizeSpriteBlock: Reduce. Code needs writing.";

// 8755B58
const u8 Str_8755B58[] = "ERROR: Not enough sprites for string '%s'\n";

// 8755B84
const u8 Str_8755B84[] = ":";

// 8755B88
const u8 Str_8755B88[] = "0";

// 8755B8C
const u8 Str_8755B8C[] = ".";

