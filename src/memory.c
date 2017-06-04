#include "memory.h"
#include "ram.h"
#include "unsorted.h"

#define BLOCK_COUNT 0x20
#define EXRAM_SIZE 0x3FC00
#define WRAM_SIZE 19232

#define ewram ((u8*)0x2000000)

AllocatedBlock* _nextExramBlock = NULL;
u8 (*_exram)[EXRAM_SIZE] = NULL;
void* _unk3001158 = NULL;
u32 _exramBlocksUsed = 0;
u8 _wram[WRAM_SIZE] = { 0 };
AllocatedBlock (*_wramBlocks)[BLOCK_COUNT] = NULL;
AllocatedBlock* _nextWramBlock = NULL;
u32 _wramBlocksUsed = 0;
void* _unk3005C8C = NULL;
AllocatedBlock (*_exramBlocks)[BLOCK_COUNT] = NULL;

AllocatedBlock* sub_805A53C();

void initBlockVariables(void)
{
    int blockSize = sizeof(AllocatedBlock) * BLOCK_COUNT;

    _wramBlocksUsed = 0;
    _exramBlocksUsed = 0;
    _unk3005C8C = NULL;
    _unk3001158 = NULL;
    _nextWramBlock = NULL;
    _nextExramBlock = NULL;

    _wramBlocks = (AllocatedBlock(*)[BLOCK_COUNT])ewram;
    _exramBlocks = (AllocatedBlock(*)[BLOCK_COUNT])(ewram + blockSize);
    _exram = (u8(*)[EXRAM_SIZE])(ewram + blockSize + blockSize);
}

AllocatedBlock* getValidAllocatedBlock(AllocatedBlock (*)[], u32);

AllocatedBlock* fastAllocate(u32 size)
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

    block2 = sub_805A53C(size, _wram, sizeof(_wram), &_nextWramBlock[0], block, &_nextWramBlock);
    if (block2 != NULL) {
        _wramBlocksUsed += 1;
    }

    return block2;
}

AllocatedBlock* slowAllocate(u32 size)
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

    block2 = sub_805A53C(size, _exram, EXRAM_SIZE, &_nextExramBlock[0], block, &_nextExramBlock);
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

const u8 Str_8755254[]
    = "Error in getValidAllocatedBlock(), no further AllocatedBlocks available\n";

#ifdef NONMATCHING
AllocatedBlock* getValidAllocatedBlock(AllocatedBlock (*blockList)[], u32 arg0)
{
    u32 i;

    AllocatedBlock* block = &(*blockList)[0];
    for (i = arg0; i != 0; i--) {
        if (block->size == 0 && block->address == NULL) {
            return block;
        }

        block++;
    }

    printf("Error in getValidAllocatedBlock(), no further AllocatedBlocks available\n");
    return NULL;
}
#endif

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
