	.include "asm/common.inc"

	thumb_func_start sub_805B0BC
sub_805B0BC:
	push	{r4, r5, lr}
	add	r5, r0, #0
	ldr	r3, [r5, #0x24]
	mov	r0, #0x4c
	add	r1, r3, #0
	mul	r1, r1, r0
	ldr	r0, [r5, #0xc]
	add	r4, r0, r1
	ldr	r2, [r5, #0x34]
	cmp	r2, #0
	beq	.L1	@cond_branch
	add	r0, r4, #0
	add	r1, r3, #0
	bl	call_via_r2
.L1:
	ldr	r0, [r4, #0x48]
	cmp	r0, #0
	beq	.L2	@cond_branch
	add	r4, r0, #0
.L2:
	ldr	r1, [r4, #0x34]
	lsl	r1, r1, #0x10
	ldr	r0, [r5, #0x24]
	orr	r0, r0, r1
	pop	{r4, r5}
	pop	{r1}
	bx	r1
	thumb_func_end sub_805B0BC

.align 2, 0 @ Don't pad with nop.
