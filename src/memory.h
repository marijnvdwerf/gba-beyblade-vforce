#ifndef _MEMORY_H
#define _MEMORY_H

#include "common.h"

void initBlockVariables(void);

AllocatedBlock* fastAllocate(u32 size);

AllocatedBlock* slowAllocate(u32 size);

void deallocateBlock(AllocatedBlock* block);

#endif // _MEMORY_H