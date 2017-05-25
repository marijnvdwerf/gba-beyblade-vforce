	.include "asm/common.inc"

	thumb_func_start sub_805C444
sub_805C444:
	push	{r4, r5, lr}
	add	sp, sp, #0xffffffe8
	add	r4, r0, #0
	add	r5, r1, #0
	str	r2, [sp]
	add	r1, sp, #0x4
	mov	r2, #0x0
	mov	r3, #0x1
	bl	sub_805DBF0
	lsl	r0, r0, #0x10
	cmp	r0, #0
	beq	.L3	@cond_branch
	ldr	r0, [sp, #0x4]
	ldr	r0, [r0]
	cmp	r0, #0x1
	bgt	.L2	@cond_branch
	mov	r0, #0x0
	b	.L3
.L2:
	ldr	r1, [sp, #0x8]
	lsl	r3, r1, #0xa
	sub	r0, r0, #0x1
	cmp	r1, r0
	bne	.L4	@cond_branch
	sub	r3, r3, #0x10
.L4:
	ldr	r2, [sp, #0xc]
	add	r0, r4, #0
	add	r1, r5, #0
	bl	sub_805C3BC
	mov	r0, #0x1
.L3:
	add	sp, sp, #0x18
	pop	{r4, r5}
	pop	{r1}
	bx	r1
	thumb_func_end sub_805C444

.align 2, 0 @ Don't pad with nop.
