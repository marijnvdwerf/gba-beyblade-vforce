	.include "asm/common.inc"

	thumb_func_start sub_806570C
sub_806570C:
	push	{r4, r5, r6, r7, lr}
	mov	r7, r9
	mov	r6, r8
	push	{r6, r7}
	add	sp, sp, #0xfffffffc
	add	r5, r0, #0
	mov	r9, r1
	mov	r8, r2
	add	r7, r3, #0
	mov	r6, #0x0
	mov	r4, #0x0
	ldrb	r0, [r5, #0x4]
	cmp	r4, r0
	bcs	.L1	@cond_branch
.L2:
	mov	r0, #0xc4
	add	r1, r4, #0
	mul	r1, r1, r0
	ldr	r0, [r5]
	add	r0, r0, r1
	ldr	r2, [sp, #0x20]
	add	r1, r2, r6
	str	r1, [sp]
	mov	r1, r9
	mov	r2, r8
	add	r3, r7, #0
	bl	sub_8058794
	ldr	r0, [sp, #0x24]
	add	r6, r6, r0
	add	r0, r4, #1
	lsl	r0, r0, #0x10
	lsr	r4, r0, #0x10
	ldrb	r2, [r5, #0x4]
	cmp	r4, r2
	bcc	.L2	@cond_branch
.L1:
	add	sp, sp, #0x4
	pop	{r3, r4}
	mov	r8, r3
	mov	r9, r4
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
	thumb_func_end sub_806570C

.align 2, 0 @ Don't pad with nop.
