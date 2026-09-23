#include "iwram.h"
#include "unsorted.h"

extern const s16 Unk_8755F00[][16];
extern const unk8 Unk_8756520[][8];

// TODO: fakematch?
void sub_87577B4(SoundStructA* channel, unk32 arg1, unk32 arg2)
{
    SoundStructE* sample;
    SoundStructE* next;
    s16* destination;
    s8* source;
    unk32 phase;
    unk32 step;
    unk32 scaled;
    s32 mixed;
    s16 orderIndex;
    s32 endDistance;
    unk32 index;
    s32 max;
    s32 position;
    unk8 predictor;
    unk8 value;
    s32 segmentIndex;

    scaled = (channel->var10 * arg2) >> 12;
    phase = channel->var0C;
    destination = _soundMixerPlus;
    source = channel->var04;
    sample = channel->var00;
    step = channel->var08;
    endDistance = source + (arg1 >> 1) - &sample->data[sample->var04];
    if (sample->var00 == 0) {
        if (endDistance > 0) {
            arg1 -= endDistance << 1;
        }
    }

    _unk3005E78++;
    if (_unk3005E78 != 1) {
        if (sample->var00 != 0) {
            if (sample->var00 == 1) {
                if (arg1 != 0) {
                    __asm__ volatile("1:\tldrsb r0, [%1]\n"
                                     "\tldrsh r1, [%3]\n"
                                     "\tadds %0, %0, %4, lsl #4\n"
                                     "\tadc %1, %1, %4, lsr #28\n"
                                     "\tmla r1, r0, %5, r1\n"
                                     "\tstrh r1, [%3], #2\n"
                                     "\tsubs %2, %2, #1\n"
                                     "\tbpl 1b"
                        : "+r"(phase), "+r"(source)
                        : "r"(arg1), "r"(destination), "r"(step), "r"(scaled)
                        : "r0", "r1", "cc", "memory");
                }
            }
        }
    } else if (sample->var00 != 0) {
        if (sample->var00 == 1) {
            if (arg1 != 0) {
                __asm__ volatile("1:\tldrsb r0, [%1]\n"
                                 "\tadds %0, %0, %4, lsl #4\n"
                                 "\tadc %1, %1, %4, lsr #28\n"
                                 "\tmul r0, %5, r0\n"
                                 "\tstrh r0, [%3], #2\n"
                                 "\tsubs %2, %2, #1\n"
                                 "\tbpl 1b"
                    : "+r"(phase), "+r"(source)
                    : "r"(arg1), "r"(destination), "r"(step), "r"(scaled)
                    : "r0", "cc", "memory");
            }
        }
    } else {
        arg1 >>= 1;
        position = channel->var14;
        predictor = channel->var17;
        while (--arg1 != (unk32)-1) {
            max = 0x7FF;
            value = *source++;
            value ^= 0xEC;
            index = value >> 4;
            position += Unk_8755F00[predictor][index];
            if (position > max) {
                position = max;
            }
            if (position < -0x800) {
                position = -0x800;
            }
            mixed = position >> 3;
            mixed *= scaled;
            predictor = Unk_8756520[predictor][index & 7];
            position += Unk_8755F00[predictor][value & 0xF];
            if (position > max) {
                position = max;
            }
            *destination++ = mixed;
            if (position < -0x800) {
                position = -0x800;
            }
            mixed = position >> 3;
            mixed *= scaled;
            predictor = Unk_8756520[predictor][value & 7];
            *destination++ = mixed;
            if (endDistance >= 0 && arg1 == 0 && channel->var1C != 0) {
                orderIndex = channel->var24++;
                segmentIndex = channel->var20[orderIndex];
                if (segmentIndex == -1) {
                    channel->var24 = 1;
                    segmentIndex = channel->var20[0];
                }
                next = channel->var1C[segmentIndex];
                if (segmentIndex == -1) {
                    arg1 = 0;
                } else {
                    arg1 = endDistance;
                    source = next->data;
                    channel->var00 = next;
                }
                endDistance = -1;
                position = 0;
                predictor = 0;
            }
        }
        channel->var17 = predictor;
        channel->var14 = position;
    }

    channel->var0C = phase;
    channel->var04 = source;
}

// TODO: fakematch?
s32 sound_8757A64(unk8* destinationArg, s32 length, s32 offset)
{
    unk8* cursor;
    s16* source;
    s32 sample;
    unk32 hasLength;

    hasLength = length != 0;
    source = _soundMixerPlus + offset;
    cursor = destinationArg;
    sample = 0;
    sample = (s32)cursor;
    if (cursor != NULL && hasLength) {
        if (_unk3005E78 != 0) {
            do {
                sample = *source++;
                sample >>= 4;
                sample = sample < -128 ? (unk32)-128 : sample;
                sample = sample > 127 ? 127 : (s16)sample;
                *cursor++ = sample;
                length--;
            } while (length >= 0);
            return sample;
        } else {
            while (--length != -1) {
                *cursor++ = 0;
            }
        }
    }
    return sample;
}
