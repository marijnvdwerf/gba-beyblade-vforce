	.include "asm/common.inc"

	thumb_func_start sub_804393C
sub_804393C:
	ldrb	r1, [r0, #0x2]
	lsr	r2, r1, #0x4
	lsl	r1, r1, #0x1c
	lsr	r1, r1, #0x1c
	add	r2, r2, r1
	mov	r1, #0x0
	add	r3, r0, #4
.L1:
	add	r0, r3, r1
	ldrb	r0, [r0]
	lsl	r0, r0, #0x18
	asr	r0, r0, #0x18
	EOR	r2, r0
	add	r1, r1, #0x1
	cmp	r1, #0xb
	ble	.L1	@cond_branch
	lsl	r0, r2, #0x18
	lsr	r0, r0, #0x18
	bx	lr
	thumb_func_end sub_804393C

.align 2, 0 @ Don't pad with nop.
