	.include "asm/common.inc"

	thumb_func_start sub_804F9B4
sub_804F9B4:
	push	{r4, r5, lr}
	ldr	r0, .L1
	ldr	r2, [r0]
	ldr	r0, .L1 + 4
	add	r1, r2, r0
	mov	r5, #0x0
	mov	r0, #0xc8
	lsl	r0, r0, #0x1
	strh	r0, [r1]
	ldr	r0, .L1 + 8
	add	r1, r2, r0
	mov	r0, #0x1
	strh	r0, [r1]
	ldr	r1, .L1 + 12
	add	r0, r2, r1
	strh	r5, [r0]
	add	r1, r1, #0x2
	add	r0, r2, r1
	strh	r5, [r0]
	ldr	r0, .L1 + 16
	add	r4, r2, r0
	ldr	r1, [r4]
	mov	r0, #0x94
	lsl	r0, r0, #0x7
	str	r0, [r1, #0x8]
	ldr	r1, .L1 + 20
	add	r3, r2, r1
	ldr	r1, [r3]
	mov	r0, #0x8a
	lsl	r0, r0, #0x8
	str	r0, [r1, #0x8]
	ldr	r0, .L1 + 24
	add	r2, r2, r0
	ldr	r1, [r2]
	mov	r0, #0x84
	lsl	r0, r0, #0x7
	str	r0, [r1, #0x8]
	ldr	r0, [r4]
	ldr	r1, .L1 + 28
	str	r1, [r0, #0xc]
	ldr	r0, [r3]
	str	r1, [r0, #0xc]
	ldr	r0, [r2]
	str	r1, [r0, #0xc]
	ldr	r0, [r4]
	strh	r5, [r0, #0x18]
	ldr	r0, [r3]
	strh	r5, [r0, #0x18]
	ldr	r0, [r2]
	strh	r5, [r0, #0x18]
	pop	{r4, r5}
	pop	{r0}
	bx	r0
.L2:
	.align	2, 0
.L1:
	.4byte	0x3000fb0
	.4byte	0x1054
	.4byte	0x105c
	.4byte	0x1056
	.4byte	0x1044
	.4byte	0x1048
	.4byte	0x1050
	.4byte	0xffffe000
	thumb_func_end sub_804F9B4

.align 2, 0 @ Don't pad with nop.
