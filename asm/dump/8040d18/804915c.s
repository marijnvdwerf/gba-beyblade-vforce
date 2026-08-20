	.include "asm/common.inc"

	thumb_func_start sub_804915C
sub_804915C:
	ldr	r0, .L8049164
	ldr	r0, [r0, #0x8]
	bx	lr
.L8049162:
	.align	2, 0
.L8049164:
	.4byte	_unk3000650
	thumb_func_end sub_804915C

.align 2, 0 @ Don't pad with nop.
