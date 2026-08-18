	.include "asm/common.inc"

	thumb_func_start sub_805BAC0
sub_805BAC0:
	ldr	r2, [r0, #0xc]
	sub	r1, r1, r2
	lsr	r1, r1, #0x5
	ldr	r0, [r0]
	ldr	r0, [r0, #0x8]
	cmp	r1, r0
	bcc	.L805BAD4	@cond_branch
	mov	r0, #0x1
	NEG	r0, r0
	b	.L805BAD6
.L805BAD4:
	add	r0, r1, #0
.L805BAD6:
	bx	lr
	thumb_func_end sub_805BAC0

.align 2, 0 @ Don't pad with nop.
