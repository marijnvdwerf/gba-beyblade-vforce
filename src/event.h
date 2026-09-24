#ifndef _EVENT_H
#define _EVENT_H

#include "common.h"

void processMetadata_6(LevelGeometryAddresses*, GeometryLine*, unk32, LineMetadata*, LineMetaObject*);
void initEventListeners(unk32);
void deallocEventListeners(void);
void handleEventListeners(LevelGeometryAddresses*, unk16);
void sub_8054278(LevelGeometryAddresses*, unk16);

#endif
