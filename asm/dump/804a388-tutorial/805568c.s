	.include "asm/common.inc"

	thumb_func_start sub_805568C
sub_805568C:
	push	{r4, lr}
	ldr	r0, .L1
	ldr	r4, [r0]
	ldr	r0, .L1 + 4
	add	r1, r4, r0
	mov	r0, #0x0
	str	r0, [r1]
	ldr	r0, .L1 + 8
	add	r1, r4, r0
	mov	r0, #0xa1
	strh	r0, [r1]
	add	r0, r4, #0
	bl	sub_804B7FC
	ldr	r1, .L1 + 12
	add	r4, r4, r1
	str	r0, [r4]
	pop	{r4}
	pop	{r0}
	bx	r0
.L2:
	.align	2, 0
.L1:
	.4byte	0x3000fb0
	.4byte	0x1108
	.4byte	0x10fe
	.4byte	0x110c
	thumb_func_end sub_805568C

.align 2, 0 @ Don't pad with nop.
