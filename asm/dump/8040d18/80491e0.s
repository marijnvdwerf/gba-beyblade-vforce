	.include "asm/common.inc"

	thumb_func_start sub_80491E0
sub_80491E0:
	add	r2, r0, #0
	lsr	r3, r2, #0x1f
	cmp	r2, #0
	beq	.L7	@cond_branch
	cmp	r3, #0
	beq	.L3	@cond_branch
	NEG	r2, r2
	b	.L3
.L5:
	asr	r1, r1, #0x1
.L3:
	cmp	r1, #0
	beq	.L4	@cond_branch
	lsl	r0, r1, #0x8
	cmp	r2, r0
	ble	.L5	@cond_branch
	add	r2, r1, #0
	cmp	r1, #0
	bne	.L6	@cond_branch
.L4:
	mov	r2, #0x1
.L6:
	cmp	r3, #0
	beq	.L7	@cond_branch
	NEG	r2, r2
.L7:
	add	r0, r2, #0
	bx	lr
	thumb_func_end sub_80491E0

.align 2, 0 @ Don't pad with nop.
