#ifndef _IDS_H
#define _IDS_H

/* Asset identifiers are 16-bit hashes of the asset's name, computed by the
 * original tools as h = (h * 37 + c) & 0xFFFF over the name's bytes, starting
 * from 0. The game never hashes at runtime; it only compares these constants.
 * The HASHn macros spell the name character by character so that every id is
 * an integer constant expression (usable in initializers and case labels). */

#define HASH_STEP(h, c) ((((h) * 37) + (c)) & 0xFFFF)
#define HASH1(a) HASH_STEP(0, a)
#define HASH2(a, b) HASH_STEP(HASH1(a), b)
#define HASH3(a, b, c) HASH_STEP(HASH2(a, b), c)
#define HASH4(a, b, c, d) HASH_STEP(HASH3(a, b, c), d)
#define HASH5(a, b, c, d, e) HASH_STEP(HASH4(a, b, c, d), e)
#define HASH6(a, b, c, d, e, f) HASH_STEP(HASH5(a, b, c, d, e), f)
#define HASH7(a, b, c, d, e, f, g) HASH_STEP(HASH6(a, b, c, d, e, f), g)
#define HASH8(a, b, c, d, e, f, g, h) HASH_STEP(HASH7(a, b, c, d, e, f, g), h)
#define HASH9(a, b, c, d, e, f, g, h, i) HASH_STEP(HASH8(a, b, c, d, e, f, g, h), i)
#define HASH10(a, b, c, d, e, f, g, h, i, j) HASH_STEP(HASH9(a, b, c, d, e, f, g, h, i), j)
#define HASH11(a, b, c, d, e, f, g, h, i, j, k) HASH_STEP(HASH10(a, b, c, d, e, f, g, h, i, j), k)

/* Screen layouts (ScreenLayout.unk0) */
#define ID_NINTENDO HASH8('N', 'i', 'n', 't', 'e', 'n', 'd', 'o') /* 0x8C73 */
#define ID_NELVANA HASH7('N', 'e', 'l', 'v', 'a', 'n', 'a') /* 0xE3D1 */
#define ID_COLLECTION HASH10('C', 'o', 'l', 'l', 'e', 'c', 't', 'i', 'o', 'n') /* 0x3C00 */
#define ID_DIALOG HASH6('D', 'i', 'a', 'l', 'o', 'g') /* 0x2628 */
#define ID_LANGUAGE HASH8('L', 'a', 'n', 'g', 'u', 'a', 'g', 'e') /* 0xE084 */
#define ID_FULLFAT HASH7('F', 'u', 'l', 'l', 'F', 'a', 't') /* 0x3E06 */

/* Line metadata object types */
#define ID_COLLECTABLE HASH11('C', 'o', 'l', 'l', 'e', 'c', 't', 'a', 'b', 'l', 'e') /* 0x37AE */

#endif
