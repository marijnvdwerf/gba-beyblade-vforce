	.include "asm/common.inc"

	thumb_func_start sub_8062694
sub_8062694:
	push	{r4, lr}
	ldr	r0, .L1
	mov	r1, #0x0
	strh	r1, [r0]
	sub	r0, r0, #0x2
	strh	r1, [r0]
	add	r0, r0, #0x42
	mov	r1, #0x0
	str	r1, [r0]
	add	r0, r0, #0xc
	str	r1, [r0]
	add	r0, r0, #0x34
	str	r1, [r0]
	sub	r0, r0, #0x4
	str	r1, [r0]
	ldr	r3, .L1 + 4
	ldr	r0, .L1 + 8
	ldr	r1, [r0]
	ldr	r0, .L1 + 12
	ldrh	r4, [r0]
	lsl	r2, r4, #0x1
	add	r2, r2, r4
	ldr	r3, [r3]
	mov	r0, #0x0
	bl	call_via_r3
	pop	{r4}
	pop	{r0}
	bx	r0
.L2:
	.align	2, 0
.L1:
	.4byte	0x4000084
	.4byte	0x807d970
	.4byte	0x3005e1c
	.4byte	0x3005e4c
	thumb_func_end sub_8062694

.align 2, 0 @ Don't pad with nop.
