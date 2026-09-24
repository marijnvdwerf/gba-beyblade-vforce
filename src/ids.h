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

/* Line metadata object types */
#define ID_COLLECTABLE 0x37AE /* "Collectable" */

#endif
