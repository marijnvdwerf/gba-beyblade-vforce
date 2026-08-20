	.include "asm/common.inc"

	thumb_func_start sub_8063058
sub_8063058:
	ldr	r0, .L8063068
	ldr	r0, [r0]
	cmp	r0, #0
	beq	.L8063066	@cond_branch
.L8063060:
	ldr	r0, [r0, #0x10]
	cmp	r0, #0
	bne	.L8063060	@cond_branch
.L8063066:
	bx	lr
.L8063068:
	.align	2, 0

	.4byte	_unk3005E60
	thumb_func_end sub_8063058

.align 2, 0 @ Don't pad with nop.
