	.include "asm/common.inc"

	thumb_func_start sub_8056F7C
sub_8056F7C:
	push	{r4, lr}
	ldr	r0, .L1
	ldr	r4, [r0]
	bl	sub_8051734
	ldr	r1, .L1 + 4
	add	r0, r0, #0x10
	ldr	r2, .L1 + 8
	add	r4, r4, r2
	ldr	r3, [r1]
	add	r1, r4, #0
	mov	r2, #0x4
	bl	_call_via_r3
	pop	{r4}
	pop	{r0}
	bx	r0
.L2:
	.align	2, 0
.L1:
	.4byte	0x3000fb0
	.4byte	0x807d974
	.4byte	0x13f8
	thumb_func_end sub_8056F7C

.align 2, 0 @ Don't pad with nop.
