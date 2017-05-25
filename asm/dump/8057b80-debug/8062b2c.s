	.include "asm/common.inc"

	thumb_func_start sub_8062B2C
sub_8062B2C:
	push	{r4, r5, r6, r7, lr}
	add	sp, sp, #0xfffffffc
	ldr	r0, .L5
	ldr	r0, [r0]
	cmp	r0, #0x1
	bne	.L1	@cond_branch
	mov	r1, #0x0
	ldr	r2, .L5 + 4
.L4:
	mov	r6, #0x0
	lsl	r0, r1, #0x3
	add	r7, r1, #1
	add	r0, r0, r1
	lsl	r5, r0, #0x2
.L3:
	ldr	r0, [r2]
	add	r1, r5, r0
	lsl	r4, r6, #0x3
	add	r0, r1, r4
	ldrb	r0, [r0, #0x4]
	cmp	r0, #0
	beq	.L2	@cond_branch
	add	r0, r1, #0
	add	r0, r0, #0x8
	add	r0, r0, r4
	ldr	r0, [r0]
	str	r2, [sp]
	bl	sub_8062A90
	ldr	r2, [sp]
	ldr	r0, [r2]
	add	r0, r5, r0
	add	r0, r0, r4
	mov	r1, #0x0
	strb	r1, [r0, #0x4]
.L2:
	add	r6, r6, #0x1
	cmp	r6, #0x3
	bls	.L3	@cond_branch
	add	r1, r7, #0
	cmp	r1, #0xf
	bls	.L4	@cond_branch
	ldr	r1, .L5
	mov	r0, #0x0
	str	r0, [r1]
.L1:
	add	sp, sp, #0x4
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L6:
	.align	2, 0
.L5:
	.4byte	0x3005e0c
	.4byte	0x3005e28
	thumb_func_end sub_8062B2C

.align 2, 0 @ Don't pad with nop.
