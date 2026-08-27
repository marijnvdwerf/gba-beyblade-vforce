# Migrating a multiplayer leaf to C

## `sub_806014C` plain-C draft

The following is the best natural C draft reached for `sub_806014C`. It intentionally has no volatile qualifiers, register bindings, inline assembly, or artificial symbols. The `MultiPlayerState` fields correspond to the already established offsets in the translation unit.

```c
unk32 sub_806014C(unk8* arg0, unk8* arg1, unk8 arg2)
{
    unk32 flags;
    unk8 newCounter;
    unk32 localFlag;
    unk8 player;
    unk16 matchCount;

    player = _unk3005DC4->unk3;
    flags = _unk3005DC4->unk14;
    if ((flags & 0x100) != 0) {
        return 0;
    }

    if ((flags & 0xC0) != 0) {
        localFlag = 0;
        newCounter = _unk3005DC4->unk5 + 1;
    } else {
        newCounter = flags & 0x400;
        localFlag = 1;
        if (newCounter != 0) {
            newCounter = _unk3005DC4->unk5 + 1;
        }
    }

    _unk3005DC4->unk5 = newCounter;
    if (_unk3005DC4->unk5 > 0x3B) {
        _unk3005DC4->unk14 |= 0x100;
        return 0;
    }

    flags = _unk3005DC4->unk14 & 0xFFFFFBBF;
    _unk3005DC4->unk14 = flags;
    if ((flags & 0x80) != 0) {
        _unk3005DC4->unk1C++;
        flags &= 0xFFFFFF7F;
        _unk3005DC4->unk14 = flags;
        if (_unk3005DC4->unk1C >= _unk3005DC4->unk20) {
            _unk3005DC4->unk14 = flags | 0x100;
            return 0;
        }
    } else {
        _unk3005DC4->unk1C = 0;
    }

    if ((_unk3005DC4->unk14 & 2) == 0) {
        matchCount = 0;
        *(vu16*)REG_SIOMLT_SEND = 0xDEAF;
        if (sub_8060040() != 0) {
            if (*(vu16*)REG_SIOMULTI0 == 0xDEAF) {
                matchCount = 1;
            }
            if (*(vu16*)REG_SIOMULTI1 == 0xDEAF) {
                matchCount++;
            }
            if (_unk3005DC4->unk4 > 2 && *(vu16*)REG_SIOMULTI2 == 0xDEAF) {
                matchCount++;
            }
            if (_unk3005DC4->unk4 > 3 && *(vu16*)REG_SIOMULTI3 == 0xDEAF) {
                matchCount++;
            }
            if (matchCount >= _unk3005DC4->unk4) {
                sub_8060404();
                return localFlag;
            }
            *(vu16*)REG_SIOCNT |= 0x80;
            _unk3005DC4->unk14 |= 0x200;
        } else if ((_unk3005DC4->unk14 & 4) == 0) {
            _unk3005DC4->unk14 |= 4;
            _unk3000DF0[7] = onSerialCommunication;
            EnableInterrupt(0x80);
        }
        return localFlag;
    }

    if (sub_8060040() != 0) {
        if ((_unk3005DC4->unk14 & 0x200) == 0) {
            return 0;
        }
        _unk3005DC4->unk14 &= 0xFFFFFDFF;
        _unk3005DC4->unk0 = 0;
        __fastMemoryCopyARM(arg1, _unk3005DC4->unk24, _unk3005DC4->unk18);
        _unk3005DC4->unk3C = _unk3005DC4->unk24;
        _unk3000DF0[6] = __sub_8757D24;
        *(vu16*)REG_SIOCNT = _unk3005DC4->unk10;
        *(vu16*)REG_RCNT = 0xC0;
        EnableInterrupt(0x40);
        (*__sub_8757CD0)();
        if (localFlag != 0 || arg2 != 0) {
            __fastMemoryCopyARM(
                _unk3005DC4->unk38,
                arg0,
                player * _unk3005DC4->unk18
            );
        }
        return localFlag;
    }

    if (localFlag != 0 || arg2 != 0) {
        __fastMemoryCopyARM(
            _unk3005DC4->unk38,
            arg0,
            player * _unk3005DC4->unk18
        );
    }
    __fastMemoryCopyARM(arg1, _unk3005DC4->unk40, _unk3005DC4->unk18);
    if ((_unk3005DC4->unk14 & 0x20) != 0) {
        _unk3005DC4->unk1C = 0;
    } else {
        _unk3005DC4->unk14 |= 0x80;
    }
    _unk3005DC4->unk14 &= 0xFFFFFFDE;
    return localFlag;
}
```

This draft is semantically faithful, but it is not an instruction-identical replacement. The target's counter path has a source-level shape that keeps the `0x400` test temporary distinct from the byte written to `unk5`; the natural draft tends to coalesce those values or move the store. The target also lays out its first branch with the zero return before the main body, whereas the straightforward early-return spelling usually makes the nonzero branch fall through.

## Reloads versus hoisted loads

The plain C draft naturally keeps the multiplayer-state expression available and tends to reuse a previously loaded status value. The target deliberately performs fresh loads at these points:

- At `0x080601F8`, `ldr r0, [r5]` reloads the pointer stored in `_unk3005DC4`.
- At `0x080601FA`, `ldr r0, [r0, #0x14]` then reloads `_unk3005DC4->unk14`, even though the status word was already loaded and masked immediately before this block.
- At `0x0806030C`, `ldr r1, [r7]` reloads the pointer stored in `_unk3005DC4` before the serial-handshake fallback path; the target does not carry the earlier state pointer into this path as a plain local would tend to do.
- At `0x08060310`, `ldrb r0, [r3, #4]` reads the player-count field from that freshly reloaded state pointer.
- At `0x080603D8`, `ldr r2, [r1, #0x14]` reloads `_unk3005DC4->unk14` for the final flag update rather than reusing the earlier status temporary.

The first pair is the clearest hoisting difference: the natural draft hoists the status value, while the target re-issues the pointer and `unk14` loads after the previous write. Adding volatile qualifiers reproduced some reloads, but that is not an acceptable recovered-source explanation and was not retained.

## Non-volatile source shapes tried

- Direct `_unk3005DC4->field` access with ordinary locals produced the closest semantic control flow, but agbcc allocated the incoming `arg1` and the long-lived address of `_unk3005DC4` to the opposite saved registers from the target.
- A local copy of `arg1` preserved the target's three-register callee-saved prologue and kept the argument live, but it caused the copy to be materialized later than the target and still left the global-address role swapped.
- Explicit `MultiPlayerState**`, `void**`, and integer-pointer aliases for the address of `_unk3005DC4` changed alias analysis and deferred or duplicated global loads. They also shifted the `arg2`, player-count, and flag temporaries into different saved registers and made the prologue less like the target.
- Reordering declarations and assignments, including placing the argument copy before the state reads, changed some allocation decisions but did not produce the target's simultaneous mapping of `arg1` to `r6`, the global address to `r7`, `arg2` to `r8`, the player count to `r9`, and the result flag to `r10`.
- Narrow and wide counter temporaries were both tested. A wide temporary removed unwanted byte-normalization instructions but allowed agbcc to merge the counter value with the arithmetic result. A narrow temporary preserved the byte store but introduced normalization in other consumers unless the surrounding expression tree was also changed.
- Structured `if`/`else` forms, explicit result initialization, and source-level branch-layout changes reproduced individual branch polarities, but no non-volatile natural form reproduced the complete register allocation, reload sequence, and literal-pool layout.

No inline assembly, hard-register binding, or volatile local/parameter was used in the retained source because those would force code generation rather than recover the original source shape.

## Argument and return types evidenced by the assembly

- `arg0` is a 32-bit pointer value. It is saved at the stack slot at entry and later passed as a copy destination; its pointee layout is not established by this function.
- `arg1` is a 32-bit pointer value. It is copied into `r6` at entry in the target and is later passed as a source/destination pointer to the multiplayer buffers; the pointee layout is not established here.
- `arg2` is consumed as an 8-bit value. The entry sequence at `0x08060158`–`0x0806015C` performs `lsl #24` followed by `lsr #24`, proving byte normalization before it is retained in `r8`. This proves byte-valued use, though by itself it does not distinguish an 8-bit formal from a wide ABI formal assigned to an 8-bit temporary.
- The return is a 32-bit ABI result in `r0`; the meaningful values are zero and the one-byte-style `localFlag` values zero or one. Call-site behavior narrows the semantic result, but the function's return register and arithmetic use are word-width.
- The state fields accessed here are word fields at offsets `0x00`, `0x10`, `0x14`, `0x18`, `0x1C`, `0x20`, `0x24`, `0x38`, and `0x40`, byte fields at offsets `0x03`, `0x04`, and `0x05`, and hardware serial registers are halfword accesses. The target's `ldrb`/`strb` and `ldr`/`str` widths are the evidence for those field widths.

## Repeatable agbcc patterns

- A field's access width is more reliable than its apparent semantic meaning: byte loads/stores should drive byte fields, and signed branches should drive signed declarations only when the instruction proves sign extension.
- Values that survive calls naturally move into callee-saved registers; one additional long-lived pointer or result temporary can change the entire push mask and incoming-argument placement.
- Direct global expressions, cached pointers, and pointers to global storage are not interchangeable. Preserve the target's observed address materialization and reload timing before introducing aliases.
- Assignment order and declaration scope affect both register allocation and literal-pool reach. Keep a temporary local only when the target preserves a distinct value or lifetime, and remove it when agbcc coalesces the corresponding values.
- Typed embedded structures are preferable to offset arithmetic: they preserve access widths, pointer scaling, and fixed RAM layout while allowing each newly proven field to be added without inventing untouched members.
- A full-ROM comparison is required after a local instruction match because changed function size can move later pools, padding, and relocations.
