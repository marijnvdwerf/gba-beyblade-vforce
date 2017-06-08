	.include "asm/common.inc"

	thumb_func_start sub_8062B90
sub_8062B90:
	ldr	r0, _2
	ldr	r0, [r0]
	cmp	r0, #0
	beq	_1	@cond_branch
	ldr	r1, _2 + 4
	mov	r0, #0x1
	str	r0, [r1]
_1:
	bx	lr
_3:
	.align	2, 0
_2:
	.word	_unk3005E00
	.word	_unk3005E0C
	thumb_func_end sub_8062B90

.align 2, 0 @ Don't pad with nop.
