#include "keystate.h"

#include <agb/memory_map.h>

#include "debug.h"
#include "include_asm.h"
#include "memory.h"
#include "unsorted.h"

typedef struct UnkKeyInput {
    unk32 unk0; /* 0x00 */
    unk32 unk4; /* 0x04 */
    unk16 unk8; /* 0x08 */
    unk16 unkA; /* 0x0A */
} UnkKeyInput;

u16 _keyInput = 0;
u8 _pad2[2] = { 0 };
u16 _isKeyRecording = 0;
u8 _pad_isKeyRecording[10] = { 0 };
KeyState _unk3005CB0[10] = { 0 };
u16 _unk3005DA0 = 0;
u8 _pad3[2] = { 0 };
u16 _unk3005DA4 = 0;
void* _unk3005DA8 = NULL;
u16 _unk3005DAC = 0;
void* _keyRecordingData = NULL;
u16 _unk3005DB4 = 0;
u8 _pad4[2] = { 0 };
u16 _unk3005DB8 = 0;
AllocatedBlock* _keyRecordingBlock = 0;

void nullsub_34(void)
{
}

void nullsub_35(void)
{
}

INCLUDE_ASM("asm/dump/8057b80-debug/805a6b8-updateKeyState.s");

void initKeyState(void)
{
    u8 i;

    _keyInput = ~*(vu16*)REG_KEYINPUT;
    _unk3005DA0 = _keyInput;
    _unk3005DAC = 0;
    _unk3005DA4 = _keyInput;
    _keyRecordingBlock = NULL;
    _keyRecordingData = NULL;

    for (i = 0; i < 10; i++) {
        _unk3005CB0[i].var00 = 0;
        _unk3005CB0[i].var04 = 0;
        _unk3005CB0[i].var14 = 0;
        _unk3005CB0[i].var0C = 100;
        _unk3005CB0[i].var08 = 0;
        _unk3005CB0[i].var10 = 0;
    }

    _isKeyRecording = 0;
}

KeyState* sub_805A914(u8 arg0)
{
    if (arg0 >= 10) {
        return NULL;
    }

    return &_unk3005CB0[arg0];
}

void sub_805A930(UnkKeyInput* arg0, u16* arg1)
{
    arg0->unk8 = *arg1;
    arg0->unkA = 0;
}

INCLUDE_ASM("asm/dump/8057b80-debug/805a93c.s");
INCLUDE_ASM("asm/dump/8057b80-debug/805a984.s");

void initKeyRecording(u16 arg0)
{
    _unk3005DB4 = _unk3005DB8 = arg0;

    if (_keyRecordingBlock != NULL) {
        deallocateBlock(_keyRecordingBlock);
        _keyRecordingBlock = NULL;
    }

    _keyRecordingBlock = slowAllocate(arg0 * 2);
    if (_keyRecordingBlock == NULL) {
        printf("Error allocating %i bytes for key recording\n", arg0 * 2);
    }

    _keyRecordingData = _keyRecordingBlock->address;
    _isKeyRecording = 1;
}

void sub_805AAB4(void)
{
    _unk3005DB8 -= _unk3005DB4;
    _unk3005DB4 = 0;
}

void sub_805AAD4(void)
{
    _isKeyRecording = 1;
}

void sub_805AAE0(void)
{
    _isKeyRecording = 0;
}

void sub_805AAEC(void* arg0, u16 arg1)
{
    if (arg0 != NULL) {
        _keyRecordingData = arg0;
        _unk3005DB4 = arg1;
    } else {
        _keyRecordingData = _keyRecordingBlock->address;
        _unk3005DB4 = _unk3005DB8;
    }
    _isKeyRecording = 2;
}

void sub_805AB38(void)
{
    _isKeyRecording = 0;
}

unk32 sub_805AB44(void)
{
    return _unk3000E30[0] - (unk32)_unk3005DA8;
}

unk32 sub_805AB58(void)
{
    return _isKeyRecording == 2;
}

INCLUDE_ASM("asm/dump/8057b80-debug/805ab6c.s");

u16 sub_805ABB4(void)
{
    return _unk3005DB8;
}

INCLUDE_ASM("asm/dump/8057b80-debug/805abc0.s");
