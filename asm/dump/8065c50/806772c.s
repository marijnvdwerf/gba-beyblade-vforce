	.include "asm/common.inc"

	thumb_func_start sub_806772C
sub_806772C:
	push	{r4, lr}
	add	sp, sp, #0xffffffc8
	str	r0, [sp, #0x28]
	str	r1, [sp, #0x2c]
	str	r2, [sp, #0x30]
	str	r3, [sp, #0x34]
	add	r0, sp, #0x28
	mov	r1, sp
	bl	sub_8066D8C
	add	r0, sp, #0x30
	add	r4, sp, #0x14
	add	r1, r4, #0
	bl	sub_8066D8C
	mov	r1, #0x0
	ldr	r0, [sp]
	cmp	r0, #0x1
	bhi	.L1	@cond_branch
	mov	r1, #0x1
.L1:
	cmp	r1, #0
	bne	.L2	@cond_branch
	mov	r1, #0x0
	ldr	r0, [sp, #0x14]
	cmp	r0, #0x1
	bhi	.L3	@cond_branch
	mov	r1, #0x1
.L3:
	cmp	r1, #0
	beq	.L4	@cond_branch
.L2:
	mov	r0, #0x1
	NEG	r0, r0
	b	.L5
.L4:
	mov	r0, sp
	add	r1, r4, #0
	bl	sub_8067568
.L5:
	add	sp, sp, #0x38
	pop	{r4, pc}
	thumb_func_end sub_806772C

.align 2, 0 @ Don't pad with nop.
