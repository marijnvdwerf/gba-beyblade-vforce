	.include "asm/common.inc"

	thumb_func_start sub_8048F80
sub_8048F80:
	add	r1, r0, #0
	mov	r2, #0x1
	neg	r2, r2
	ldrb	r0, [r1]
	sub	r0, r0, #0x30
	lsl	r0, r0, #0x18
	lsr	r0, r0, #0x18
	cmp	r0, #0x9
	bhi	.L8048FB0	@cond_branch
	mov	r2, #0x0
.L8048F94:
	lsl	r0, r2, #0x2
	add	r0, r0, r2
	lsl	r2, r0, #0x1
	add	r0, r2, #0
	sub	r0, r0, #0x30
	ldrb	r3, [r1]
	add	r2, r3, r0
	add	r1, r1, #0x1
	ldrb	r0, [r1]
	sub	r0, r0, #0x30
	lsl	r0, r0, #0x18
	lsr	r0, r0, #0x18
	cmp	r0, #0x9
	bls	.L8048F94	@cond_branch
.L8048FB0:
	add	r0, r2, #0
	bx	lr
	thumb_func_end sub_8048F80

.align 2, 0 @ Don't pad with nop.
