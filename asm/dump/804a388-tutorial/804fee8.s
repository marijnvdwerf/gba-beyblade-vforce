	.include "asm/common.inc"

	thumb_func_start sub_804FEE8
sub_804FEE8:
	push	{r4, r5, r6, lr}
	ldr	r0, .L2
	ldr	r4, [r0]
	mov	r0, #0xf5
	lsl	r0, r0, #0x4
	add	r6, r4, r0
	mov	r1, #0x82
	lsl	r1, r1, #0x5
	add	r5, r4, r1
	ldr	r0, [r5]
	cmp	r0, #0
	beq	.L1	@cond_branch
	add	r0, r6, #0
	bl	sub_8061228
	mov	r1, #0xf8
	lsl	r1, r1, #0x4
	add	r0, r4, r1
	bl	sub_8061228
	ldr	r1, .L2 + 4
	add	r0, r4, r1
	bl	sub_8050584
	ldr	r1, .L2 + 8
	add	r0, r4, r1
	bl	sub_8050584
	mov	r0, #0x0
	str	r0, [r5]
.L1:
	add	r0, r6, #0
	bl	sub_8061204
	mov	r1, #0xf8
	lsl	r1, r1, #0x4
	add	r0, r4, r1
	bl	sub_8061204
	mov	r1, #0xfb
	lsl	r1, r1, #0x4
	add	r0, r4, r1
	bl	sub_8061204
	mov	r1, #0xfe
	lsl	r1, r1, #0x4
	add	r0, r4, r1
	bl	sub_8061204
	pop	{r4, r5, r6}
	pop	{r0}
	bx	r0
.L3:
	.align	2, 0
.L2:
	.4byte	0x3000fb0
	.4byte	0x1010
	.4byte	0x1028
	thumb_func_end sub_804FEE8

.align 2, 0 @ Don't pad with nop.
