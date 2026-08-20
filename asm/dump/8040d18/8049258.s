	.include "asm/common.inc"

	thumb_func_start sub_8049258
sub_8049258:
	ldr	r0, .L8049260
	ldr	r0, [r0, #0x10]
	bx	lr
.L804925E:
	.align	2, 0
.L8049260:
	.4byte	_unk3000650
	thumb_func_end sub_8049258

.align 2, 0 @ Don't pad with nop.
