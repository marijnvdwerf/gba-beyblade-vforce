	.include "asm/common.inc"

	thumb_func_start LoadHUD
LoadHUD:
	push	{r4, r5, r6, r7, lr}
	mov	r7, sl
	mov	r6, r9
	mov	r5, r8
	push	{r5, r6, r7}
	add	sp, sp, #0xfffffff0
	ldr	r0, .L1
	ldr	r5, [r0]
	mov	r0, #0xf5
	lsl	r0, r0, #0x4
	add	r0, r0, r5
	mov	sl, r0
	ldr	r1, .L1 + 4
	mov	r8, r1
	ldr	r2, .L1 + 8
	mov	r9, r2
	mov	r0, #0x10
	NEG	r0, r0
	str	r0, [sp]
	mov	r6, #0xf0
	str	r6, [sp, #0x4]
	mov	r7, #0x2
	str	r7, [sp, #0x8]
	mov	r0, sl
	mov	r3, #0x0
	bl	allocFont
	mov	r0, #0xf8
	lsl	r0, r0, #0x4
	add	r4, r5, r0
	mov	r0, #0xa0
	str	r0, [sp]
	str	r6, [sp, #0x4]
	str	r7, [sp, #0x8]
	add	r0, r4, #0
	mov	r1, r8
	mov	r2, r9
	mov	r3, #0x0
	bl	allocFont
	mov	r0, sl
	mov	r1, #0x4
	bl	sub_80611FC
	add	r0, r4, #0
	mov	r1, #0x4
	bl	sub_80611FC
	add	r0, r4, #0
	mov	r1, #0xe
	bl	sub_80611EC
	mov	r1, #0xfb
	lsl	r1, r1, #0x4
	add	r0, r5, r1
	mov	r2, #0x20
	NEG	r2, r2
	mov	sl, r2
	str	r2, [sp]
	mov	r1, #0xee
	str	r1, [sp, #0x4]
	mov	r4, #0x0
	str	r4, [sp, #0x8]
	ldr	r1, .L1 + 12
	ldr	r2, .L1 + 16
	mov	r3, #0x0
	bl	allocFont
	ldr	r1, .L1 + 20
	add	r0, r5, r1
	str	r4, [r0]
	ldr	r2, .L1 + 24
	add	r0, r5, r2
	str	r4, [r0]
	add	r1, r1, #0x8
	add	r0, r5, r1
	str	r4, [r0]
	add	r2, r2, #0x8
	add	r0, r5, r2
	str	r4, [r0]
	add	r1, r1, #0x10
	add	r0, r5, r1
	strh	r4, [r0]
	add	r2, r2, #0x4
	add	r0, r5, r2
	strh	r4, [r0]
	sub	r1, r1, #0x6
	add	r0, r5, r1
	strh	r4, [r0]
	add	r2, r2, #0x4
	add	r0, r5, r2
	strh	r4, [r0]
	sub	r1, r1, #0x16
	add	r0, r5, r1
	str	r4, [r0]
	add	r2, r2, #0x2
	add	r0, r5, r2
	strh	r4, [r0]
	mov	r0, #0x0
	bl	allocSprite
	mov	r1, #0x83
	lsl	r1, r1, #0x5
	add	r6, r5, r1
	str	r0, [r6]
	mov	r0, #0x0
	bl	allocSprite
	ldr	r2, .L1 + 28
	add	r2, r2, r5
	mov	r8, r2
	str	r0, [r2]
	mov	r0, #0x0
	bl	allocSprite
	ldr	r1, .L1 + 32
	add	r1, r1, r5
	mov	r9, r1
	str	r0, [r1]
	ldr	r2, .L1 + 36
	add	r0, r5, r2
	str	r4, [r0]
	ldr	r1, .L1 + 40
	add	r0, r5, r1
	str	r4, [r0]
	ldr	r0, [r6]
	ldr	r1, .L1 + 44
	mov	r2, #0x80
	lsl	r2, r2, #0x2
	ldr	r6, .L1 + 48
	str	r4, [sp]
	str	r4, [sp, #0x4]
	str	r4, [sp, #0x8]
	str	r4, [sp, #0xc]
	add	r3, r6, #0
	bl	LoadSpriteSheet
	mov	r2, r8
	ldr	r0, [r2]
	ldr	r1, .L1 + 52
	mov	r2, #0x84
	lsl	r2, r2, #0x7
	str	r4, [sp]
	str	r4, [sp, #0x4]
	str	r4, [sp, #0x8]
	str	r4, [sp, #0xc]
	add	r3, r6, #0
	bl	LoadSpriteSheet
	mov	r1, r9
	ldr	r0, [r1]
	ldr	r1, .L1 + 56
	mov	r2, #0xce
	lsl	r2, r2, #0x8
	str	r4, [sp]
	str	r4, [sp, #0x4]
	str	r4, [sp, #0x8]
	str	r4, [sp, #0xc]
	add	r3, r6, #0
	bl	LoadSpriteSheet
	mov	r2, #0xfe
	lsl	r2, r2, #0x4
	add	r6, r5, r2
	mov	r0, sl
	str	r0, [sp]
	mov	r0, #0x1c
	str	r0, [sp, #0x4]
	str	r7, [sp, #0x8]
	add	r0, r6, #0
	ldr	r1, .L1 + 12
	ldr	r2, .L1 + 16
	mov	r3, #0x0
	bl	allocFont
	bl	sub_80518F0
	ldr	r2, .L1 + 60
	add	r1, r5, r2
	strb	r0, [r1]
	ldrb	r1, [r1]
	add	r0, r6, #0
	mov	r2, #0xf
	bl	showNumber_2
	ldr	r1, .L1 + 64
	add	r0, r6, #0
	mov	r2, #0xf
	bl	showString
	bl	getLevelDescription2
	ldrb	r1, [r0, #0x1]
	add	r0, r6, #0
	mov	r2, #0xf
	bl	showNumber
	ldr	r1, .L1 + 68
	add	r0, r5, r1
	strh	r4, [r0]
	ldr	r2, .L1 + 72
	add	r0, r5, r2
	strh	r4, [r0]
	sub	r1, r1, #0xa
	add	r0, r5, r1
	str	r4, [r0]
	add	r2, r2, #0x4
	add	r0, r5, r2
	mov	r1, #0x0
	strb	r1, [r0]
	add	r2, r2, #0x4
	add	r1, r5, r2
	ldr	r0, .L1 + 76
	str	r0, [r1]
	ldr	r0, .L1 + 80
	add	r5, r5, r0
	strh	r4, [r5]
	add	sp, sp, #0x10
	pop	{r3, r4, r5}
	mov	r8, r3
	mov	r9, r4
	mov	sl, r5
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L2:
	.align	2, 0
.L1:
	.4byte	0x3000fb0
	.4byte	0x82b1a84
	.4byte	0x8067c0d
	.4byte	0x82b05ec
	.4byte	0x8067ae0
	.4byte	0x1044
	.4byte	0x1048
	.4byte	0x1064
	.4byte	0x1074
	.4byte	0x1068
	.4byte	0x106c
	.4byte	0x821cf10
	.4byte	0xffffe000
	.4byte	0x821db5c
	.4byte	0x821dea8
	.4byte	0x107d
	.4byte	0x8727048
	.4byte	0x107a
	.4byte	0x1078
	.4byte	0xffffc000
	.4byte	0x105e
	thumb_func_end LoadHUD

.align 2, 0 @ Don't pad with nop.
