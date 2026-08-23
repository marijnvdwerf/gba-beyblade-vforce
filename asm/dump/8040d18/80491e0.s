	.include "asm/common.inc"

	thumb_func_start sub_80491E0
sub_80491E0:
	add	r2, r0, #0
	lsr	r3, r2, #0x1f
	cmp	r2, #0
	beq	.L804920A	@cond_branch
	cmp	r3, #0
	beq	.L80491F2	@cond_branch
	neg	r2, r2
	b	.L80491F2
.L80491F0:
	asr	r1, r1, #0x1
.L80491F2:
	cmp	r1, #0
	beq	.L8049202	@cond_branch
	lsl	r0, r1, #0x8
	cmp	r2, r0
	ble	.L80491F0	@cond_branch
	add	r2, r1, #0
	cmp	r1, #0
	bne	.L8049204	@cond_branch
.L8049202:
	mov	r2, #0x1
.L8049204:
	cmp	r3, #0
	beq	.L804920A	@cond_branch
	neg	r2, r2
.L804920A:
	add	r0, r2, #0
	bx	lr
	thumb_func_end sub_80491E0

.align 2, 0 @ Don't pad with nop.
