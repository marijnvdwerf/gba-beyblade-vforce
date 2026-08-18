	.include "asm/common.inc"

	thumb_func_start sub_8055B7C
sub_8055B7C:
	add	r2, r0, #0
	lsl	r1, r1, #0x18
	lsr	r1, r1, #0x18
	cmp	r1, #0
	beq	.L8055B92	@cond_branch
	mov	r0, #0xf4
	lsl	r0, r0, #0x8
	str	r0, [r2, #0x20]
	mov	r0, #0x0
	str	r0, [r2, #0x24]
	b	.L8055B98
.L8055B92:
	ldr	r0, .L8055B9C
	str	r0, [r2, #0x18]
	str	r1, [r2, #0x1c]
.L8055B98:
	bx	lr
.L8055B9A:
	.align	2, 0
.L8055B9C:
	.4byte	0xffffbc00
	thumb_func_end sub_8055B7C

.align 2, 0 @ Don't pad with nop.
