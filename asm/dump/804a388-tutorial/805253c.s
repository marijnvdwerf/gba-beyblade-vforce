	.include "asm/common.inc"

	thumb_func_start sub_805253C
sub_805253C:
	push	{lr}
	ldr	r0, .L1
	ldr	r1, [r0]
	ldr	r2, .L1 + 4
	add	r0, r1, r2
	mov	r2, #0x0
	str	r2, [r0]
	mov	r3, #0xaa
	lsl	r3, r3, #0x5
	add	r0, r1, r3
	str	r2, [r0]
	add	r3, r3, #0x4
	add	r0, r1, r3
	str	r2, [r0]
	ldr	r0, .L1 + 8
	add	r1, r1, r0
	str	r2, [r1]
	ldr	r0, .L1 + 12
	ldr	r1, .L1 + 16
	mov	r2, #0x80
	lsl	r2, r2, #0x4
	ldr	r3, [r0]
	mov	r0, #0x0
	bl	call_via_r3
	pop	{r0}
	bx	r0
.L2:
	.align	2, 0
.L1:
	.4byte	0x3000fb0
	.4byte	0x153c
	.4byte	0x1548
	.4byte	0x807d970
	.4byte	0x6012000
	thumb_func_end sub_805253C

.align 2, 0 @ Don't pad with nop.
