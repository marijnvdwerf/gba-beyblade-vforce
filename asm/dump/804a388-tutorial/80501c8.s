	.include "asm/common.inc"

	thumb_func_start sub_80501C8
sub_80501C8:
	add	r2, r0, #0
	lsl	r1, r1, #0x18
	lsr	r3, r1, #0x18
	ldr	r0, .L3
	ldr	r1, [r0]
	ldr	r0, .L3 + 4
	add	r1, r1, r0
	mov	r0, #0x1
	ldrh	r1, [r1]
	and	r0, r0, r1
	cmp	r0, #0
	bne	.L1	@cond_branch
	ldrb	r2, [r2, #0xd]
	lsl	r0, r2, #0x1c
	lsr	r0, r0, #0x1c
	and	r0, r0, r3
	b	.L2
.L4:
	.align	2, 0
.L3:
	.4byte	0x3000fb0
	.4byte	0x161c
.L1:
	mov	r0, #0x0
.L2:
	bx	lr
	thumb_func_end sub_80501C8

.align 2, 0 @ Don't pad with nop.
