	.include "asm/common.inc"

	thumb_func_start sub_806799C
sub_806799C:
	push	{r4, r5, lr}
	add	sp, sp, #0xffffffe4
	str	r0, [sp, #0x14]
	str	r1, [sp, #0x18]
	add	r0, sp, #0x14
	mov	r1, sp
	bl	sub_8066D8C
	ldr	r2, [sp, #0xc]
	ldr	r3, [sp, #0x10]
	lsl	r5, r3, #0x2
	lsr	r4, r2, #0x1e
	add	r0, r5, #0
	orr	r0, r0, r4
	add	r5, r0, #0
	ldr	r4, .L2
	add	r0, r2, #0
	and	r0, r0, r4
	mov	r1, #0x0
	orr	r0, r0, r1
	cmp	r0, #0
	beq	.L1	@cond_branch
	mov	r0, #0x1
	orr	r5, r5, r0
.L1:
	ldr	r0, [sp]
	ldr	r1, [sp, #0x4]
	ldr	r2, [sp, #0x8]
	add	r3, r5, #0
	bl	sub_8066C00
	add	sp, sp, #0x1c
	pop	{r4, r5, pc}
.L3:
	.align	2, 0
.L2:
	.4byte	0x3fffffff
	thumb_func_end sub_806799C

.align 2, 0 @ Don't pad with nop.
