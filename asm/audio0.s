    .include "asm/common.inc"

Sfx_800FF7C:
    .incbin "data/audio/sfx-800ff7c.pcm"
Sfx_80123F4:
    .incbin "data/audio/sfx-80123f4.pcm"
Sfx_80134C4:
    .incbin "data/audio/sfx-80134c4.pcm"
Sfx_8013FB4:
    .incbin "data/audio/sfx-8013fb4.pcm"
Sfx_80161A0:
    .incbin "data/audio/sfx-80161a0.pcm"
Sfx_8018F70:
    .incbin "data/audio/sfx-8018f70.pcm"
Sfx_801C760:
    .incbin "data/audio/sfx-801c760.pcm"
Sfx_801D4C4:
    .incbin "data/audio/sfx-801d4c4.pcm"
Sfx_8023A94:
    .incbin "data/audio/sfx-8023a94.pcm"
Sfx_8026EC4:
    .incbin "data/audio/sfx-8026ec4.pcm"
Sfx_8028C44:
    .incbin "data/audio/sfx-8028c44.pcm"
Sfx_802B904:
    .incbin "data/audio/sfx-802b904.pcm"
Sfx_802E3CC:
    .incbin "data/audio/sfx-802e3cc.pcm"
Sfx_8030EDC:
    .incbin "data/audio/sfx-8030edc.pcm"
Sfx_8034AB0:
    .incbin "data/audio/sfx-8034ab0.pcm"
Sfx_8037A80:
    .incbin "data/audio/sfx-8037a80.pcm"
Sfx_803DB94:
    .incbin "data/audio/sfx-803db94.pcm"

global dword_8040CC4
    .4byte 0
    .4byte 17
    .4byte off_8040CD4
    .4byte off_8040CD4

off_8040CD4:
    .4byte Sfx_800FF7C
    .4byte Sfx_80123F4
    .4byte Sfx_80134C4
    .4byte Sfx_8013FB4
    .4byte Sfx_80161A0
    .4byte Sfx_8018F70
    .4byte Sfx_801C760
    .4byte Sfx_801D4C4
    .4byte Sfx_8023A94
    .4byte Sfx_8026EC4
    .4byte Sfx_8028C44
    .4byte Sfx_802B904
    .4byte Sfx_802E3CC
    .4byte Sfx_8030EDC
    .4byte Sfx_8034AB0
    .4byte Sfx_8037A80
    .4byte Sfx_803DB94
