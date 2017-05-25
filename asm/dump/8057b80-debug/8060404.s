	.include "asm/common.inc"

	thumb_func_start sub_8060404
sub_8060404:
	ldr	r3, .L2
	ldr	r2, [r3]
	ldr	r0, .L2 + 4
	ldrh	r0, [r0]
	lsr	r0, r0, #0x4
	mov	r1, #0x3
	and	r0, r0, r1
	strb	r0, [r2, #0x2]
	ldr	r0, [r3]
	ldrb	r1, [r0, #0x4]
	ldrb	r2, [r0, #0x2]
	cmp	r2, r1
	bcs	.L1	@cond_branch
	strb	r1, [r0, #0x3]
	ldr	r0, [r3]
	ldr	r1, [r0, #0x14]
	mov	r2, #0x2
	orr	r1, r1, r2
	str	r1, [r0, #0x14]
.L1:
	bx	lr
.L3:
	.align	2, 0
.L2:
	.4byte	0x3005dc4
	.4byte	0x4000128
	thumb_func_end sub_8060404

.align 2, 0 @ Don't pad with nop.
