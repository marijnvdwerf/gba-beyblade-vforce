# Sprite string matching — 2026-09-21

## sub_80655C0 (0x080655C0): matched

The existing parked draft incorrectly returned zero after processing the whole
range. The target returns the low unsigned halfword of its digit count. Its
actor index and digit count have signed halfword interpretations; the input
index and step normalize as unsigned halfwords at entry. The value parameter
is signed, as shown by cmp/bge/neg before digit extraction. The m2c draft was
regenerated and checked against the assembly.

The decisive source change was folding the loop limit into the condition:
`current > (s16)index - (s16)step`. A separate limit temporary had the correct
0xF8-byte size but 29 differing instruction rows, first at +0x0C (r10 instead
of r9 for the string). The folded expression matches all instructions. The
leading-zero stop uses break, allowing the common unsigned-count return.

### Parameter boundary and source split

The definition uses unk16 index and step. The existing compiled caller
sub_8065508 requires the wide unk32 declaration: sharing the narrow prototype
adds lsl/lsr #16 pairs at caller +0x3E and +0xA6. The definition and following
functions now live in spritestring_number.c, preserving text and rodata order
in CMakeLists.txt and ld_script.ld. The public declaration keeps the measured
wide caller view; its value parameter is now s32. This is an intentional legacy
cross-translation-unit declaration mismatch, not a claim of portable C typing.
The other call in sub_8065140 remains assembly-backed.

The split initially changed exactly two ROM bytes, at 0x655BE and 0x655BF,
from zero padding to Thumb NOP padding. The existing ASM_ZEROPAD alignment macro
at the end of spritestring.c restores these bytes. It emits alignment padding,
not hand-written function instructions. No register keywords, register pinning,
volatile tricks, or compiler-flag changes are used.

Objdiff units were added for the new file in all three configurations. The
shared expected snapshot still has the original combined object; its refresh
belongs to the manager after merge. Function diagnostics during the fold pass
used a saved new object from the SHA1-verified build as the reference.

### Fold pass

Every trial used the full US SHA1 comparison. Accepted reductions were cumulative.

| Trial | Result |
| --- | --- |
| Remove casts from signed current in condition and array index | Exact; removed |
| Fold signedCount snapshot into count | Exact; removed |
| Fold start snapshot into `(s16)index` | Exact; removed |
| Remove cast when assigning index to signed current | Exact; removed |
| Use `count++` in each arm | Exact; retained |
| Use ternary for remainder/zero selection | Exact; retained |
| Fold remaining into value | Same 0xF8 bytes, first divergence +0x0E: early mov r6,r1 instead of argument load; retained remaining |
| Fold actor pointer into array accesses | 0xF0 bytes (-8), first divergence +0x0A: mov r8,r0 instead of sub sp,#4; retained actor |
| Share count increment after both arms | 0xE4 bytes (-20), first divergence +0x0A: mov r8,r0 instead of sub sp,#4; retained per-arm increments |

Retested remaining after the other successful folds; it still differs at +0x0E.
The moving index and digit count are separate loop state, while remainder is
reused by the leading-zero test and frame selection.

Final formatted sources pass both enforced US and EU ROM SHA1 comparisons.
The original assembly dump is deleted. No shared layout changes were needed.

## sub_80653D8 (0x080653D8): matched

The previously parked draft declared SpriteString.x as unsigned. Its direct
`string->x < 0` sign-insertion test therefore vanished, removing the minus-sign
arm and reducing register pressure. Retyping this field to s32 restores the
branch and the target's 12-byte frame. Positive signedness evidence is the word
load followed by cmp/bge at original +0xA0/+0xA2/+0xA4, as well as the initial
absolute-value calculation. The m2c draft was regenerated for comparison.

The matched implementation keeps signed halfword index, digit count, and spacing
state. It separates the initial absolute value from the remaining value consumed
by Div calls. No artificial scopes, register tricks, or extra casts are needed.
The signedSpacing/signedCount snapshots used during matching both fold away.

### Fold checks

Trials used the decomp-fold-temps runner and enforced full US SHA1 checks.

| Trial | Result |
| --- | --- |
| Fold state into string | Exact; removed |
| Fold signedSpacing into spacing | Exact; removed |
| Fold signedCount into count | Exact; removed |
| Ternary remainder selection | Exact; retained |
| Fold remaining into value | Size stays 0x130; first divergence +0x1A: ldr r0,[sp] instead of ldr r1,[sp]; retained |
| Fold actor into direct indexed accesses | Size grows 0x130 to 0x154 (+36); first divergence +0x0A: stack frame 8 instead of 12 bytes; retained |

The other compiled readers/writers of SpriteString.x were independently diffed:
sub_8064F9C, sub_80650E0, sub_80650FC, and sub_8065508 remain exact. The
sub_8065140 draft is still assembly-backed and is the assembly caller of this
function. Added the void(SpriteString*) prototype to spritestring.h and removed
the original dump after matching. Final formatted sources pass both enforced
US and EU ROM SHA1 comparisons. No layout or linker changes were required.
