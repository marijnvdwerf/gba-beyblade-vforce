	.include "asm/common.inc"

	thumb_func_start loadPalette2
loadPalette2:
	push	{lr}
	ldr	r3, .L1
	ldr	r1, .L1 + 4
	mov	r2, #0x80
	lsl	r2, r2, #0x2
	ldr	r3, [r3]
	bl	_call_via_r3
	pop	{r0}
	bx	r0
.L2:
	.align	2, 0
.L1:
	.4byte	0x807d974
	.4byte	0x5000200
	thumb_func_end loadPalette2

.align 2, 0 @ Don't pad with nop.
