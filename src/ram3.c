#include "keystate.h"
#include "ram.h"
#include "sound.h"
#include "sprite.h"

void* _unk3005DC0 = NULL;
MultiPlayerState* _unk3005DC4 = NULL;
void* _unk3005DC8 = NULL;
void* _SpriteVramFreeList = NULL;
void* _sprites = NULL;
void* _SpriteVramFreeList_block = NULL;
void* _unk3005DD8 = NULL;
void* _rotationScaleBlock = NULL;
void* _spritesBlock = NULL;
void* _unk3005DE4 = NULL;
SpriteRotationScaleEntry* _rotationScale_end = NULL;
void* _spritesLeft = NULL;
SpriteRotationScaleEntry* _rotationScale = NULL;
unk32 _spritesFree = 0;
void* _unk3005DF8 = NULL;
void* _unk3005DFC = NULL;
unk8* _unk3005E00 = NULL;
void* _unk3005E04 = NULL;
s32 _unk3005E08 = 0;
void* _unk3005E0C = NULL;
unk32 _unk3005E10 = 0;
void* _unk3005E14 = NULL;
void* _unk3005E18 = NULL;
void* _soundMixer = NULL;
unk8* _unk3005E20 = NULL;
void* _unk3005E24 = NULL;
SoundStructF (*_unk3005E28)[16] = NULL;
void* _soundMixerBlock = NULL;
void* _soundTableBlock = NULL;
unk8 _pad[12] = { 0 };
unk8 _unk3005E40[12] = { 0 };
void* _unk3005E4C = NULL;
void* _soundMixerPlus = NULL;
void* _actorBlocksHeapPtr = NULL;
void* _unk3005E58 = NULL;
void* _unk3005E5C = NULL;
void* _unk3005E60 = NULL;
void* _unk3005E64 = NULL;
void* _actorsHeapPtr = NULL;
unk32 _unk3005E6C = 0;
unk8 pad_3005E70[4] = { 0 };
unk32 _unk3005E74 = 0;
unk8 _unk3005E78 = 0;
u8 pad_3005E79[7] = { 0 };
unk8 _unk3005E80[24] = { 0 };
unk32 _unk3005E98 = 0;
void* _unk_3005E9C = NULL;
