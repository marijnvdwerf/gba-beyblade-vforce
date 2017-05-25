	.include "asm/common.inc"

	thumb_func_start sub_8055914
sub_8055914:
	push	{r4, r5, r6, r7, lr}
	mov	r7, sl
	mov	r6, r9
	mov	r5, r8
	push	{r5, r6, r7}
	add	sp, sp, #0xfffffff0
	add	r4, r0, #0
	mov	sl, r1
	add	r7, r2, #0
	mov	r9, r3
	mov	r5, #0x0
	strh	r5, [r4, #0x28]
	strh	r5, [r4, #0x2a]
	str	r5, [r4, #0x24]
	str	r5, [r4, #0x1c]
	ldr	r6, .L1
	str	r6, [r4, #0x18]
	str	r6, [r4, #0x8]
	mov	r0, #0xf4
	lsl	r0, r0, #0x8
	mov	r8, r0
	str	r0, [r4, #0x20]
	str	r0, [r4, #0x10]
	str	r3, [r4, #0xc]
	ldr	r0, [sp, #0x30]
	str	r0, [r4, #0x14]
	str	r5, [r4, #0x34]
	str	r5, [r4, #0x2c]
	str	r5, [r4, #0x38]
	str	r5, [r4, #0x30]
	mov	r0, #0x0
	bl	allocSprite
	str	r0, [r4]
	str	r5, [sp]
	str	r5, [sp, #0x4]
	str	r5, [sp, #0x8]
	str	r5, [sp, #0xc]
	mov	r1, sl
	add	r2, r6, #0
	mov	r3, r9
	bl	LoadSpriteSheet
	mov	r0, #0x0
	bl	allocSprite
	str	r0, [r4, #0x4]
	str	r5, [sp]
	str	r5, [sp, #0x4]
	mov	r1, #0x1
	str	r1, [sp, #0x8]
	str	r5, [sp, #0xc]
	add	r1, r7, #0
	mov	r2, r8
	ldr	r3, [sp, #0x30]
	bl	LoadSpriteSheet
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
	.4byte	0xffffbc00
	thumb_func_end sub_8055914

.align 2, 0 @ Don't pad with nop.
