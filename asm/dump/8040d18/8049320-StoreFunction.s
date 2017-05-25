	.include "asm/common.inc"

	thumb_func_start StoreFunction
StoreFunction:
	ldr	r1, .L1
	mov	r2, #0xb1
	lsl	r2, r2, #0x3
	add	r1, r1, r2
	str	r0, [r1]
	bx	lr
.L2:
	.align	2, 0
.L1:
	.4byte	0x3000650
	thumb_func_end StoreFunction

.align 2, 0 @ Don't pad with nop.
