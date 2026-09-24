#include "music.h"

#include "debug.h"
#include "include_asm.h"
#include "ram.h"
#include "sound.h"

extern SoundStructE Bgm_807DC80;
extern SoundStructE Bgm_80BE210;
extern SoundStructE Bgm_810B9A0;
extern SoundStructE Bgm_810CAB0;
extern SoundStructE Bgm_810DBC0;
extern SoundStructE Bgm_810ECD0;
extern SoundStructE Bgm_810FDE0;
extern SoundStructE Bgm_8111FF0;
extern SoundStructE Bgm_8113980;
extern SoundStructE Bgm_8115310;
extern SoundStructE Bgm_8115BA0;
extern SoundStructE Bgm_8117DB0;
extern SoundStructE Bgm_8118EC0;
extern SoundStructE Bgm_81205D0;
extern SoundStructE Bgm_81216E0;
extern SoundStructE Bgm_8125AF0;
extern SoundStructE Bgm_8126C00;
extern SoundStructE Bgm_8129F10;
extern SoundStructE Bgm_812D220;
extern SoundStructE Bgm_812F5D4;
extern SoundStructE Bgm_8131988;
extern SoundStructE Bgm_8138D70;
extern SoundStructE Bgm_813A83C;
extern SoundStructE Bgm_813C308;
extern SoundStructE Bgm_813E6BC;
extern SoundStructE Bgm_8140A70;
extern SoundStructE Bgm_8141C54;
extern SoundStructE Bgm_8142E38;
extern SoundStructE Bgm_814401C;
extern SoundStructE Bgm_814B404;
extern SoundStructE Bgm_814CED0;
extern SoundStructE Bgm_814E99C;
extern SoundStructE Bgm_8150D50;
extern SoundStructE Bgm_8153104;
extern SoundStructE Bgm_81554B8;
extern SoundStructE Bgm_8159C10;
extern SoundStructE Bgm_8162AB4;
extern SoundStructE Bgm_8164E68;
extern SoundStructE Bgm_8166DCC;
extern SoundStructE Bgm_8167D88;
extern SoundStructE Bgm_816C414;
extern SoundStructE Bgm_816EB4C;
extern SoundStructE Bgm_816FB08;
extern SoundStructE Bgm_8172240;
extern SoundStructE Bgm_81760F4;
extern SoundStructE Bgm_8179FA8;
extern SoundStructE Bgm_817DE5C;
extern SoundStructE Bgm_8185BB8;
extern SoundStructE Bgm_8187B1C;
extern SoundStructE Bgm_8188AD8;
extern SoundStructE Bgm_8189A94;
extern SoundStructE Bgm_818AA50;
extern SoundStructE Bgm_818C9B4;
extern SoundStructE Bgm_818E144;
extern SoundStructE Bgm_819087C;
extern SoundStructE Bgm_8191064;
extern SoundStructE Bgm_8192020;
extern SoundStructE Bgm_8193058;
extern SoundStructE Bgm_81968F0;
extern SoundStructE Bgm_8197114;
extern SoundStructE Bgm_8197938;
extern SoundStructE Bgm_819B9E4;
extern SoundStructE Bgm_81A12C8;
extern SoundStructE Bgm_81A3B38;
extern SoundStructE Bgm_81A63A8;
extern SoundStructE Bgm_81A8408;
extern SoundStructE Bgm_81AA468;
extern SoundStructE Bgm_81AC4C8;
extern SoundStructE Bgm_81B0574;
extern SoundStructE Bgm_81B15AC;
extern SoundStructE Bgm_81B847C;
extern SoundStructE Bgm_81BA978;
extern SoundStructE Bgm_81BC538;
extern SoundStructE Bgm_81C4FB8;
extern SoundStructE Bgm_81C5904;
extern SoundStructE Bgm_81C6B8C;
extern SoundStructE Bgm_81C7E14;
extern SoundStructE Bgm_81CA310;
extern SoundStructE Bgm_81CB598;
extern SoundStructE Bgm_81CC820;
extern SoundStructE Bgm_81CED1C;
extern SoundStructE Bgm_81CFFA4;
extern SoundStructE Bgm_81D122C;
extern SoundStructE Bgm_81D24B4;
extern SoundStructE Bgm_81D373C;
extern SoundStructE Bgm_81D49C4;
extern SoundStructE Bgm_81D5C4C;
extern SoundStructE Bgm_81D6598;
extern SoundStructE Bgm_81DDDA0;
extern SoundStructE Bgm_81DF960;
extern SoundStructE Bgm_81E0BE8;
extern SoundStructE Bgm_81E1E70;
extern SoundStructE Bgm_81E30F8;
extern SoundStructE Bgm_81E55F4;
extern SoundStructE Bgm_81E687C;
extern SoundStructE Bgm_81E7B04;
extern SoundStructE Bgm_81EA000;
extern SoundStructE Bgm_81EC4FC;
extern SoundStructE Bgm_81ED784;
extern SoundStructE Bgm_81EEA0C;
extern SoundStructE Bgm_81EFC94;
extern SoundStructE Bgm_81F2190;
extern SoundStructE Bgm_81F9EEC;
extern SoundStructE Bgm_81FBE50;
extern SoundStructE Bgm_81FD5E0;
extern SoundStructE Bgm_81FED70;
extern SoundStructE Bgm_8200CD4;
extern SoundStructE Bgm_8208A30;
extern SoundStructE Bgm_820C8E4;
extern SoundStructE Bgm_8214640;
extern SoundStructE Bgm_821AAD0;

static SoundStructE* BgmA_segments[] = {
    &Bgm_807DC80,
};

static s16 BgmA_order[] = { 0, -1 };

static SoundStructE* BgmB_segments[] = {
    &Bgm_80BE210,
};

static s16 BgmB_order[] = { 0, -1 };

static SoundStructE* Bgm0_segments[] = {
    &Bgm_810B9A0,
    &Bgm_810CAB0,
    &Bgm_810DBC0,
    &Bgm_810ECD0,
    &Bgm_810FDE0,
    &Bgm_8111FF0,
    &Bgm_8113980,
    &Bgm_8115310,
    &Bgm_8115BA0,
    &Bgm_8117DB0,
    &Bgm_8118EC0,
    &Bgm_81205D0,
    &Bgm_81216E0,
    &Bgm_8125AF0,
    &Bgm_8126C00,
    &Bgm_8129F10,
};

static s16 Bgm0_order[] = { 0, 1, 2, 1, 0, 1, 2, 3, 4, 7, 5, 4, 7, 6, 4, 8, 4, 7, 6, 9, 10, 11, 10,
    4, 7, 5, 4, 7, 6, 4, 8, 4, 7, 6, 12, 13, 14, 12, 13, 14, 12, 13, 14, 12, 13, 15, -1 };

static SoundStructE* Bgm1_segments[] = {
    &Bgm_812D220,
    &Bgm_812F5D4,
    &Bgm_8131988,
    &Bgm_8138D70,
    &Bgm_813A83C,
    &Bgm_813C308,
    &Bgm_813E6BC,
    &Bgm_8140A70,
    &Bgm_8141C54,
    &Bgm_8142E38,
    &Bgm_814401C,
    &Bgm_814B404,
    &Bgm_814CED0,
    &Bgm_814E99C,
    &Bgm_8150D50,
    &Bgm_8153104,
    &Bgm_81554B8,
    &Bgm_8159C10,
    &Bgm_8162AB4,
};

static s16 Bgm1_order[] = { 0, 0, 0, 1, 2, 3, 2, 3, 2, 4, 5, 6, 6, 7, 8, 5, 6, 6, 7, 8, 5, 6, 6, 7,
    8, 5, 6, 6, 7, 9, 10, 11, 10, 12, 5, 6, 6, 7, 8, 5, 6, 6, 7, 9, 13, 14, 15, 14, 13, 14, 15, 14,
    16, 17, 17, 16, 18, -1 };

static SoundStructE* Bgm2_segments[] = {
    &Bgm_8164E68,
    &Bgm_8166DCC,
    &Bgm_8167D88,
    &Bgm_816C414,
    &Bgm_816EB4C,
    &Bgm_816FB08,
    &Bgm_8172240,
    &Bgm_81760F4,
    &Bgm_8179FA8,
    &Bgm_817DE5C,
    &Bgm_8185BB8,
    &Bgm_8187B1C,
    &Bgm_8188AD8,
    &Bgm_8189A94,
    &Bgm_818AA50,
    &Bgm_818C9B4,
    &Bgm_818E144,
    &Bgm_819087C,
    &Bgm_8191064,
};

static s16 Bgm2_order[] = { 0, 1, 2, 3, 4, 2, 5, 6, 7, 6, 8, 1, 2, 3, 4, 2, 5, 9, 10, 11, 12, 11,
    12, 11, 13, 14, 15, 16, 15, 17, 14, 15, 16, 15, 17, 18, -1 };

static SoundStructE* Bgm3_segments[] = {
    &Bgm_8192020,
    &Bgm_8193058,
    &Bgm_81968F0,
    &Bgm_8197114,
    &Bgm_8197938,
    &Bgm_819B9E4,
    &Bgm_81A12C8,
    &Bgm_81A3B38,
    &Bgm_81A63A8,
    &Bgm_81A8408,
    &Bgm_81AA468,
    &Bgm_81AC4C8,
    &Bgm_81B0574,
};

static s16 Bgm3_order[] = { 0, 1, 2, 1, 3, 1, 2, 1, 3, 4, 4, 4, 4, 5, 6, 5, 7, 4, 4, 4, 4, 8, 9, 10,
    9, 8, 9, 11, 12, -1 };

static SoundStructE* Bgm4_segments[] = {
    &Bgm_81B15AC,
    &Bgm_81B847C,
    &Bgm_81BA978,
    &Bgm_81BC538,
    &Bgm_81C4FB8,
    &Bgm_81C5904,
    &Bgm_81C6B8C,
    &Bgm_81C7E14,
    &Bgm_81CA310,
    &Bgm_81CB598,
    &Bgm_81CC820,
    &Bgm_81CED1C,
    &Bgm_81CFFA4,
    &Bgm_81D122C,
    &Bgm_81D24B4,
    &Bgm_81D373C,
    &Bgm_81D49C4,
    &Bgm_81D5C4C,
    &Bgm_81D6598,
    &Bgm_81DDDA0,
    &Bgm_81DF960,
    &Bgm_81E0BE8,
    &Bgm_81E1E70,
    &Bgm_81E30F8,
    &Bgm_81E55F4,
    &Bgm_81E687C,
    &Bgm_81E7B04,
    &Bgm_81EA000,
    &Bgm_81EC4FC,
    &Bgm_81ED784,
    &Bgm_81EEA0C,
    &Bgm_81EFC94,
};

static s16 Bgm4_order[] = { 0, 1, 0, 2, 3, 4, 3, 5, 6, 7, 8, 9, 10, 11, 6, 7, 8, 9, 10, 12, 13, 7,
    14, 15, 10, 12, 13, 7, 14, 15, 10, 16, 17, 18, 19, 18, 20, 21, 22, 22, 23, 24, 24, 25, 21, 22,
    22, 23, 24, 24, 25, 21, 22, 22, 23, 24, 24, 25, 26, 27, 27, 27, 28, 29, 28, 29, 28, 29, 28, 30,
    13, 7, 14, 15, 10, 12, 13, 7, 14, 15, 10, 16, 17, 18, 19, 18, 20, 31, -1 };

static SoundStructE* Bgm5_segments[] = {
    &Bgm_81F2190,
    &Bgm_81F9EEC,
    &Bgm_81FBE50,
    &Bgm_81FD5E0,
    &Bgm_81FED70,
    &Bgm_8200CD4,
    &Bgm_8208A30,
    &Bgm_820C8E4,
};

static s16 Bgm5_order[] = { 0, 0, 1, 2, 1, 2, 1, 2, 1, 3, 1, 2, 1, 2, 1, 2, 1, 2, 4, 5, 5, 6, 6, 6,
    6, 0, 0, 7, 7, 1, 2, 1, 2, 1, 2, 1, 3, 1, 2, 1, 2, 1, 2, 1, 2, 4, 5, 5, -1 };

static SoundStructE* Bgm6_segments[] = {
    &Bgm_8214640,
    &Bgm_821AAD0,
};

static s16 Bgm6_order[] = { 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
    1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
    1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
    1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
    1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
    1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
    1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
    1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
    1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
    1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
    1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
    1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
    1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
    1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
    1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
    1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
    1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
    1, 1, 1, 1, 1, -1 };

MusicTrack _807561C[] = {
    { &Bgm0_segments, &Bgm0_order },
    { &Bgm1_segments, &Bgm1_order },
    { &Bgm2_segments, &Bgm2_order },
    { &Bgm3_segments, &Bgm3_order },
    { &Bgm4_segments, &Bgm4_order },
    { &Bgm5_segments, &Bgm5_order },
    { &Bgm6_segments, &Bgm6_order },
    { &BgmA_segments, &BgmA_order },
    { &BgmB_segments, &BgmB_order },
    { &BgmA_segments, &BgmA_order },
    { &BgmB_segments, &BgmB_order },
    { &BgmA_segments, &BgmA_order },
    { &BgmB_segments, &BgmB_order },
    { &BgmA_segments, &BgmA_order },
    { &BgmB_segments, &BgmB_order },
    { &BgmA_segments, &BgmA_order },
    { &BgmB_segments, &BgmB_order },
    { &BgmA_segments, &BgmA_order },
    { &BgmB_segments, &BgmB_order },
    { &BgmA_segments, &BgmA_order },
    { &BgmB_segments, &BgmB_order },
    { &BgmA_segments, &BgmA_order },
    { &BgmB_segments, &BgmB_order },
    { &BgmA_segments, &BgmA_order },
    { &BgmB_segments, &BgmB_order },
    { &BgmA_segments, &BgmA_order },
    { &BgmB_segments, &BgmB_order },
    { &BgmA_segments, &BgmA_order },
    { &BgmB_segments, &BgmB_order },
    { &BgmA_segments, &BgmA_order },
    { &BgmB_segments, &BgmB_order },
    { &BgmA_segments, &BgmA_order },
    { &BgmB_segments, &BgmB_order },
    { &BgmA_segments, &BgmA_order },
};

void sub_804ABFC(unk32 arg0)
{
    switch (arg0) {
    case 2:
        sub_804AE34(7, 60);
        break;
    case 11:
        sub_804AE34(3, 60);
        break;
    case 3:
        sub_804AE34(6, 60);
        break;
    case 0:
        sub_804AE34(6, 60);
        break;
    case 1:
        if ((sub_8057C40() >> 4) & 1) {
            sub_804AE34(8, 60);
        } else {
            sub_804AE34(9, 60);
        }
        break;
    case 4:
        sub_804AE34(4, 60);
        break;
    case 9:
        sub_804AE34(1, 60);
        break;
    case 5:
        sub_804AE34(5, 60);
        break;
    case 7:
        sub_804AE34(2, 60);
        break;
    case 8:
        sub_804AE34(0, 60);
        break;
    case 10:
        sub_804AF04(6);
        break;
    case 12:
        sub_804AE34(10, 60);
        sub_804AD44();
        break;
    case 13:
        sub_804AE34(11, 60);
        break;
    case 14:
        sub_804AE34(12, 60);
        break;
    case 15:
        sub_804AE34(13, 60);
        sub_804AD50();
        break;
    case 17:
        sub_804AE34(15, 60);
        break;
    case 19:
        sub_804AE34(14, 60);
        break;
    case 16:
        sub_804AE34(16, 64);
        break;
    case 20:
        sub_804AE34(12, 50);
        break;
    }
}

void sub_804ACF0(void)
{
    _unk3000F18 = _currentGameState->unk6E4;
    _unk3000F14 = _currentGameState->unk6E6;
    _unk3000F1C = 0;
}

void sub_804AD28(void)
{
    sub_804AFD4((u16)_unk3000F14); // TODO: figure out how to remove cast
    _unk3000F1C = 0;
}

void sub_804AD44(void)
{
    _unk3000F1C = 1;
}

void sub_804AD50(void)
{
    _unk3000F1C = -0x18;
}

unk32 sub_804AD60(void)
{
    return _unk3000F1C != 0;
}

void sub_804AD74(void)
{
    s32 upper;
    s32 lower;
    s16 value;

    upper = _currentGameState->unk6E4 + _unk3000F1C;
    lower = _currentGameState->unk6E6 + _unk3000F1C;
    value = _unk3000F1C;
    if (value < 0) {
        if (upper < 0) {
            upper = 0;
        }
        if (lower < 0) {
            lower = 0;
        }
        if (_currentGameState->unk6E6 != 0) {
            sub_804AFD4((unk16)lower);
        }
        if (upper == 0 && lower == 0) {
            _unk3000F1C = lower;
        }
    }
    value = _unk3000F1C;
    if (value > 0) {
        if (upper > _unk3000F18) {
            upper = _unk3000F18;
        }
        if (lower > _unk3000F14) {
            lower = _unk3000F14;
        }
        if (_currentGameState->unk6E6 < _unk3000F14) {
            sub_804AFD4((unk16)lower);
        }
        if (upper == _unk3000F18 && lower == _unk3000F14) {
            _unk3000F1C = 0;
        }
    }
}

void nullsub_40(void)
{
}

void sub_804AE34(unk32 arg0, unk32 arg1)
{
    sub_804AE8C();
    if (_currentGameState->unk6E4 != 0) {
        _gameData->unkC24 = arg0;
        _gameData->unkC28 = Sound_8062BFC(arg0, arg1);
        Sound_8062AD4(_gameData->unkC28, _currentGameState->unk6E4);
    }
}

void sub_804AE8C(void)
{
    if (_gameData->unkC24 != -1) {
        Sound_8062A90(_gameData->unkC28);
    }
    _gameData->unkC24 = -1;
}

void sub_804AECC(unk32 arg0)
{
    if (_gameData->unkC24 != -1) {
        Sound_8062AF4(_gameData->unkC28, arg0);
    }
}

void sub_804AF04(unk32 arg0)
{
    unk32 index;

    index = arg0;
    sub_804AF5C();
    _gameData->unkC26 = index;
    _gameData->unkC2C = Sound_8062990(_807561C[index].first, _807561C[index].second);
    Sound_8062AD4(_gameData->unkC2C, _currentGameState->unk6E6);
}

void sub_804AF5C(void)
{
    if (_gameData->unkC26 != -1) {
        Sound_8062A90(_gameData->unkC2C);
    }
    _gameData->unkC26 = -1;
}

void sub_804AF9C(void)
{
    Sound_8062AA4(_gameData->unkC2C);
}

void sub_804AFB8(void)
{
    Sound_8062AB8(_gameData->unkC2C);
}

void sub_804AFD4(unk32 arg0)
{
    u16 volume = arg0;

    Sound_8062AD4(_gameData->unkC2C, volume);
    _currentGameState->unk6E6 = volume;
}

void sub_804B00C(unk32 arg0)
{
    u16 volume = arg0;

    Sound_8062AD4(_gameData->unkC28, volume);
    _currentGameState->unk6E4 = volume;
}

void sub_804B044(void)
{
    Sound_8062AA4(_gameData->unkC28);
}

void sub_804B060(void)
{
    Sound_8062AB8(_gameData->unkC28);
}
