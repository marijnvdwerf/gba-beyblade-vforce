	.include "asm/common.inc"

	thumb_func_start sub_8057104
sub_8057104:
	add	r3, r0, #0
	lsl	r1, r1, #0x18
	cmp	r1, #0
	beq	.L1	@cond_branch
	ldr	r0, .L3
	ldr	r2, [r0]
	asr	r0, r3, #0x5
	lsl	r0, r0, #0x2
	ldr	r1, .L3 + 4
	add	r2, r2, r1
	add	r2, r2, r0
	mov	r0, #0x1f
	and	r0, r0, r3
	mov	r1, #0x1
	LSL	r1, r0
	ldr	r0, [r2]
	orr	r0, r0, r1
	b	.L2
.L4:
	.align	2, 0
.L3:
	.4byte	0x3000f48
	.4byte	0x594
.L1:
	ldr	r0, .L5
	ldr	r2, [r0]
	asr	r0, r3, #0x5
	lsl	r0, r0, #0x2
	ldr	r1, .L5 + 4
	add	r2, r2, r1
	add	r2, r2, r0
	mov	r0, #0x1f
	and	r0, r0, r3
	mov	r1, #0x1
	LSL	r1, r0
	ldr	r0, [r2]
	BIC	r0, r1
.L2:
	str	r0, [r2]
	bx	lr
.L6:
	.align	2, 0
.L5:
	.4byte	0x3000f48
	.4byte	0x594
	thumb_func_end sub_8057104

.align 2, 0 @ Don't pad with nop.
