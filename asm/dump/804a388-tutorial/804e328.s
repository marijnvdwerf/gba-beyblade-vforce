	.include "asm/common.inc"

	thumb_func_start sub_804E328
sub_804E328:
	push	{lr}
	lsl	r0, r0, #0x18
	lsr	r0, r0, #0x18
	lsl	r1, r1, #0x18
	lsr	r1, r1, #0x18
	bl	sub_804E358
	lsl	r0, r0, #0x10
	asr	r1, r0, #0x10
	cmp	r1, #0x3f
	ble	.L1	@cond_branch
	add	r0, r1, #0
	sub	r0, r0, #0x40
	lsl	r0, r0, #0x11
	NEG	r0, r0
	b	.L2
.L1:
	mov	r0, #0x40
	sub	r0, r0, r1
	lsl	r0, r0, #0x11
.L2:
	lsr	r0, r0, #0x10
	lsl	r0, r0, #0x10
	asr	r0, r0, #0x10
	pop	{r1}
	bx	r1
	thumb_func_end sub_804E328

.align 2, 0 @ Don't pad with nop.
