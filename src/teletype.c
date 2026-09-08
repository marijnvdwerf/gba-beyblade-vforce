#include "teletype.h"

#include "debug.h"
#include "include_asm.h"
#include "memory.h"
#include "sprite.h"
#include "spritetext.h"

void sub_8063AB4(TeletypeState* state)
{
    SpriteEntry* sprite;
    unk32 count;
    unk32 temp;

    sprite = state->unkEC.prev;
    count = state->unkEC.count;
    for (;;) {
        temp = count;
        count--;
        if (temp == 0) {
            break;
        }
        sub_8060A60(sprite);
        sprite = sprite->next;
    }
}

extern const unk8 byte_807D980[];
extern const unk8 Str_87567E8[];

void sub_8063AD8(TeletypeState* state, unk32 palette)
{
    SpriteEntry* sprite;
    const SpriteSheet* data;
    unk32 x;
    unk8 normalizedPalette;

    normalizedPalette = palette;
    sprite = state->unkC8;
    sub_8060A60(sprite);
    data = state->unk4;
    x = state->unkAC + state->unk9C;
    LoadSpriteSheet(sprite, data, x, state->unkB0 + state->unkA0, 0, 0, 0, normalizedPalette);
    sub_8061168(sprite, state->unk14[state->unk13]);
    state->unkC8 = sprite->next;
}

unk32 sub_8063B44(TeletypeState* state)
{
    unk8 code;
    unk8 palette;
    unk32 result;

    code = state->unk1C[state->unkBF];
    result = 0;
    if (code != 0) {
        palette = byte_807D980[code];
        sub_8063AD8(state, palette);
        state->unkAC += (state->unkD + (state->unkC1 - state->unk8[palette])) << 8;
        state->unkBF++;
        state->unkC0++;
    } else {
        result = 1;
    }
    return result;
}

void sub_8063BA8(TeletypeState* state)
{
    unk32 process;
    unk32 zero;
    unk8* buffer;
    unk8 character;

    process = 1; // TODO: fakematch? (never cleared; for (;;) and a real flag both shift entry
                 // allocation at 0x02)
    state->unkB4 = 0;
    state->unk12 = 0;
    state->unkBF = 0;
    buffer = state->unk1C;
    zero = 0; // TODO: fakematch? (literal 0 shifts entry allocation at 0x02)
    while (process != 0) {
        character = *state->unk0;
        switch (character) {
        case 0:
        case 9:
        case 10:
        case 12:
        case 0x20:
        case 0x7B:
        case 0xFE:
        case 0xFF:
            buffer[state->unk12] = zero;
            return;
        case 0x21:
        case 0x26:
        case 0x2A:
        case 0x2B:
        case 0x2C:
        case 0x2D:
        case 0x2E:
        case 0x2F:
        case 0x3A:
        case 0x3B:
        case 0x3D:
        case 0x3F:
        case 0x5C:
            state->unkB4 += (state->unkC1 - state->unk8[byte_807D980[character]] + state->unkD)
                << 8;
            buffer[state->unk12++] = character;
            buffer[state->unk12] = zero;
            state->unk0++;
            return;
        case 0x3C:
        case 0x3E:
            state->unk0++;
            break;
        default:
            state->unkB4 += (state->unkC1 - state->unk8[byte_807D980[character]] + state->unkD)
                << 8;
            buffer[state->unk12++] = character;
            state->unk0++;
            break;
        }
    }
}

void sub_8063CD0(TeletypeState* state)
{
    state->unkAC = 0;
    state->unkB0 += state->unkE << 8;
    state->unkBE++;
}

void sub_8063CF4(TeletypeState* state)
{
    state->unkAC = 0;
    state->unkB0 = 0;
    state->unkBE = 0;
    state->unkBC++;
    state->unkC0 = 0;
    state->unkC8 = state->unkEC.prev;
    if (state->unkE8 != NULL) {
        state->unkE8(state, state->unkBC);
    }
}

#if 0
const unk8* sub_8063D38(const unk8* string, unk32* command)
{
    unk32 value;
    unk32 sign;
    unk32 code;
    unk32 done;
    const unk8* cursor;
    unk8 character;

    sign = 0;
    code = 0;
    value = 0;
    done = 0;
    cursor = string;
    cursor++;
    character = cursor[0];
    if (character == '/') {
        sign = 0x80000000;
        cursor++;
    }
    character = cursor[0];
    if ((unk8)(character - 0x30) > 9 && character != '}' && character != 0) {
        code = character << 24;
        cursor++;
    }
    if (done == 0) {
        do {
            character = cursor[0];
            cursor++;
            if (character == '}') {
                break;
            }
            if ((unk8)(character - 0x30) <= 9) {
                value = value * 10 - 0x30 + character;
            } else if (character == '-') {
                sign = 0x80000000;
            }
        } while (done == 0);
    }
    *command = sign | code | value;
    return cursor;
}
#endif
INCLUDE_ASM("asm/dump/8057b80-debug/8063d38.s");

void sub_8063DAC(TeletypeState* state, unk16 value)
{
    SpriteEntry* sprite;
    unk32 count;
    unk32 temp;

    sprite = state->unkEC.prev;
    count = state->unkEC.count;
    for (;;) {
        temp = count;
        count--;
        if (temp == 0) {
            break;
        }
        sprite->y = 0xA000;
        sprite = sprite->next;
    }
    sub_8063AB4(state);
}

void nullsub_16(TeletypeState* state, const unk8* string)
{
}

void nullsub_21(TeletypeState* state, unk8 value)
{
}

void nullsub_22(TeletypeState* state, unk32 value)
{
}

INCLUDE_ASM("asm/dump/8057b80-debug/8063de8.s");

void sub_8063DF0(TeletypeState* state, const FontStyle* config)
{
    state->unk4 = config->unk0;
    state->unk8 = config->unk4;
    state->unkC = 5;
    state->unkD = 0;
    state->unkE = config->unk0->unk5 + 4;
    state->unkC1 = config->unk0->unk4;
    state->unkC2 = config->unk0->unk5;
}
#if 0
typedef struct TeletypeStateDraft TeletypeStateDraft;
typedef void (*TeletypeDraftCallback)(TeletypeStateDraft*, unk32);
typedef void (*TeletypeDraftByteCallback)(TeletypeStateDraft*, unk8);

struct TeletypeStateDraft {
    const unk8* unk0;
    const unk8* unk4;
    unk8 pad08[9];
    unk8 unk11;
    unk8 pad12;
    unk8 unk13;
    unk8 unk14[8];
    unk8 unk1C[0x80];
    unk32 unk9C;
    unk32 unkA0;
    unk32 unkA4;
    unk32 unkA8;
    unk32 unkAC;
    unk32 unkB0;
    unk8 padB4[4];
    unk16 unkB8;
    unk16 unkBA;
    unk16 unkBC;
    unk8 unkBE;
    unk8 padBF;
    unk8 unkC0;
    unk8 padC1[3];
    AllocatedBlock* unkC4;
    SpriteEntry* unkC8;
    unk8 padCC[0x10];
    TeletypeDraftCallback unkDC;
    void (*unkE0)(TeletypeStateDraft*, const unk8*);
    TeletypeDraftByteCallback unkE4;
    void (*unkE8)(TeletypeStateDraft*, unk16);
    SpriteTextBlock unkEC;
};

void sub_8063DF0(TeletypeStateDraft*, const unk8*);
SpriteEntry* sub_8060C1C(SpriteTextBlock*, unk16, unk16);
void nullsub_22(TeletypeStateDraft*, unk32);
void nullsub_16(TeletypeStateDraft*, const unk8*);
void nullsub_21(TeletypeStateDraft*, unk8);
void sub_8063DAC(TeletypeStateDraft*, unk16);

TeletypeStateDraft* sub_8063E18(
    const unk8* arg0,
    const unk8* arg1,
    unk32 arg2,
    unk32 arg3,
    unk32 arg4,
    unk32 arg5,
    unk16 arg6)
{
    AllocatedBlock* block;
    TeletypeStateDraft* state;
    s32 i;
    SpriteEntry* sprite;

    state = NULL;
    block = slowAllocate(0xF8);
    if (block != NULL) {
        state = block->address;
        state->unkC4 = block;
        state->unk0 = arg0;
        state->unk11 = arg2;
        state->unkB8 = arg6;
        state->unk9C = arg3;
        state->unkA0 = arg4;
        state->unkA4 = arg5;
        state->unkA8 = 0;
        state->unkB0 = 0;
        state->unkAC = 0;
        state->unkBE = 0;
        state->unkBC = 0;
        state->unkC0 = 0;
        state->unkBA = 0;
        sub_8063DF0(state, arg1);
        state->unkEC.count = 0;
        state->unkEC.next = NULL;
        state->unkEC.prev = NULL;
        state->unkC8 = sub_8060C1C(&state->unkEC, arg2, 0);
        sprite = state->unkEC.prev;
        i = 0;
        while (i < arg2) {
            LoadSpriteSheet(sprite, state->unk4, 0xF000, 0xA000, 0, 0, 0, 0);
            sprite = sprite->next;
            i++;
        }
        state->unkDC = nullsub_22;
        state->unkE0 = nullsub_16;
        state->unkE4 = nullsub_21;
        state->unkE8 = sub_8063DAC;
        state->unk13 = 0;
        i = 0;
        do {
            state->unk14[i] = arg1[0xA];
            i++;
        } while (i <= 7);
        for (i = 0x7F; i >= 0; i--) {
            state->unk1C[i] = 0;
        }
    }
    return state;
}
#endif
INCLUDE_ASM("asm/dump/8057b80-debug/8063e18.s");
INCLUDE_ASM("asm/dump/8057b80-debug/8063f40.s");

void sub_8063F5C(TeletypeState* state, TeletypeCallback callback)
{
    state->unkDC = callback;
}

void sub_8063F64(TeletypeState* state)
{
    state->unk0 = 0;
    sub_8060CDC(&state->unkEC);
    deallocateBlock(state->unkC4);
}

#if 0
typedef struct TeletypeStateUpdateDraft TeletypeStateUpdateDraft;
typedef void (*TeletypeDraftUpdateCallback)(TeletypeStateUpdateDraft*, unk32);
typedef void (*TeletypeDraftUpdateByteCallback)(TeletypeStateUpdateDraft*, unk8);

struct TeletypeStateUpdateDraft {
    const unk8* unk0;
    unk8 pad04[8];
    unk8 unkC;
    unk8 pad0D[4];
    unk8 unk11;
    unk8 unk12;
    unk8 pad13[9];
    unk8 unk1C[0x80];
    unk8 pad9C[8];
    unk32 unkA4;
    unk8 padA8[4];
    unk32 unkAC;
    unk8 padB0[4];
    unk32 unkB4;
    unk8 padB8[2];
    unk16 unkBA;
    unk16 unkBC;
    unk8 unkBE;
    unk8 padBF;
    unk8 unkC0;
    unk8 padC1[3];
    unk8 padC4[8];
    unk8 padCC[0x10];
    TeletypeDraftUpdateCallback unkDC;
    void (*unkE0)(TeletypeStateUpdateDraft*, const unk8*);
    TeletypeDraftUpdateByteCallback unkE4;
    unk8 padE8[4];
    SpriteTextBlock unkEC;
};

unk32 sub_8063B44(TeletypeStateUpdateDraft*);
void sub_8063BA8(TeletypeStateUpdateDraft*);
void sub_8063CD0(TeletypeStateUpdateDraft*);
const unk8* sub_8063D38(const unk8*, unk32*);
void sub_8064140(TeletypeStateUpdateDraft*);

void sub_8063F84(TeletypeStateUpdateDraft* state)
{
    unk16* loopFlags;
    unk32 process;
    const unk8* current;
    const unk8* cursor;
    unk8 code;
    unk32 value;

    if (state->unkBA == 0) {
        state->unkBA = 8;
    }
    if ((state->unkBA & 8) != 0) {
        process = 1;
        loopFlags = &state->unkBA;
        do {
            current = state->unk0;
            code = current[0];
            cursor = current;
            switch (code) {
            case 0:
                process = 0;
                *loopFlags |= 2;
                break;
            case 0xA:
                if (state->unkE4 != NULL) {
                    state->unkE4(state, state->unkBE);
                }
                sub_8063CD0(state);
                break;
            case 9:
            case 0x20:
                state->unkAC += state->unkC << 8;
                state->unk0 = cursor + 1;
                break;
            case 0x7B:
                state->unk0 = sub_8063D38(cursor, &value);
                if (state->unkDC != NULL) {
                    state->unkDC(state, value);
                }
                break;
            case 0xC:
                process = 0;
                sub_8064140(state);
                break;
            default:
                sub_8063BA8(state);
                process = 0;
                if (state->unkC0 + state->unk12 > state->unk11) {
                    *loopFlags = (*loopFlags & 0xFFF7) | 4;
                } else {
                    if (state->unkAC + state->unkB4 > state->unkA4) {
                        if (state->unkE4 != NULL) {
                            state->unkE4(state, state->unkBE);
                        }
                        sub_8063CD0(state);
                    }
                    *loopFlags = (*loopFlags & 0xFFF7) | 0x10;
                }
                break;
            }
        } while (process != 0);
    }
    if ((state->unkBA & 0x10) != 0) {
        if (state->unkE0 != NULL) {
            state->unkE0(state, state->unk1C);
        }
        if ((sub_8063B44(state) << 24) != 0) {
            state->unkBA = (state->unkBA & 0xFFEF) | 8;
        }
    }
}

#endif
INCLUDE_ASM("asm/dump/8057b80-debug/8063f84.s");

void sub_80640F8(TeletypeState* state)
{
    sub_8063CD0(state);
}

void pushTeletypeStringPalette(TeletypeState* state, unk8 palette)
{
    if (state->unk13 <= 7) {
        state->unk13++;
        state->unk14[state->unk13] = palette;
    } else {
        printf(Str_87567E8);
    }
}

void sub_8064130(TeletypeState* state)
{
    if (state->unk13 != 0) {
        state->unk13--;
    }
}

void sub_8064140(TeletypeState* state)
{
    state->unkBA = (state->unkBA & 0xFFE7) | 4;
    state->unk0++;
}

void sub_806415C(TeletypeState* state)
{
    sub_8063CF4(state);
    state->unkBA = (state->unkBA & 0xFFFB) | 0x10;
}

unk8 sub_806417C(TeletypeState* state)
{
    return (state->unkBA >> 2) & 1;
}

unk8 sub_8064188(TeletypeState* state)
{
    return (state->unkBA >> 1) & 1;
}
