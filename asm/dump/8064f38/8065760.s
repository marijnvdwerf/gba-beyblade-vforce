	.include "asm/common.inc"

	thumb_func_start sub_8065760
sub_8065760:
	push	{r4, r5, r6, r7, lr}
	mov	r7, sl
	mov	r6, r9
	mov	r5, r8
	push	{r5, r6, r7}
	add	sp, sp, #0xfffffffc
	add	r7, r0, #0
	mov	sl, r1
	mov	r9, r2
	mov	r8, r3
	ldr	r0, [sp, #0x2c]
	lsl	r0, r0, #0x10
	lsr	r5, r0, #0x10
	mov	r6, #0x0
	ldrb	r0, [r7, #0x4]
	cmp	r5, r0
	bls	.L1	@cond_branch
	add	r5, r0, #0
.L1:
	mov	r4, #0x0
	cmp	r4, r5
	bcs	.L2	@cond_branch
.L3:
	mov	r0, #0xc4
	add	r1, r4, #0
	mul	r1, r1, r0
	ldr	r0, [r7]
	add	r0, r0, r1
	ldr	r2, [sp, #0x24]
	add	r1, r2, r6
	str	r1, [sp]
	mov	r1, sl
	mov	r2, r9
	mov	r3, r8
	bl	sub_8058794
	ldr	r0, [sp, #0x28]
	add	r6, r6, r0
	add	r0, r4, #1
	lsl	r0, r0, #0x10
	lsr	r4, r0, #0x10
	cmp	r4, r5
	bcc	.L3	@cond_branch
.L2:
	add	sp, sp, #0x4
	pop	{r3, r4, r5}
	mov	r8, r3
	mov	r9, r4
	mov	sl, r5
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
	thumb_func_end sub_8065760

.align 2, 0 @ Don't pad with nop.
