#ifndef _MEMORY_H
#define _MEMORY_H

#include "common.h"

void initMemoryManagement(void);

AllocatedBlock* fastAllocate(unk32 size);

AllocatedBlock* slowAllocate(unk32 size);

void deallocateBlock(AllocatedBlock* block);

#endif