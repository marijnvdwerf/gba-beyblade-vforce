	.include "asm/common.inc"

	thumb_func_start sub_80626E0
sub_80626E0:
	push	{r4, r5, lr}
	ldr	r1, .L1
	mov	r0, #0x80
	strh	r0, [r1]
	sub	r1, r1, #0x2
	ldr	r2, .L1 + 4
	add	r0, r2, #0
	strh	r0, [r1]
	add	r1, r1, #0x3a
	ldr	r0, .L1 + 8
	ldr	r5, [r0]
	str	r5, [r1]
	add	r1, r1, #0x4
	ldr	r0, .L1 + 12
	str	r0, [r1]
	add	r1, r1, #0x4
	mov	r0, #0xb6
	lsl	r0, r0, #0x18
	str	r0, [r1]
	ldr	r2, .L1 + 16
	ldr	r0, .L1 + 20
	ldrh	r0, [r0]
	sub	r0, r0, #0x2
	mov	r1, #0xc4
	lsl	r1, r1, #0x10
	orr	r0, r0, r1
	str	r0, [r2]
	ldr	r4, .L1 + 24
	ldr	r0, .L1 + 28
	ldr	r1, [r0]
	ldr	r0, .L1 + 32
	bl	sub_80661C0
	mov	r2, #0x80
	lsl	r2, r2, #0x9
	sub	r0, r2, r0
	mov	r1, #0x80
	lsl	r1, r1, #0x10
	orr	r0, r0, r1
	str	r0, [r4]
	ldr	r0, .L1 + 36
	str	r5, [r0]
	ldr	r1, .L1 + 40
	ldr	r0, .L1 + 44
	ldrh	r0, [r0]
	sub	r2, r2, r0
	str	r2, [r1]
	pop	{r4, r5}
	pop	{r0}
	bx	r0
.L2:
	.align	2, 0
.L1:
	.4byte	0x4000084
	.4byte	0xb04
	.4byte	0x3005e1c
	.4byte	0x40000a0
	.4byte	0x4000104
	.4byte	0x3005e18
	.4byte	0x4000100
	.4byte	0x3005e40
	.4byte	0x1000ae0
	.4byte	0x3000d90
	.4byte	0x3000d94
	.4byte	0x3005e4c
	thumb_func_end sub_80626E0

.align 2, 0 @ Don't pad with nop.
