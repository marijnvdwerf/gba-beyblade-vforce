	.include "asm/common.inc"

	thumb_func_start initProjectileSystem
initProjectileSystem:
	push	{r4, r5, r6, r7, lr}
	mov	r7, sl
	mov	r6, r9
	mov	r5, r8
	push	{r5, r6, r7}
	add	sp, sp, #0xffffffec
	ldr	r0, .L1
	ldr	r5, [r0]
	ldr	r0, .L1 + 4
	add	r0, r0, r5
	mov	sl, r0
	ldr	r2, .L1 + 8
	ldr	r1, .L1 + 12
	add	r0, r5, r1
	str	r0, [sp]
	mov	r0, sl
	mov	r1, #0x3
	mov	r3, #0x6
	bl	newProjectileSystem
	ldr	r3, .L1 + 16
	add	r4, r5, r3
	mov	r0, #0xa0
	lsl	r0, r0, #0x13
	mov	r8, r0
	mov	r3, #0xc0
	lsl	r3, r3, #0x1
	mov	r6, #0x8
	str	r6, [sp]
	add	r0, r4, #0
	mov	r1, r8
	mov	r2, #0x0
	bl	sub_80631B0
	mov	r7, #0x80
	lsl	r7, r7, #0x1
	add	r0, r4, #0
	add	r1, r7, #0
	bl	sub_8063640
	ldr	r1, .L1 + 20
	add	r4, r5, r1
	str	r6, [sp]
	add	r0, r4, #0
	mov	r1, r8
	mov	r2, #0x0
	mov	r3, #0x30
	bl	sub_80631B0
	add	r0, r4, #0
	mov	r1, #0x1f
	mov	r2, #0x8
	mov	r3, #0x8
	bl	sub_8063220
	mov	r3, #0x87
	lsl	r3, r3, #0x5
	add	r3, r3, r5
	mov	r9, r3
	str	r6, [sp]
	mov	r0, r9
	mov	r1, r8
	mov	r2, #0x0
	add	r3, r7, #0
	bl	sub_80631B0
	mov	r4, #0x0
	str	r4, [sp]
	mov	r0, #0xa
	str	r0, [sp, #0x4]
	str	r0, [sp, #0x8]
	str	r0, [sp, #0xc]
	mov	r0, #0x1f
	str	r0, [sp, #0x10]
	mov	r0, r9
	mov	r1, #0xc0
	mov	r2, #0xe
	mov	r3, #0x0
	bl	sub_8063544
	ldr	r1, .L1 + 24
	add	r0, r5, r1
	strh	r4, [r0]
	ldr	r3, .L1 + 28
	add	r0, r5, r3
	strh	r4, [r0]
	add	r1, r1, #0x4
	add	r0, r5, r1
	strh	r4, [r0]
	add	r3, r3, #0x8
	add	r0, r5, r3
	strh	r4, [r0]
	add	r1, r1, #0x2
	add	r0, r5, r1
	strh	r4, [r0]
	sub	r3, r3, #0x2
	add	r0, r5, r3
	strh	r4, [r0]
	mov	r0, sl
	strh	r4, [r0, #0x28]
	str	r4, [r0, #0x2c]
	str	r4, [r0, #0x30]
	add	r1, r1, #0x6
	add	r2, r5, r1
	mov	r1, #0xac
	lsl	r1, r1, #0x3
	strh	r1, [r2]
	add	r3, r3, #0x6
	add	r0, r5, r3
	strh	r1, [r0]
	ldr	r1, .L1 + 32
	add	r0, r5, r1
	str	r4, [r0]
	add	r3, r3, #0x6
	add	r0, r5, r3
	str	r4, [r0]
	ldr	r0, .L1 + 36
	add	r5, r5, r0
	str	r4, [r5]
	ldr	r0, .L1 + 40
	strh	r4, [r0]
	ldr	r1, .L1 + 44
	ldr	r3, .L1 + 48
	add	r0, r3, #0
	strh	r0, [r1]
	ldr	r0, .L1 + 52
	mov	r1, #0xf0
	strh	r1, [r0]
	add	r0, r0, #0x2
	strh	r1, [r0]
	ldr	r1, .L1 + 56
	ldrh	r3, [r2]
	lsl	r0, r3, #0x10
	asr	r0, r0, #0x14
	strh	r0, [r1]
	ldr	r3, .L1 + 60
	ldrh	r2, [r2]
	lsl	r0, r2, #0x10
	asr	r0, r0, #0x14
	mov	r1, #0xa0
	sub	r0, r1, r0
	lsl	r0, r0, #0x8
	orr	r0, r0, r1
	strh	r0, [r3]
	mov	r2, #0x80
	lsl	r2, r2, #0x13
	ldrh	r0, [r2]
	mov	r3, #0xc0
	lsl	r3, r3, #0x7
	add	r1, r3, #0
	orr	r0, r0, r1
	strh	r0, [r2]
	add	sp, sp, #0x14
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
	.4byte	0x1084
	.4byte	0x86fbf94
	.4byte	0x434
	.4byte	0x10b8
	.4byte	0x10cc
	.4byte	0x10f4
	.4byte	0x10f6
	.4byte	0x1104
	.4byte	0x110c
	.4byte	0x4000048
	.4byte	0x400004a
	.4byte	0xffff
	.4byte	0x4000040
	.4byte	0x4000044
	.4byte	0x4000046
	thumb_func_end initProjectileSystem

.align 2, 0 @ Don't pad with nop.
