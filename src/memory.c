#include "memory.h"

#include "include_asm.h"
#include "ram.h"
#include "unsorted.h"

#define BLOCK_COUNT 0x20
#define EXRAM_SIZE 0x3FC00
#define WRAM_SIZE 19232

#define ewram ((unk8*)0x2000000)

AllocatedBlock* _nextExramBlock = NULL;
unk8 (*_exram)[EXRAM_SIZE] = NULL;
void* _unk3001158 = NULL;
unk32 _exramBlocksUsed = 0;
unk8 _wram[WRAM_SIZE] = { 0 };
AllocatedBlock (*_wramBlocks)[BLOCK_COUNT] = NULL;
AllocatedBlock* _nextWramBlock = NULL;
unk32 _wramBlocksUsed = 0;
void* _unk3005C8C = NULL;
AllocatedBlock (*_exramBlocks)[BLOCK_COUNT] = NULL;

AllocatedBlock* sub_805A53C(u32 size, unk8* base, unk32 capacity, AllocatedBlock* current,
    AllocatedBlock* block, AllocatedBlock** nextBlockPtr);

void initBlockVariables(void)
{
    unk32 blockSize = sizeof(AllocatedBlock) * BLOCK_COUNT;

    _wramBlocksUsed = 0;
    _exramBlocksUsed = 0;
    _unk3005C8C = NULL;
    _unk3001158 = NULL;
    _nextWramBlock = NULL;
    _nextExramBlock = NULL;

    _wramBlocks = (AllocatedBlock(*)[BLOCK_COUNT])ewram;
    _exramBlocks = (AllocatedBlock(*)[BLOCK_COUNT])(ewram + blockSize);
    _exram = (unk8(*)[EXRAM_SIZE])(ewram + blockSize + blockSize);
}

AllocatedBlock* getValidAllocatedBlock(AllocatedBlock (*)[], s32);

AllocatedBlock* fastAllocate(unk32 size)
{
    AllocatedBlock* block;
    AllocatedBlock* block2;

    if (_nextWramBlock == NULL) {
        _nextWramBlock = &(*_wramBlocks)[0];
        _wramBlocksUsed = 0;
        _unk3005C8C = NULL;
    }

    block = getValidAllocatedBlock(_wramBlocks, BLOCK_COUNT);
    if (block == NULL) {
        printf("Error in fastAllocate(), unable to allocate %i bytes\n", size);
    }

    block2 = sub_805A53C(size, _wram, sizeof(_wram), _nextWramBlock, block, &_nextWramBlock);
    if (block2 != NULL) {
        _wramBlocksUsed += 1;
    }

    return block2;
}

AllocatedBlock* slowAllocate(unk32 size)
{
    AllocatedBlock* block;
    AllocatedBlock* block2;

    if (_nextExramBlock == NULL) {
        _nextExramBlock = &(*_exramBlocks)[0];
        _exramBlocksUsed = 0;
        _unk3001158 = NULL;
    }

    block = getValidAllocatedBlock(_exramBlocks, BLOCK_COUNT);
    if (block == NULL) {
        printf("Error in slowAllocate(), unable to allocate %i bytes\n", size);
    }

    block2 = sub_805A53C(size, (unk8*)_exram, EXRAM_SIZE, _nextExramBlock, block, &_nextExramBlock);
    if (block2 != NULL) {
        _exramBlocksUsed += 1;
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
                _nextExramBlock = NULL;
            } else {
                _nextWramBlock = NULL;
            }
        } else {
            if (block->address <= (void*)0x203FFFF) {
                _nextExramBlock = nextBlock;
            } else {
                _nextWramBlock = nextBlock;
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
        _exramBlocksUsed -= 1;
    } else {
        _wramBlocksUsed -= 1;
    }

    block->size = 0;
    block->address = NULL;
    block->next = NULL;
    block->previous = NULL;
}

AllocatedBlock* sub_805A53C(u32 size, unk8* base, unk32 capacity, AllocatedBlock* current,
    AllocatedBlock* block, AllocatedBlock** nextBlockPtr)
{
    u32 firstGap;
    u32 gap;
    u32 finalGap;
    unk8* end;
    unk8* last;
    unk32 address;
    AllocatedBlock* cur;

    address = (unk32)current->address;
    cur = current;
    firstGap = 0;
    if (address != 0) {
        firstGap = (unk8*)address - base;
    }

    if (firstGap >= size) {
        block->address = base;
        block->previous = NULL;
        block->next = current;
        block->size = size;
        cur->previous = block;
        *nextBlockPtr = block;
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
    AllocatedBlock* block = _nextWramBlock;

    while (block != NULL) {
        printf("> %i %i\n", block->size, block->size % 4);
        total += block->size;
        block = block->next;
    }

    printf("Total Wram usage %i, free %i, blocks used %i\n", total, WRAM_SIZE - total,
        _wramBlocksUsed);
}

void printTotalExramUsage(void)
{
    u32 total = 0;
    AllocatedBlock* block = _nextExramBlock;

    while (block != NULL) {
        // printf("> %i %i\n");
        printf("> %i %i\n", block->size, block->size % 4);
        total += block->size;
        block = block->next;
    }

    printf("Total Exram usage %i, free %i, blocks used %i\n", total, EXRAM_SIZE - total,
        _exramBlocksUsed);
}
