#include "rider.h"

#include "actor.h"
#include "geometry.h"
#include "include_asm.h"
#include "memory.h"
#include "particle.h"
#include "riderphysics.h"
#include "sprite.h"

INCLUDE_ASM("asm/dump/804a388-tutorial/804b07c-initRider.s");

void processRiderMetadata(RiderBase* rider, LevelGeometryAddresses* geometry, unk32 lineIndex)
{
    LineMetadata* metadata;
    LineMetaObject* metaobject;
    RiderBase* riderBase;
    unk32 value;
    unk16 metaId;
    s32 i;

    riderBase = rider;
    metadata = GetLineMetaData(geometry, lineIndex);
    if (metadata != NULL) {
        metaobject = getLineMetaobjectByTypeAndId(geometry, metadata, 1, 0xD368);
        if (metaobject != NULL) {
            riderBase->unk228 = metaobject->unk8.word;
        }

        metaobject = getLineMetaobjectByTypeAndId(geometry, metadata, 1, 0x6ACE);
        if (metaobject != NULL) {
            riderBase->unk22A = metaobject->unk8.word;
        }

        metaobject = getLineMetaobjectByTypeAndId(geometry, metadata, 1, 0x5BBE);
        if (metaobject != NULL) {
            value = metaobject->unk8.word;
            riderBase->unk52 = value;
            riderBase->unk50 = value;
        }

        metaobject = getLineMetaobjectByTypeAndId(geometry, metadata, 1, 0x215D);
        if (metaobject != NULL) {
            riderBase->unk210 = metaobject->unk8.word * metaobject->unk8.word;
        }

        metaobject = getLineMetaobjectByTypeAndId(geometry, metadata, 1, 0x3AB4);
        if (metaobject != NULL) {
            riderBase->unk21C = metaobject->unk8.word;
        }

        metaobject = getLineMetaobjectByTypeAndId(geometry, metadata, 1, 0x505B);
        if (metaobject != NULL) {
            riderBase->unk222 = metaobject->unk8.word;
        }

        metaobject = getLineMetaobjectByTypeAndId(geometry, metadata, 3, 0x59C3);
        if (metaobject != NULL) {
            metaId = metaobject->unk8.half;
            i = 0;
            while (i < geometry->unk0->count.splineCountWord) {
                if (geometry->unk14[i]->unkC == metaId) {
                    riderBase->unk218 = i;
                }
                i++;
            }
        }

        metaobject = getLineMetaobjectByTypeAndId(geometry, metadata, 1, 0xCF2C);
        if (metaobject != NULL) {
            riderBase->unk21A = metaobject->unk8.word;
        }

        metaobject = getLineMetaobjectByTypeAndId(geometry, metadata, 1, 0xD271);
        if (metaobject != NULL) {
            SetRiderFlag(riderBase, 8);
        }

        metaobject = getLineMetaobjectByTypeAndId(geometry, metadata, 1, 0x37AE);
        if (metaobject != NULL) {
            rider->unk424 = metaobject->unk8.word;
        }

        metaobject = getLineMetaobjectByTypeAndId(geometry, metadata, 1, 0xF0F8);
        if (metaobject != NULL) {
            rider->unk3D0 = metaobject->unk8.word;
        }

        metaobject = getLineMetaobjectByTypeAndId(geometry, metadata, 1, 0x5CF);
        if (metaobject != NULL) {
            riderBase->unk22C = metaobject->unk8.word;
        }
    }
}

void sub_804B4A4(RiderBase* arg0)
{
    sub_80588A8(&arg0->unk238);
    sub_80588A8(&arg0->unk2FC);
    if (arg0->unk420 != NULL) {
        deallocateBlock(arg0->unk420);
        arg0->unk420 = NULL;
    }
    if (arg0->unk3E8 != 0) {
        sub_804EBE8(&arg0->unk3EC);
    }
    if (arg0->unk3C4 != 0) {
        sub_8060A94(arg0->unk3C4);
    }
}

INCLUDE_ASM("asm/dump/804a388-tutorial/804b4fc.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/804b5c0.s");

void nullsub_1(void)
{
}

INCLUDE_ASM("asm/dump/804a388-tutorial/804b624.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/804b754.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/804b7fc.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/804b8f0.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/804bbf0-renderRider.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/804bedc-allocFXSprite.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/804bf3c.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/804c098.s");
INCLUDE_ASM("asm/dump/804a388-tutorial/804c0c0.s");

void sub_804C0EC(RiderTemp* rider, unk8 arg1)
{
    if (arg1 != 0) {
        rider->unk3CC |= 8;
    } else {
        rider->unk3CC &= 0xFFF7;
    }
}

INCLUDE_ASM("asm/dump/804a388-tutorial/804c118.s");

void nullsub_2(void)
{
}

void nullsub_3(void)
{
}

void nullsub_4(void)
{
}

asm(".align 2, 0\n");
