	.include "asm/common.inc"

	thumb_func_start sub_80558E8
sub_80558E8:
	add	r2, r0, #0
	ldr	r0, .L4
	ldr	r0, [r0]
	cmp	r2, #0
	beq	.L1	@cond_branch
	cmp	r2, #0x1
	beq	.L2	@cond_branch
	b	.L3
.L5:
	.align	2, 0
.L4:
	.4byte	0x3000fb0
.L1:
	ldr	r2, .L7
	b	.L6
.L8:
	.align	2, 0
.L7:
	.4byte	0x10f6
.L2:
	ldr	r2, .L9
.L6:
	add	r1, r0, r2
	mov	r0, #0x8
	strh	r0, [r1]
.L3:
	bx	lr
.L10:
	.align	2, 0
.L9:
	.4byte	0x10f4
	thumb_func_end sub_80558E8

.align 2, 0 @ Don't pad with nop.
