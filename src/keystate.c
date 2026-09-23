#include "keystate.h"

#include <agb/memory_map.h>

#include "debug.h"
#include "memory.h"
#include "unsorted.h"

typedef struct UnkKeyInput {
    unk32 unk0; /* 0x00 */
    unk32 unk4; /* 0x04 */
    unk16 unk8; /* 0x08 */
    unk16 unkA; /* 0x0A */
} UnkKeyInput;

typedef struct UnkKeySource {
    unk16 unk0; /* 0x00 */
    unk8 pad2[2]; /* 0x02 */
} UnkKeySource;

typedef struct UnkKeyConfig {
    void (*unk0)(unk32); /* 0x00 */
    unk16 unk4; /* 0x04 */
    unk16 unk6; /* 0x06 */
    unk16 unk8; /* 0x08 */
    unk8 padA[2]; /* 0x0A */
    unk32 unkC; /* 0x0C */
    unk16* unk10; /* 0x10 */
    UnkKeyInput* unk14; /* 0x14 */
} UnkKeyConfig;

unk16 _keyInput = 0;
unk8 _pad2[2] = { 0 };
unk16 _isKeyRecording = 0;
unk8 _pad_isKeyRecording[10] = { 0 };
KeyState _unk3005CB0[10] = { 0 };
u16 _unk3005DA0 = 0;
unk8 _pad3[2] = { 0 };
unk16 _unk3005DA4 = 0;
unk32 _unk3005DA8 = 0;
unk16 _unk3005DAC = 0;
unk16* _keyRecordingData = NULL;
unk16 _unk3005DB4 = 0;
unk8 _pad4[2] = { 0 };
u16 _unk3005DB8 = 0;
AllocatedBlock* _keyRecordingBlock = 0;

void nullsub_34(void)
{
}

void nullsub_35(void)
{
}

void updateKeyState(void)
{
    unk16 keyState;
    unk16 i;
    s32 mask;

    if (_isKeyRecording == 2) {
        if (_unk3005DB4 != 0) {
            keyState = *_keyRecordingData;
            _keyRecordingData++;
            _unk3005DB4--;
        } else {
            _isKeyRecording = 0;
        }
        _unk3005DA8 = _unk3000E30[0];
    }
    if (_isKeyRecording != 2) {
        keyState = ~*(vu16*)REG_KEYINPUT;
        if ((keyState & 0x3FF) != 0) {
            _unk3005DA8 = _unk3000E30[0];
        }
        if (_isKeyRecording == 1 && _unk3005DB4 != 0) {
            *_keyRecordingData++ = keyState;
            _unk3005DB4--;
        }
    }
    _unk3005DA0 = keyState & ~_keyInput;
    _unk3005DAC = 0;
    _unk3005DA4 = _keyInput;
    _keyInput = keyState;
    for (i = 0; i <= 9; i++) {
        if (((1 << i) & _unk3005DA0) > 0) {
            if (_unk3000E30[0] > _unk3005CB0[i].var04 + _unk3005CB0[i].var0C) {
                _unk3005CB0[i].var10 = 1;
            } else {
                _unk3005CB0[i].var10++;
            }
            _unk3005CB0[i].var14 = _unk3005CB0[i].var00;
            _unk3005CB0[i].var00 = _unk3000E30[0];
        }
        mask = 1 << i;
        if ((mask & _keyInput) > 0) {
            _unk3005CB0[i].var08 = _unk3000E30[0] - _unk3005CB0[i].var00;
        }
        if (((_keyInput >> i) & 1) == 0 && (mask & _unk3005DA4) > 0) {
            unk32 timer;

            _unk3005CB0[i].var04 = timer = _unk3000E30[0];
            _unk3005CB0[i].var08 = timer - _unk3005CB0[i].var00;
            _unk3005DAC |= mask;
        }
    }
}

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

void sub_805A930(UnkKeyInput* arg0, unk16* arg1)
{
    arg0->unk8 = *arg1;
    arg0->unkA = 0;
}

// TODO: fakematch?
void sub_805A93C(UnkKeyConfig* arg0, UnkKeySource* arg1, UnkKeyInput* arg2, unk32 arg3, unk16 arg4,
    void (*arg5)(unk32), unk32 arg6)
{
    UnkKeyInput* input;
    unk16 count;
    unk16 i;

    arg0->unkC = arg6;
    count = arg3;
    arg0->unk4 = 0;
    arg0->unk6 = count;
    arg0->unk10 = &arg1[0].unk0;
    arg0->unk14 = arg2;
    arg0->unk8 = arg4;
    arg0->unk0 = arg5;
    for (i = 0; i < count; i++) {
        input = &arg2[i];
        arg1 = (arg1 + i) - i;
        sub_805A930(input, &arg1[i].unk0);
    }
}

static inline unk8 checkKeyInput(UnkKeyInput* arg0)
{
    if ((_unk3005DA0 & arg0->unk8) != 0) {
        if (arg0->unkA == 0) {
            arg0->unk0 = _unk3000E30[0];
        }
        if (_unk3000E30[0] - arg0->unk0 > 100) {
            arg0->unk0 = _unk3000E30[0];
            arg0->unkA = 0;
        }
        arg0->unkA |= arg0->unk8 & _unk3005DA0;
        if ((arg0->unkA & arg0->unk8) == arg0->unk8 && _unk3000E30[0] - arg0->unk0 <= 65) {
            arg0->unk4 = _unk3000E30[0];
            arg0->unkA = 0;
            return 1;
        }
    }
    return 0;
}

unk8 sub_805A984(UnkKeyConfig* arg0)
{
    s32 index;
    UnkKeyInput* current;
    UnkKeyInput* previous;

    previous = NULL;
    index = arg0->unk4;
    current = &arg0->unk14[index];
    if (index != 0) {
        previous = &arg0->unk14[index - 1];
    }
    if (checkKeyInput(current) != 0) {
        if (previous != NULL) {
            if (arg0->unk8 + previous->unk4 >= current->unk4) {
                index++;
            } else {
                index = 0;
            }
        } else {
            index++;
        }
    }
    if (index >= arg0->unk6) {
        index = 0;
        if (arg0->unk0 != 0) {
            arg0->unk0(arg0->unkC);
        }
        arg0->unk4 = index;
        return 1;
    }
    arg0->unk4 = index;
    return 0;
}

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
    return _unk3000E30[0] - _unk3005DA8;
}

unk8 sub_805AB58(void)
{
    return _isKeyRecording == 2;
}

void sub_805AB6C(void)
{
    s32 count;
    unk16* data;
    unk32 lineCount;

    count = _unk3005DB8;
    lineCount = 0;
    data = _keyRecordingBlock->address;
    while (count-- != 0) {
        printf("0x%x, ", *data);
        if (++lineCount == 30) {
            lineCount = 0;
            printf("\n");
        }
        data++;
    }
}

u16 sub_805ABB4(void)
{
    return _unk3005DB8;
}

unk8 sub_805ABC0(UnkKeyInput* arg0)
{
    return checkKeyInput(arg0);
}
