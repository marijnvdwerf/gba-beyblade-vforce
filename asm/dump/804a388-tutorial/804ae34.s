	.include "asm/common.inc"

	thumb_func_start sub_804AE34
sub_804AE34:
	push	{r4, r5, r6, r7, lr}
	add	r5, r0, #0
	add	r6, r1, #0
	bl	sub_804AE8C
	ldr	r7, .L2
	ldr	r0, [r7]
	ldr	r1, .L2 + 4
	add	r0, r0, r1
	ldrh	r0, [r0]
	cmp	r0, #0
	beq	.L1	@cond_branch
	ldr	r4, .L2 + 8
	ldr	r0, [r4]
	ldr	r2, .L2 + 12
	add	r0, r0, r2
	strh	r5, [r0]
	add	r0, r5, #0
	add	r1, r6, #0
	bl	sub_8062BFC
	ldr	r1, [r4]
	ldr	r2, .L2 + 16
	add	r1, r1, r2
	str	r0, [r1]
	ldr	r1, [r7]
	ldr	r2, .L2 + 4
	add	r1, r1, r2
	ldrh	r1, [r1]
	bl	sub_8062AD4
.L1:
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L3:
	.align	2, 0
.L2:
	.4byte	0x3000f48
	.4byte	0x6e4
	.4byte	0x3000fb0
	.4byte	0xc24
	.4byte	0xc28
	thumb_func_end sub_804AE34

.align 2, 0 @ Don't pad with nop.
