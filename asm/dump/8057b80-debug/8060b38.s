	.include "asm/common.inc"

	thumb_func_start sub_8060B38
sub_8060B38:
	add	r3, r0, #0
	ldrb	r0, [r3, #0x19]
	cmp	r0, #0
	bne	.L8060B5E	@cond_branch
	ldr	r2, [r3]
	ldr	r1, [r3, #0x4]
	cmp	r2, #0
	beq	.L8060B4C	@cond_branch
	str	r1, [r2, #0x4]
	b	.L8060B50
.L8060B4C:
	ldr	r0, .L8060B60
	str	r1, [r0]
.L8060B50:
	cmp	r1, #0
	beq	.L8060B56	@cond_branch
	str	r2, [r1]
.L8060B56:
	ldr	r1, .L8060B60 + 4
	ldr	r0, [r1]
	str	r0, [r3, #0x4]
	str	r3, [r1]
.L8060B5E:
	bx	lr
.L8060B60:
	.align	2, 0

	.4byte	_unk3005DF8
	.4byte	_rotationScale_end
	thumb_func_end sub_8060B38

.align 2, 0 @ Don't pad with nop.
