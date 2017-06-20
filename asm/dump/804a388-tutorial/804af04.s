	.include "asm/common.inc"

	thumb_func_start sub_804AF04
sub_804AF04:
	push	{r4, r5, lr}
	add	r4, r0, #0
	bl	sub_804AF5C
	ldr	r5, .L1
	ldr	r0, [r5]
	ldr	r1, .L1 + 4
	add	r0, r0, r1
	strh	r4, [r0]
	ldr	r1, .L1 + 8
	lsl	r4, r4, #0x3
	add	r0, r4, r1
	ldr	r0, [r0]
	add	r1, r1, #0x4
	add	r4, r4, r1
	ldr	r1, [r4]
	bl	Sound_8062990
	ldr	r1, [r5]
	ldr	r2, .L1 + 12
	add	r1, r1, r2
	str	r0, [r1]
	ldr	r1, .L1 + 16
	ldr	r1, [r1]
	ldr	r2, .L1 + 20
	add	r1, r1, r2
	ldrh	r1, [r1]
	bl	Sound_8062AD4
	pop	{r4, r5}
	pop	{r0}
	bx	r0
.L2:
	.align	2, 0
.L1:
	.4byte	0x3000fb0
	.4byte	0xc26
	.4byte	0x807561c
	.4byte	0xc2c
	.4byte	0x3000f48
	.4byte	0x6e6
	thumb_func_end sub_804AF04

.align 2, 0 @ Don't pad with nop.
