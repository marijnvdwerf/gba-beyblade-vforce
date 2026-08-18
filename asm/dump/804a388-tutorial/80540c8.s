	.include "asm/common.inc"

	thumb_func_start sub_80540C8
sub_80540C8:
	add	r1, r0, #0
	cmp	r0, #0
	bge	.L80540D0	@cond_branch
	NEG	r0, r0
.L80540D0:
	asr	r0, r0, #0x3
	cmp	r0, r2
	ble	.L80540D8	@cond_branch
	add	r0, r2, #0
.L80540D8:
	cmp	r1, #0
	bge	.L80540DE	@cond_branch
	NEG	r0, r0
.L80540DE:
	bx	lr
	thumb_func_end sub_80540C8

.align 2, 0 @ Don't pad with nop.
