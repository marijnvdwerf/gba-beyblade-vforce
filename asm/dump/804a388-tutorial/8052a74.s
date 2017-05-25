	.include "asm/common.inc"

	thumb_func_start sub_8052A74
sub_8052A74:
	push	{r4, r5, lr}
	ldr	r4, .L3
	mov	r5, #0x0
	ldr	r0, .L3 + 4
	bl	printf
.L5:
	ldr	r0, [r4]
	cmp	r0, #0
	beq	.L1	@cond_branch
	mov	r5, #0x0
	b	.L2
.L4:
	.align	2, 0
.L3:
	.4byte	0x3007fa0
	.4byte	0x8729440
.L1:
	add	r5, r5, #0x1
.L2:
	sub	r4, r4, #0x4
	cmp	r5, #0xf
	ble	.L5	@cond_branch
	ldr	r0, .L6
	ldr	r1, .L6 + 4
	add	r2, r4, #0
	add	r2, r2, #0x40
	bl	printf
	pop	{r4, r5}
	pop	{r0}
	bx	r0
.L7:
	.align	2, 0
.L6:
	.4byte	0x8729458
	.4byte	0x3007fa0
	thumb_func_end sub_8052A74

.align 2, 0 @ Don't pad with nop.
