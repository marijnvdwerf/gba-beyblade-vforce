	.include "asm/common.inc"

	thumb_func_start sub_8060B0C
sub_8060B0C:
	ldr	r2, .L8060B30
	ldr	r1, [r2]
	cmp	r1, #0
	beq	.L8060B2C	@cond_branch
	ldr	r0, [r1, #0x4]
	str	r0, [r2]
	ldr	r2, .L8060B30 + 4
	ldr	r0, [r2]
	cmp	r0, #0
	beq	.L8060B22	@cond_branch
	str	r1, [r0]
.L8060B22:
	ldr	r0, [r2]
	str	r0, [r1, #0x4]
	mov	r0, #0x0
	str	r0, [r1]
	str	r1, [r2]
.L8060B2C:
	add	r0, r1, #0
	bx	lr
.L8060B30:
	.align	2, 0

	.4byte	0x3005de8
	.4byte	0x3005df8
	thumb_func_end sub_8060B0C

.align 2, 0 @ Don't pad with nop.
