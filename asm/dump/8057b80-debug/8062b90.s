	.include "asm/common.inc"

	thumb_func_start sub_8062B90
sub_8062B90:
	ldr	r0, .L2
	ldr	r0, [r0]
	cmp	r0, #0
	beq	.L1	@cond_branch
	ldr	r1, .L2 + 4
	mov	r0, #0x1
	str	r0, [r1]
.L1:
	bx	lr
.L3:
	.align	2, 0
.L2:
	.4byte	0x3005e00
	.4byte	0x3005e0c
	thumb_func_end sub_8062B90

.align 2, 0 @ Don't pad with nop.
