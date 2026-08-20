	.include "asm/common.inc"

	thumb_func_start sub_8052AB8
sub_8052AB8:
	push	{r4, r5, lr}
	ldr	r4, .L8052AD0
	mov	r5, #0x0
	ldr	r0, .L8052AD0 + 4
	bl	printf
.L8052AC4:
	ldr	r0, [r4]
	cmp	r0, #0
	beq	.L8052AD8	@cond_branch
	mov	r5, #0x0
	b	.L8052ADA
.L8052ACE:
	.align	2, 0
.L8052AD0:
	.4byte	0x3007ec0
	.4byte	Str_8729478
.L8052AD8:
	add	r5, r5, #0x1
.L8052ADA:
	sub	r4, r4, #0x4
	cmp	r5, #0xf
	ble	.L8052AC4	@cond_branch
	ldr	r0, .L8052AF4
	ldr	r1, .L8052AF4 + 4
	add	r2, r4, #0
	add	r2, r2, #0x40
	bl	printf
	pop	{r4, r5}
	pop	{r0}
	bx	r0
.L8052AF2:
	.align	2, 0
.L8052AF4:
	.4byte	Str_872948C
	.4byte	0x3007ec0
	thumb_func_end sub_8052AB8

.align 2, 0 @ Don't pad with nop.
