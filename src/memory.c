#include "memory.h"

#include "include_asm.h"
#include "ram.h"
#include "unsorted.h"

#define BLOCK_COUNT 0x20
#define EXRAM_SIZE 0x3FC00
#define WRAM_SIZE 19232

#define ewram ((unk8*)0x2000000)

AllocatedBlock* firstExramBlock = NULL;
unk8 (*exram)[EXRAM_SIZE] = NULL;
void* _unk3001158 = NULL;
unk32 exramBlocksUsed = 0;
unk8 wram[WRAM_SIZE] = { 0 };
AllocatedBlock (*wramBlocks)[BLOCK_COUNT] = NULL;
AllocatedBlock* firstWramBlock = NULL;
unk32 wramBlocksUsed = 0;
void* _unk3005C8C = NULL;
AllocatedBlock (*exramBlocks)[BLOCK_COUNT] = NULL;

AllocatedBlock* insertAllocatedBlock(u32 size, unk8* base, unk32 capacity, AllocatedBlock* firstBlock, AllocatedBlock* block, AllocatedBlock** firstBlockPtr);

void initMemoryManagement(void)
{
    unk32 blockSize = sizeof(AllocatedBlock) * BLOCK_COUNT;

    wramBlocksUsed = 0;
    exramBlocksUsed = 0;
    _unk3005C8C = NULL;
    _unk3001158 = NULL;
    firstWramBlock = NULL;
    firstExramBlock = NULL;

    wramBlocks = (AllocatedBlock(*)[BLOCK_COUNT])ewram;
    exramBlocks = (AllocatedBlock(*)[BLOCK_COUNT])(ewram + blockSize);
    exram = (unk8(*)[EXRAM_SIZE])(ewram + blockSize + blockSize);
}

AllocatedBlock* getValidAllocatedBlock(AllocatedBlock (*)[], s32);

AllocatedBlock* fastAllocate(unk32 size)
{
    AllocatedBlock* block;
    AllocatedBlock* block2;

    if (firstWramBlock == NULL) {
        firstWramBlock = &(*wramBlocks)[0];
        wramBlocksUsed = 0;
        _unk3005C8C = NULL;
    }

    block = getValidAllocatedBlock(wramBlocks, BLOCK_COUNT);
    if (block == NULL) {
        printf("Error in fastAllocate(), unable to allocate %i bytes\n", size);
    }

    block2 = insertAllocatedBlock(size, wram, sizeof(wram), firstWramBlock, block, &firstWramBlock);
    if (block2 != NULL) {
        wramBlocksUsed += 1;
    }

    return block2;
}

AllocatedBlock* slowAllocate(unk32 size)
{
    AllocatedBlock* block;
    AllocatedBlock* block2;

    if (firstExramBlock == NULL) {
        firstExramBlock = &(*exramBlocks)[0];
        exramBlocksUsed = 0;
        _unk3001158 = NULL;
    }

    block = getValidAllocatedBlock(exramBlocks, BLOCK_COUNT);
    if (block == NULL) {
        printf("Error in slowAllocate(), unable to allocate %i bytes\n", size);
    }

    block2 = insertAllocatedBlock(size, (unk8*)exram, EXRAM_SIZE, firstExramBlock, block, &firstExramBlock);
    if (block2 != NULL) {
        exramBlocksUsed += 1;
    }

    return block2;
}

void deallocateBlock(AllocatedBlock* block)
{
    AllocatedBlock* nextBlock = block->next;
    AllocatedBlock* previousBlock = block->previous;

    if (block->address == NULL) {
        printf("deallocating block with 0 start\n");
    }

    if (previousBlock == NULL) {
        if (nextBlock == NULL) {
            if (block->address <= (void*)0x203FFFF) {
                firstExramBlock = NULL;
            } else {
                firstWramBlock = NULL;
            }
        } else {
            if (block->address <= (void*)0x203FFFF) {
                firstExramBlock = nextBlock;
            } else {
                firstWramBlock = nextBlock;
            }

            if (nextBlock != NULL) {
                nextBlock->previous = NULL;
            }
        }
    } else {

        previousBlock->next = nextBlock;
        if (nextBlock != NULL) {
            nextBlock->previous = previousBlock;
        }
    }

    if (block->address <= (void*)0x203FFFF) {
        exramBlocksUsed -= 1;
    } else {
        wramBlocksUsed -= 1;
    }

    block->size = 0;
    block->address = NULL;
    block->next = NULL;
    block->previous = NULL;
}

AllocatedBlock* insertAllocatedBlock(u32 size, unk8* base, unk32 capacity, AllocatedBlock* firstBlock, AllocatedBlock* block, AllocatedBlock** firstBlockPtr)
{
    u32 firstGap;
    u32 gap;
    u32 finalGap;
    unk8* end;
    unk8* last;
    unk8* address;
    AllocatedBlock* cur;

    address = firstBlock->address;
    cur = firstBlock;
    firstGap = 0;
    if (address != 0) {
        firstGap = address - base;
    }

    if (firstGap >= size) {
        block->address = base;
        block->previous = NULL;
        block->next = firstBlock;
        block->size = size;
        cur->previous = block;
        *firstBlockPtr = block;
        return block;
    }

    if (cur != NULL) {
        AllocatedBlock* nextBlock;

        end = base + capacity;
        do {
            nextBlock = cur->next;
            if (nextBlock != NULL) {
                gap = (unk8*)nextBlock->address - ((unk8*)cur->address + cur->size);
                if (gap >= size) {
                    block->address = (unk8*)cur->address + cur->size;
                    block->previous = cur;
                    block->next = cur->next;
                    block->size = size;
                    cur->next->previous = block;
                    cur->next = block;
                    return block;
                }
                cur = nextBlock;
            } else {
                if (cur->address != NULL) {
                    last = (unk8*)cur->address + cur->size;
                    finalGap = end - last;
                } else {
                    last = base;
                    finalGap = capacity;
                }
            }
        } while (nextBlock != NULL);
    }

    if (finalGap >= size) {
        block->address = last;
        block->size = size;
        block->next = NULL;
        if (block == cur) {
            block->previous = NULL;
        } else {
            block->previous = cur;
            cur->next = block;
        }
        return block;
    }

    return NULL;
}

AllocatedBlock* getValidAllocatedBlock(AllocatedBlock (*blockList)[], s32 count)
{
    AllocatedBlock* block = &(*blockList)[0];

    while (count-- != 0) {
        if (block->size == 0 && block->address == NULL) {
            return block;
        }

        block++;
    }

    printf("Error in getValidAllocatedBlock(), no further AllocatedBlocks available\n");
    return NULL;
}

void printTotalWramUsage(void)
{
    u32 total = 0;
    AllocatedBlock* block = firstWramBlock;

    while (block != NULL) {
        printf("> %i %i\n", block->size, block->size % 4);
        total += block->size;
        block = block->next;
    }

    printf("Total Wram usage %i, free %i, blocks used %i\n", total, WRAM_SIZE - total, wramBlocksUsed);
}

void printTotalExramUsage(void)
{
    u32 total = 0;
    AllocatedBlock* block = firstExramBlock;

    while (block != NULL) {

        printf("> %i %i\n", block->size, block->size % 4);
        total += block->size;
        block = block->next;
    }

    printf("Total Exram usage %i, free %i, blocks used %i\n", total, EXRAM_SIZE - total, exramBlocksUsed);
}
