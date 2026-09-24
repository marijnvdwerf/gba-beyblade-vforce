#ifndef _IDS_H
#define _IDS_H

/* Asset identifiers are 16-bit hashes of the asset's name, computed by the
 * original tools as h = (h * 37 + c) & 0xFFFF over the name's bytes, starting
 * from 0. The game never hashes at runtime; it only compares these constants. */

/* Screen layouts (ScreenLayout.unk0) */
#define ID_NINTENDO 0x8C73 /* "Nintendo" */
#define ID_NELVANA 0xE3D1 /* "Nelvana" */
#define ID_COLLECTION 0x3C00 /* "Collection" */
#define ID_DIALOG 0x2628 /* "Dialog" */
#define ID_LANGUAGE 0xE084 /* "Language" */
#define ID_FULLFAT 0x3E06 /* "FullFat" */
#define ID_WIDE_FRAME 0x1E88 /* "WideFrame" */
#define ID_BIG_FRAME 0x40AD /* "BigFrame" */
#define ID_SMALL_FRAME 0x10B0 /* "SmallFrame" */
#define ID_DRIGHTS 0xE1C1 /* "DRights" */
#define ID_LEGALS 0x104 /* "Legals" */
#define ID_PUBLISHER 0x4462 /* "Publisher" */
#define ID_PRESS_START 0x65CB /* "PressStart" */

/* Line metadata object types */
#define ID_COLLECTABLE 0x37AE /* "Collectable" */
#define ID_TUTORIAL_TRIGGER 0x8CEC /* "TutorialTrigger" */
#define ID_SHADOW 0xF4FA /* "Shadow" */
#define ID_SPRITE 0xFB93 /* "Sprite" */
#define ID_ACTOR 0xD679 /* "Actor" */
#define ID_WEIGHT 0xD368 /* "Weight" */
#define ID_ACCELERATION 0x6ACE /* "Acceleration" */
#define ID_FRICTION 0x5BBE /* "Friction" */
#define ID_AI_PATH 0x59C3 /* "AIPath" */
#define ID_AI_PATH_SPEED 0xCF2C /* "AIPathSpeed" */
#define ID_AI_BOSS 0xD271 /* "AIBoss" */
#define ID_AI_TARGET_RADIUS 0x215D /* "AITargetRadius" */
#define ID_AI_TARGET_TIME 0x3AB4 /* "AITargetTime" */
#define ID_AI_RECHARGE_RATE 0x5CF /* "AIRechargeRate" */

/* Level designs (LevelDesigns[].unk0): "E<episode> M<stage>" and "E<episode> Bonus",
 * both zero-based; see the trailing comments in src/leveldesigns.c. */

#endif
