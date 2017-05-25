	.include "asm/common.inc"

	thumb_func_start sub_8061E58
sub_8061E58:
	push	{r4, r5, r6, r7, lr}
	mov	r7, r8
	push	{r7}
	add	r7, r0, #0
	lsl	r1, r1, #0x18
	lsr	r6, r1, #0x18
	ldr	r5, [r7, #0x14]
	ldr	r4, [r7, #0x1c]
	sub	r4, r4, #0x1
	mov	r0, #0x1
	NEG	r0, r0
	cmp	r4, r0
	beq	.L1	@cond_branch
	mov	r8, r0
.L2:
	add	r0, r5, #0
	add	r1, r6, #0
	bl	sub_8061130
	ldr	r5, [r5, #0x4]
	sub	r4, r4, #0x1
	cmp	r4, r8
	bne	.L2	@cond_branch
.L1:
	strb	r6, [r7, #0xe]
	pop	{r3}
	mov	r8, r3
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
	thumb_func_end sub_8061E58

.align 2, 0 @ Don't pad with nop.
