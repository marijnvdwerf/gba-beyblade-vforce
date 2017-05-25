	.include "asm/common.inc"

	thumb_func_start sub_80570D4
sub_80570D4:
	ldr	r1, .L3
	ldr	r3, [r1]
	asr	r1, r0, #0x5
	lsl	r1, r1, #0x2
	ldr	r2, .L3 + 4
	add	r3, r3, r2
	add	r3, r3, r1
	mov	r1, #0x1f
	and	r1, r1, r0
	mov	r2, #0x1
	LSL	r2, r1
	ldr	r0, [r3]
	and	r0, r0, r2
	cmp	r0, #0
	bne	.L1	@cond_branch
	mov	r0, #0x0
	b	.L2
.L4:
	.align	2, 0
.L3:
	.4byte	0x3000f48
	.4byte	0x594
.L1:
	mov	r0, #0x1
.L2:
	bx	lr
	thumb_func_end sub_80570D4

.align 2, 0 @ Don't pad with nop.
