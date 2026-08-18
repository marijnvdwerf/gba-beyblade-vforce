	.include "asm/common.inc"

	thumb_func_start SetRiderGlobal
SetRiderGlobal:
	ldr	r1, .L80540E8
	str	r0, [r1]
	bx	lr
.L80540E6:
	.align	2, 0
.L80540E8:
	.4byte	0x3000c10
	thumb_func_end SetRiderGlobal

.align 2, 0 @ Don't pad with nop.
