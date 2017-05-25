	.include "asm/common.inc"

	thumb_func_start sub_8060B38
sub_8060B38:
	add	r3, r0, #0
	ldrb	r0, [r3, #0x19]
	cmp	r0, #0
	bne	.L1	@cond_branch
	ldr	r2, [r3]
	ldr	r1, [r3, #0x4]
	cmp	r2, #0
	beq	.L2	@cond_branch
	str	r1, [r2, #0x4]
	b	.L3
.L2:
	ldr	r0, .L5
	str	r1, [r0]
.L3:
	cmp	r1, #0
	beq	.L4	@cond_branch
	str	r2, [r1]
.L4:
	ldr	r1, .L5 + 4
	ldr	r0, [r1]
	str	r0, [r3, #0x4]
	str	r3, [r1]
.L1:
	bx	lr
.L6:
	.align	2, 0
.L5:
	.4byte	0x3005df8
	.4byte	0x3005de8
	thumb_func_end sub_8060B38

.align 2, 0 @ Don't pad with nop.
