# Leaf K: sub_8059FA0 (math.c) — parked

Target (14 insns): narrow both s16 params, `mul`, `mov r1, r0`, `cmp r0, #0`,
`bge`, `add r1, #255`, `lsl r0, r1, #8`, `asr r0, #16`, `bx lr`. It is a
signed fixed-point multiply: `a * b / 256` returned as s16.

Every natural form coalesces the copy (`add r0, #255` directly, 2 bytes
shorter). First divergence is always the missing `mov r1, r0` at +0xA.

| form | result |
|---|---|
| `return a * b / 256;` (s16 return) | coalesced |
| `(a*b + (a*b < 0 ? 255 : 0)) >> 8` | coalesced |
| `s32 p = a*b; if (p < 0) p += 255; return p >> 8;` | coalesced |
| `s32 p, q; p = a*b; q = p; if (p < 0) q += 255; return q >> 8;` | coalesced |
| `s32 r = a*b/256; return r;` / `s16 r = …` | coalesced |
| `s32 p = a*b; return (s16)(p / 256);` | coalesced |
| s32 return, `return (s16)(a*b/256);` | wrong shape (double compare) |
| `a*b < 0 ? (a*b+255)/256 : a*b/256` | wrong shape |

Untested ideas: the product kept live by a second use after the compare
(e.g. the original stored it or passed it on); a macro shared with other
fixed-point helpers in this TU (sub_8059FB8/8059FD0 are neighbours — match
them first and reuse their idiom).
