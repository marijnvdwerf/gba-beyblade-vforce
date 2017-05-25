	.include "asm/common.inc"

	thumb_func_start sub_805BA7C
sub_805BA7C:
	push	{r4, lr}
	mov	ip, r0
	ldr	r3, [r0, #0xc]
	mov	r0, #0x8a
	lsl	r0, r0, #0x1
	ADD r0, ip
	ldr	r0, [r0]
	cmp	r0, #0
	bne	.L1	@cond_branch
	b	.L4
.L5:
	mov	r0, #0x8a
	lsl	r0, r0, #0x1
	ADD r0, ip
	ldr	r1, [r0]
	lsl	r0, r2, #0x2
	add	r0, r0, r1
	ldr	r0, [r0]
	b	.L3
.L1:
	mov	r2, #0x0
	mov	r4, ip
	ldr	r0, [r4]
	ldr	r0, [r0, #0x8]
	cmp	r2, r0
	bge	.L4	@cond_branch
.L6:
	cmp	r3, r1
	beq	.L5	@cond_branch
	add	r3, r3, #0x20
	add	r2, r2, #0x1
	cmp	r2, r0
	blt	.L6	@cond_branch
.L4:
	mov	r0, #0x0
.L3:
	pop	{r4}
	pop	{r1}
	bx	r1
	thumb_func_end sub_805BA7C

.align 2, 0 @ Don't pad with nop.
