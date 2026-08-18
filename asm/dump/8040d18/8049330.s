	.include "asm/common.inc"

	thumb_func_start sub_8049330
sub_8049330:
	ldr	r1, .L804933C
	ldr	r2, .L804933C + 4
	add	r1, r1, r2
	str	r0, [r1]
	bx	lr
.L804933A:
	.align	2, 0
.L804933C:
	.4byte	0x3000650
	.4byte	0x58c
	thumb_func_end sub_8049330

.align 2, 0 @ Don't pad with nop.
