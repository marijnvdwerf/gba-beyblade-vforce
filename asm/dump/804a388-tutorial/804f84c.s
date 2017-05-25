	.include "asm/common.inc"

	thumb_func_start sub_804F84C
sub_804F84C:
	lsl	r0, r0, #0x18
	ldr	r1, .L3
	ldr	r1, [r1]
	cmp	r0, #0
	beq	.L1	@cond_branch
	mov	r0, #0x84
	lsl	r0, r0, #0x5
	add	r1, r1, r0
	mov	r0, #0xa0
	lsl	r0, r0, #0x2
	b	.L2
.L4:
	.align	2, 0
.L3:
	.4byte	0x3000fb0
.L1:
	mov	r0, #0x84
	lsl	r0, r0, #0x5
	add	r1, r1, r0
	ldr	r0, .L5
.L2:
	str	r0, [r1]
	bx	lr
.L6:
	.align	2, 0
.L5:
	.4byte	0xffffd000
	thumb_func_end sub_804F84C

.align 2, 0 @ Don't pad with nop.
