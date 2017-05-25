	.include "asm/common.inc"

	thumb_func_start sub_8062BA8
sub_8062BA8:
	push	{r4, r5, lr}
	add	r4, r0, #0
	ldr	r5, .L2
	ldr	r0, [r5]
	ldr	r0, [r0]
	cmp	r4, r0
	bcs	.L1	@cond_branch
	bl	sub_8062B2C
	ldr	r2, .L2 + 4
	ldr	r0, [r5]
	ldr	r1, [r0, #0x8]
	lsl	r0, r4, #0x3
	add	r0, r0, r1
	ldr	r1, [r0]
	str	r1, [r2]
	ldr	r1, .L2 + 8
	ldr	r0, [r0, #0x4]
	str	r0, [r1]
	ldr	r0, .L2 + 12
	mov	r1, #0x0
	str	r1, [r0]
	ldr	r0, .L2 + 16
	str	r1, [r0]
	ldr	r1, .L2 + 20
	mov	r0, #0x1
	str	r0, [r1]
.L1:
	pop	{r4, r5}
	pop	{r0}
	bx	r0
.L3:
	.align	2, 0
.L2:
	.4byte	0x3005e14
	.4byte	0x3005e00
	.4byte	0x3005e20
	.4byte	0x3005e08
	.4byte	0x3005e10
	.4byte	0x3005e0c
	thumb_func_end sub_8062BA8

.align 2, 0 @ Don't pad with nop.
