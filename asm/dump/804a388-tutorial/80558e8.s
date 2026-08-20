	.include "asm/common.inc"

	thumb_func_start sub_80558E8
sub_80558E8:
	add	r2, r0, #0
	ldr	r0, .L80558F8
	ldr	r0, [r0]
	cmp	r2, #0
	beq	.L80558FC	@cond_branch
	cmp	r2, #0x1
	beq	.L8055904	@cond_branch
	b	.L805590C
.L80558F8:
	.align	2, 0

	.4byte	_gameData
.L80558FC:
	ldr	r2, .L8055900
	b	.L8055906
.L8055900:
	.align	2, 0

	.4byte	0x10f6
.L8055904:
	ldr	r2, .L8055910
.L8055906:
	add	r1, r0, r2
	mov	r0, #0x8
	strh	r0, [r1]
.L805590C:
	bx	lr
.L805590E:
	.align	2, 0
.L8055910:
	.4byte	0x10f4
	thumb_func_end sub_80558E8

.align 2, 0 @ Don't pad with nop.
