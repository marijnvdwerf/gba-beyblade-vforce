	.include "asm/common.inc"

	thumb_func_start printTotalExramUsage
printTotalExramUsage:
	push	{r4, r5, r6, lr}
	mov	r5, #0x0
	ldr	r0, .L3
	ldr	r4, [r0]
	cmp	r4, #0
	beq	.L1	@cond_branch
	mov	r6, #0x3
.L2:
	ldr	r1, [r4, #0x4]
	add	r2, r1, #0
	and	r2, r2, r6
	ldr	r0, .L3 + 4
	bl	printf
	ldr	r0, [r4, #0x4]
	add	r5, r5, r0
	ldr	r4, [r4, #0xc]
	cmp	r4, #0
	bne	.L2	@cond_branch
.L1:
	ldr	r0, .L3 + 8
	mov	r2, #0xff
	lsl	r2, r2, #0xa
	sub	r2, r2, r5
	ldr	r1, .L3 + 12
	ldr	r3, [r1]
	add	r1, r5, #0
	bl	printf
	pop	{r4, r5, r6}
	pop	{r0}
	bx	r0
.L4:
	.align	2, 0
.L3:
	.4byte	0x3001150
	.4byte	0x87552a0
	.4byte	0x87552dc
	.4byte	0x300115c
	thumb_func_end printTotalExramUsage

.align 2, 0 @ Don't pad with nop.
