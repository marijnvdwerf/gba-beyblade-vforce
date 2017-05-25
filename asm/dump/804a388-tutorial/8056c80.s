	.include "asm/common.inc"

	thumb_func_start sub_8056C80
sub_8056C80:
	push	{r4, r5, r6, r7, lr}
	add	sp, sp, #0xfffffee4
	add	r6, r0, #0
	lsl	r1, r1, #0x10
	lsr	r5, r1, #0x10
	mov	r4, #0x0
	bl	GetLevelDescriptionNo
	ldr	r2, .L4
	lsl	r1, r0, #0x5
	add	r1, r1, r0
	lsl	r1, r1, #0x2
	add	r2, r2, #0x80
	add	r1, r1, r2
	ldr	r1, [r1]
	cmp	r1, #0
	beq	.L1	@cond_branch
	mov	r0, sp
	bl	getLevelGeometryAddresses
.L1:
	ldr	r2, [sp, #0xc]
	mov	r3, #0x0
	ldr	r0, [sp]
	ldr	r1, [r0, #0x8]
	add	r7, r0, #0
	cmp	r4, r1
	bge	.L6	@cond_branch
	b	.L3
.L5:
	.align	2, 0
.L4:
	.4byte	0x806b300
.L8:
	add	r2, r2, #0x20
	add	r3, r3, #0x1
	ldr	r0, [r7, #0x8]
	cmp	r3, r0
	bge	.L6	@cond_branch
.L3:
	ldrb	r0, [r2, #0xf]
	cmp	r0, #0x86
	bne	.L8	@cond_branch
	ldrh	r0, [r2, #0x14]
	cmp	r0, r5
	bne	.L8	@cond_branch
	add	r4, r2, #0
.L6:
	cmp	r4, #0
	beq	.L9	@cond_branch
	ldr	r0, [r4]
	lsl	r0, r0, #0x4
	ldr	r1, [sp, #0x4]
	add	r1, r1, r0
	ldr	r0, [r1]
	asr	r0, r0, #0x3
	str	r0, [r6]
	ldr	r0, [r1, #0x4]
	asr	r0, r0, #0x3
	str	r0, [r6, #0x4]
	ldr	r0, [r1, #0x8]
	asr	r0, r0, #0x3
	str	r0, [r6, #0x8]
.L9:
	add	r0, r4, #0
	add	sp, sp, #0x11c
	pop	{r4, r5, r6, r7}
	pop	{r1}
	bx	r1
	thumb_func_end sub_8056C80

.align 2, 0 @ Don't pad with nop.
