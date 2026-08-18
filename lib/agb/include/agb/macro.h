#ifndef AGB_MACRO_H
#define AGB_MACRO_H

#include <agb/bios.h>
#include <agb/define.h>
#include <agb/memory_map.h>
#include <agb/types.h>

/* Read/write data */

#define DataRead(Readp, Bit) (*(vu##Bit*)(Readp))

#define DataWrite(Writep, Data, Bit) (*(vu##Bit*)(Writep) = (Data))

#define DataCopy(Readp, Writep, Bit) (*(vu##Bit*)(Writep) = *(vu##Bit*)(Readp))

/* Set interrupt process address */

#define IntrAddrSet(Intrp) (*(vu32*)INTR_VECTOR_BUF = (vu32)Intrp)

/* Set parameters in a DMA controller. A trailing read waits for DMA start. */

#define DmaSet(DmaNo, Srcp, Destp, DmaCntData)                                                     \
    {                                                                                              \
        vu32*(DmaCntp) = (vu32*)REG_DMA##DmaNo;                                                    \
        DmaCntp[0] = (vu32)(Srcp);                                                                 \
        DmaCntp[1] = (vu32)(Destp);                                                                \
        DmaCntp[2] = (vu32)(DmaCntData);                                                           \
        DmaCntp[2];                                                                                \
    }

/* Clear RAM with DMA. The clear data is placed on the stack and copied to the
 * destination. The *If variants raise an interrupt request on completion; the
 * *Array variants clear the entire destination array. */

#define DmaClear(DmaNo, Data, Destp, Size, Bit)                                                    \
    {                                                                                              \
        vu##Bit Tmp = (vu##Bit)(Data);                                                             \
        DmaSet(DmaNo, &Tmp, Destp,                                                                 \
            (DMA_ENABLE | DMA_TIMMING_IMM | DMA_SRC_FIX | DMA_DEST_INC | DMA_##Bit##BIT_BUS        \
                | ((Size) / (Bit / 8))));                                                          \
    }

#define DmaClearIf(DmaNo, Data, Destp, Size, Bit)                                                  \
    {                                                                                              \
        vu##Bit Tmp = (vu##Bit)(Data);                                                             \
        DmaSet(DmaNo, &Tmp, Destp,                                                                 \
            (DMA_ENABLE | DMA_TIMMING_IMM | DMA_IF_ENABLE | DMA_SRC_FIX | DMA_DEST_INC             \
                | DMA_##Bit##BIT_BUS | ((Size) / (Bit / 8))));                                     \
    }

#define DmaArrayClear(DmaNo, Data, Destp, Bit) DmaClear(DmaNo, Data, Destp, sizeof(Destp), Bit)

#define DmaArrayClearIf(DmaNo, Data, Destp, Bit) DmaClearIf(DmaNo, Data, Destp, sizeof(Destp), Bit)

/* Copy with DMA. */

#define DmaCopy(DmaNo, Srcp, Destp, Size, Bit)                                                     \
    DmaSet(DmaNo, Srcp, Destp,                                                                     \
        (DMA_ENABLE | DMA_TIMMING_IMM | DMA_SRC_INC | DMA_DEST_INC | DMA_##Bit##BIT_BUS            \
            | ((Size) / ((Bit) / 8))))

#define DmaCopyIf(DmaNo, Srcp, Destp, Size, Bit)                                                   \
    DmaSet(DmaNo, Srcp, Destp,                                                                     \
        (DMA_ENABLE | DMA_TIMMING_IMM | DMA_IF_ENABLE | DMA_SRC_INC | DMA_DEST_INC                 \
            | DMA_##Bit##BIT_BUS | ((Size) / (Bit / 8))))

#define DmaArrayCopy(DmaNo, Srcp, Destp, Bit) DmaCopy(DmaNo, Srcp, Destp, sizeof(Srcp), Bit)

#define DmaArrayCopyIf(DmaNo, Srcp, Destp, Bit) DmaCopyIf(DmaNo, Srcp, Destp, sizeof(Srcp), Bit)

/* Copy with DMA, synchronized with H blank. */

#define H_DmaCopy(DmaNo, Srcp, Destp, Size, Bit)                                                   \
    DmaSet(DmaNo, Srcp, Destp,                                                                     \
        (DMA_ENABLE | DMA_TIMMING_H_BLANK | DMA_SRC_INC | DMA_DEST_RELOAD | DMA_CONTINUOUS_ON      \
            | DMA_##Bit##BIT_BUS | ((Size) / ((Bit) / 8))))

#define H_DmaCopyIf(DmaNo, Srcp, Destp, Size, Bit)                                                 \
    DmaSet(DmaNo, Srcp, Destp,                                                                     \
        (DMA_ENABLE | DMA_TIMMING_H_BLANK | DMA_IF_ENABLE | DMA_SRC_INC | DMA_DEST_RELOAD          \
            | DMA_CONTINUOUS_ON | DMA_##Bit##BIT_BUS | ((Size) / (Bit / 8))))

#define H_DmaArrayCopy(DmaNo, Srcp, Destp, Bit) H_DmaCopy(DmaNo, Srcp, Destp, sizeof(Srcp), Bit)

#define H_DmaArrayCopyIf(DmaNo, Srcp, Destp, Bit) H_DmaCopyIf(DmaNo, Srcp, Destp, sizeof(Srcp), Bit)

/* Copy with DMA, synchronized with V blank. */

#define V_DmaCopy(DmaNo, Srcp, Destp, Size, Bit)                                                   \
    DmaSet(DmaNo, Srcp, Destp,                                                                     \
        (DMA_ENABLE | DMA_TIMMING_V_BLANK | DMA_SRC_INC | DMA_DEST_INC | DMA_##Bit##BIT_BUS        \
            | ((Size) / (Bit / 8))))

#define V_DmaCopyIf(DmaNo, Srcp, Destp, Size, Bit)                                                 \
    DmaSet(DmaNo, Srcp, Destp,                                                                     \
        (DMA_ENABLE | DMA_TIMMING_V_BLANK | DMA_IF_ENABLE | DMA_SRC_INC | DMA_DEST_INC             \
            | DMA_##Bit##BIT_BUS | ((Size) / (Bit / 8))))

#define V_DmaArrayCopy(DmaNo, Srcp, Destp, Bit) V_DmaCopy(DmaNo, Srcp, Destp, sizeof(Srcp), Bit)

#define V_DmaArrayCopyIf(DmaNo, Srcp, Destp, Bit) V_DmaCopyIf(DmaNo, Srcp, Destp, sizeof(Srcp), Bit)

/* Set up DMA for direct sound. */

#define DmaSound(DmaNo, Srcp, FifoName)                                                            \
    {                                                                                              \
        u8 i;                                                                                      \
        *((u8*)(REG_SOUNDCNT + 3)) |= SOUND_##FifoName##_FIFO_RESET;                               \
        for (i = 0; i < 8; i++)                                                                    \
            *(u32*)REG_FIFO_##FifoName = ((u32*)Srcp)[i];                                          \
        DmaSet(DmaNo, (u32*)Srcp + 8, REG_FIFO_##FifoName,                                         \
            (DMA_ENABLE | DMA_TIMMING_SOUND | DMA_CONTINUOUS_ON | DMA_SRC_INC | DMA_DEST_FIX       \
                | DMA_32BIT_BUS | (4 * 4) / (32 / 8)))                                             \
    }

#define DmaSoundIf(DmaNo, Srcp, FifoName)                                                          \
    {                                                                                              \
        u8 i;                                                                                      \
        *((u8*)(REG_SOUNDCNT + 3)) |= SOUND_##FifoName##_FIFO_RESET;                               \
        for (i = 0; i < 8; i++)                                                                    \
            *(u32*)REG_FIFO_##FifoName = ((u32*)Srcp)[i];                                          \
        DmaSet(DmaNo, (u32*)Srcp + 8, REG_FIFO_##FifoName,                                         \
            (DMA_ENABLE | DMA_TIMMING_SOUND | DMA_IF_ENABLE | DMA_CONTINUOUS_ON | DMA_SRC_INC      \
                | DMA_DEST_FIX | DMA_32BIT_BUS | (4 * 4) / (32 / 8)))                              \
    }

/* Wait for DMA to end. */

#define DmaWait(DmaNo)                                                                             \
    {                                                                                              \
        vu32*(DmaCntp) = (vu32*)REG_DMA##DmaNo;                                                    \
        while (DmaCntp[2] & DMA_ENABLE)                                                            \
            ;                                                                                      \
    }

/* Stop DMA. */

#define DmaStop(DmaNo)                                                                             \
    {                                                                                              \
        vu16*(DmaCntp) = (vu16*)REG_DMA##DmaNo;                                                    \
        DmaCntp[5] &= ~((DMA_TIMMING_MASK | DMA_CONTINUOUS_ON | DMA_DREQ_ON) >> 16);               \
        DmaCntp[5] &= ~(DMA_ENABLE >> 16);                                                         \
        DmaCntp[5];                                                                                \
    }

/* Clear RAM with the CpuSet system call. */

#define CpuClear(Data, Destp, Size, Bit)                                                           \
    {                                                                                              \
        vu##Bit Tmp = (vu##Bit)(Data);                                                             \
        CpuSet((u8*)&(Tmp), (u8*)(Destp),                                                          \
            (DMA_SRC_FIX | DMA_##Bit##BIT_BUS | ((Size) / (Bit / 8) & 0x1fffff)));                 \
    }

#define CpuArrayClear(Data, Destp, Bit) CpuClear(Data, Destp, sizeof(Destp), Bit)

/* Copy with the CpuSet system call. */

#define CpuCopy(Srcp, Destp, Size, Bit)                                                            \
    CpuSet((u8*)(Srcp), (u8*)(Destp),                                                              \
        (DMA_SRC_INC | DMA_##Bit##BIT_BUS | ((Size) / (Bit / 8) & 0x1fffff)))

#define CpuArrayCopy(Srcp, Destp, Bit) CpuCopy(Srcp, Destp, sizeof(Srcp), Bit)

/* Clear RAM with the CpuFastSet system call (8-word units). */

#define CpuFastClear(Data, Destp, Size)                                                            \
    {                                                                                              \
        vu32 Tmp = (vu32)(Data);                                                                   \
        CpuFastSet((u8*)&(Tmp), (u8*)(Destp), (DMA_SRC_FIX | ((Size) / (32 / 8) & 0x1fffff)));     \
    }

#define CpuFastArrayClear(Data, Destp) CpuFastClear(Data, Destp, sizeof(Destp))

/* Copy with the CpuFastSet system call (8-word units). */

#define CpuFastCopy(Srcp, Destp, Size)                                                             \
    CpuFastSet((u8*)(Srcp), (u8*)(Destp), (DMA_SRC_INC | ((Size) / (32 / 8) & 0x1fffff)))

#define CpuFastArrayCopy(Srcp, Destp) CpuFastCopy(Srcp, Destp, sizeof(Srcp))

#endif /* AGB_MACRO_H */
