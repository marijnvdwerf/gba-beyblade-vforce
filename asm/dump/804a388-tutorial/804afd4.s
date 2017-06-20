	.include "asm/common.inc"

	thumb_func_start sub_804AFD4
sub_804AFD4:
	push	{r4, lr}
	add	r4, r0, #0
	lsl	r4, r4, #0x10
	lsr	r4, r4, #0x10
	ldr	r0, .L1
	ldr	r0, [r0]
	ldr	r1, .L1 + 4
	add	r0, r0, r1
	ldr	r0, [r0]
	add	r1, r4, #0
	bl	Sound_8062AD4
	ldr	r0, .L1 + 8
	ldr	r0, [r0]
	ldr	r1, .L1 + 12
	add	r0, r0, r1
	strh	r4, [r0]
	pop	{r4}
	pop	{r0}
	bx	r0
.L2:
	.align	2, 0
.L1:
	.4byte	0x3000fb0
	.4byte	0xc2c
	.4byte	0x3000f48
	.4byte	0x6e6
	thumb_func_end sub_804AFD4

.align 2, 0 @ Don't pad with nop.
