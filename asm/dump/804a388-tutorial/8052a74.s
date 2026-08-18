	.include "asm/common.inc"

	thumb_func_start sub_8052A74
sub_8052A74:
	push	{r4, r5, lr}
	ldr	r4, .L8052A8C
	mov	r5, #0x0
	ldr	r0, .L8052A8C + 4
	bl	printf
.L8052A80:
	ldr	r0, [r4]
	cmp	r0, #0
	beq	.L8052A94	@cond_branch
	mov	r5, #0x0
	b	.L8052A96
.L8052A8A:
	.align	2, 0
.L8052A8C:
	.4byte	0x3007fa0
	.4byte	0x8729440
.L8052A94:
	add	r5, r5, #0x1
.L8052A96:
	sub	r4, r4, #0x4
	cmp	r5, #0xf
	ble	.L8052A80	@cond_branch
	ldr	r0, .L8052AB0
	ldr	r1, .L8052AB0 + 4
	add	r2, r4, #0
	add	r2, r2, #0x40
	bl	printf
	pop	{r4, r5}
	pop	{r0}
	bx	r0
.L8052AAE:
	.align	2, 0
.L8052AB0:
	.4byte	0x8729458
	.4byte	0x3007fa0
	thumb_func_end sub_8052A74

.align 2, 0 @ Don't pad with nop.
