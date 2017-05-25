	.include "asm/common.inc"

	thumb_func_start sub_80539E8
sub_80539E8:
	push	{r4, r5, r6, r7, lr}
	mov	r7, r8
	push	{r7}
	add	sp, sp, #0xffffffd4
	add	r5, r0, #0
	bl	GetLevelDescriptionNo
	lsl	r0, r0, #0x10
	lsr	r0, r0, #0x10
	mov	r8, r0
	bl	getSomeLevelID
	add	r4, r0, #0
	lsl	r4, r4, #0x10
	lsr	r4, r4, #0x10
	bl	getLevelDescription2
	add	r7, r0, #0
	ldr	r6, .L4
	add	r0, r4, #0
	bl	getLevelMetadata
	add	r0, r5, #0
	mov	r1, sp
	bl	sub_8058754
	ldr	r0, [sp]
	ldr	r1, .L4 + 4
	add	r2, r0, r1
	add	r0, r5, #0
	add	r0, r0, #0xa2
	mov	r3, #0x0
	ldsh	r0, [r0, r3]
	add	r0, r0, #0x50
	ldrb	r5, [r5, #0x11]
	lsr	r1, r5, #0x1
	sub	r0, r0, r1
	lsl	r0, r0, #0x8
	ldr	r1, .L4 + 8
	add	r0, r0, r1
	ldr	r1, [sp, #0x4]
	sub	r0, r1, r0
	cmp	r2, #0
	bge	.L1	@cond_branch
	mov	r2, #0x0
.L1:
	cmp	r0, #0
	bge	.L2	@cond_branch
	mov	r0, #0x0
.L2:
	add	r3, sp, #0xc
	asr	r1, r2, #0x8
	str	r1, [sp, #0xc]
	asr	r0, r0, #0x8
	str	r0, [r3, #0x4]
	str	r1, [r3, #0x8]
	str	r0, [r3, #0xc]
	str	r1, [r3, #0x10]
	str	r0, [r3, #0x14]
	mov	r5, #0x0
	str	r5, [r3, #0x18]
	str	r5, [r3, #0x1c]
	ldr	r0, [r6]
	ldr	r2, .L4 + 12
	add	r0, r0, r2
	mov	r1, r8
	lsl	r4, r1, #0x10
	asr	r4, r4, #0x10
	lsl	r1, r4, #0x5
	add	r1, r1, r4
	lsl	r1, r1, #0x2
	ldr	r2, .L4 + 16
	add	r1, r1, r2
	mov	r2, #0x82
	lsl	r2, r2, #0x5
	bl	sub_805E8A0
	ldr	r2, [r6]
	mov	r3, #0xf4
	lsl	r3, r3, #0x3
	add	r0, r2, r3
	str	r4, [r0]
	mov	r0, #0xa0
	lsl	r0, r0, #0x13
	strh	r5, [r0]
	ldr	r1, [r7, #0x30]
	cmp	r1, #0
	beq	.L3	@cond_branch
	ldr	r3, .L4 + 12
	add	r0, r2, r3
	ldr	r2, [r7, #0x34]
	bl	sub_805EEFC
.L3:
	bl	initCollisionData
	ldr	r1, [r6]
	mov	r0, #0xef
	lsl	r0, r0, #0x3
	add	r2, r1, r0
	ldr	r0, .L4 + 20
	str	r0, [r2]
	mov	r2, #0xb5
	lsl	r2, r2, #0x4
	add	r1, r1, r2
	mov	r0, #0x3
	strb	r0, [r1]
	ldr	r0, [r6]
	ldr	r3, .L4 + 24
	add	r0, r0, r3
	mov	r1, #0x40
	strb	r1, [r0]
	ldr	r0, [r6]
	add	r2, r2, #0x2
	add	r0, r0, r2
	strb	r1, [r0]
	ldr	r0, [r6]
	add	r3, r3, #0x3
	add	r0, r0, r3
	strb	r1, [r0]
	ldr	r0, [r6]
	add	r2, r2, #0x3
	add	r0, r0, r2
	strb	r1, [r0]
	add	sp, sp, #0x2c
	pop	{r3}
	mov	r8, r3
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L5:
	.align	2, 0
.L4:
	.4byte	0x3000fb0
	.4byte	0xffff8800
	.4byte	0xffff8000
	.4byte	0x434
	.4byte	0x806b300
	.4byte	sub_80522D4 + 1
	.4byte	0xb51
	thumb_func_end sub_80539E8

.align 2, 0 @ Don't pad with nop.
