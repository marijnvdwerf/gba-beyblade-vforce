	.include "asm/common.inc"

	thumb_func_start sub_806586C
sub_806586C:
	add	r2, r1, #0
	lsl	r0, r0, #0x18
	lsr	r1, r0, #0x18
	cmp	r1, #0x3
	bhi	.L1	@cond_branch
	ldr	r0, .L3
	strb	r1, [r0]
	ldr	r1, .L3 + 4
	ldrb	r0, [r0]
	lsl	r0, r0, #0x2
	ldr	r3, .L3 + 8
	add	r0, r0, r3
	str	r0, [r1]
	ldr	r0, .L3 + 12
	str	r0, [r2]
	mov	r0, #0x0
	b	.L2
.L4:
	.align	2, 0
.L3:
	.4byte	0x3000da8
	.4byte	0x3000db0
	.4byte	0x4000100
	.4byte	onTimer2Overflow + 1
.L1:
	mov	r0, #0x1
.L2:
	bx	lr
	thumb_func_end sub_806586C

.align 2, 0 @ Don't pad with nop.
