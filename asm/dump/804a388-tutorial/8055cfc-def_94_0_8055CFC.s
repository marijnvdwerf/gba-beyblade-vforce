	.include "asm/common.inc"

	thumb_func_start def_94_0_8055CFC
def_94_0_8055CFC:
	push	{r4, r5, r6, r7, lr}
	mov	r7, r8
	push	{r7}
	add	sp, sp, #0xfffffff8
	add	r5, r0, #0
	add	r7, r1, #0
	mov	r8, r2
	lsl	r3, r3, #0x10
	lsr	r3, r3, #0x10
	add	r6, r3, #0
	add	r0, r0, #0xb4
	ldr	r4, [r0]
	cmp	r4, #0
	bne	.L1	@cond_branch
	mov	r0, #0x0
	b	.L5
.L1:
	mov	r0, #0x99
	and	r0, r0, r3
	cmp	r0, #0
	beq	.L5	@cond_branch
	mov	r0, #0x90
	and	r0, r0, r3
	cmp	r0, #0
	beq	.L4	@cond_branch
	str	r0, [sp]
	mov	r0, #0x40
	str	r0, [sp, #0x4]
	add	r0, r5, #0
	add	r1, r4, #0
	add	r2, r7, #0
	mov	r3, r8
	bl	sub_8055D64
.L4:
	mov	r0, #0x9
	and	r0, r0, r6
	cmp	r0, #0
	beq	.L5	@cond_branch
	str	r0, [sp]
	mov	r0, #0x0
	str	r0, [sp, #0x4]
	add	r0, r5, #0
	add	r1, r4, #0
	add	r2, r7, #0
	mov	r3, r8
	bl	sub_8055D64
.L5:
	add	sp, sp, #0x8
	pop	{r3}
	mov	r8, r3
	pop	{r4, r5, r6, r7}
	pop	{r1}
	bx	r1
	thumb_func_end def_94_0_8055CFC

.align 2, 0 @ Don't pad with nop.
