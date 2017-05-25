	.include "asm/common.inc"

	thumb_func_start sub_804E124
sub_804E124:
	add	r2, r0, #0
	mov	r0, #0x2
	ldrb	r3, [r1, #0x11]
	and	r0, r0, r3
	cmp	r0, #0
	beq	.L1	@cond_branch
	mov	r0, #0x18
	ldsb	r0, [r1, r0]
	lsl	r1, r0, #0x2
	add	r1, r1, r0
	asr	r1, r1, #0x3
	ldr	r0, [r2, #0x40]
	sub	r0, r0, r1
	str	r0, [r2, #0x40]
	b	.L2
.L1:
	mov	r0, #0x18
	ldsb	r0, [r1, r0]
	lsl	r1, r0, #0x2
	add	r1, r1, r0
	asr	r1, r1, #0x3
	ldr	r0, [r2, #0x44]
	add	r0, r0, r1
	str	r0, [r2, #0x44]
.L2:
	bx	lr
	thumb_func_end sub_804E124

.align 2, 0 @ Don't pad with nop.
