#include "keystate.h"
#include "io_reg.h"
#include "memory.h"
#include "unsorted.h"

u16 _keyInput = 0;
u8 _pad2[2] = { 0 };
u16 _isKeyRecording[6] = { 0 };
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

void initKeyState(void)
{
    u8 i;

    _keyInput = ~REG_KEYINPUT;
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

    _isKeyRecording[0] = 0;
}

KeyState* sub_805A914(u8 arg0)
{
    if (arg0 >= 10) {
        return NULL;
    }

    return &_unk3005CB0[arg0];
}

void initKeyRecording(u16 arg0)
{
    u32 bytes;

    _unk3005DB4 = _unk3005DB8 = arg0;

    if (_keyRecordingBlock != NULL) {
        deallocateBlock(_keyRecordingBlock);
        _keyRecordingBlock = NULL;
    }

    bytes = arg0 * 2;
    _keyRecordingBlock = slowAllocate(bytes);
    if (_keyRecordingBlock == NULL) {
        printf("Error allocating %i bytes for key recording\n", bytes);
    }

    _keyRecordingData = _keyRecordingBlock->address;
    _isKeyRecording[0] = 1;
}
