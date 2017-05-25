	.include "asm/common.inc"

	thumb_func_start SetBGOffset
SetBGOffset:
	add	r3, r1, #0
	lsl	r0, r0, #0x18
	lsr	r0, r0, #0x18
	cmp	r0, #0x2
	beq	.L1	@cond_branch
	cmp	r0, #0x3
	beq	.L2	@cond_branch
	b	.L3
.L1:
	ldr	r0, .L5
	strh	r3, [r0]
	ldr	r1, .L5 + 4
	asr	r0, r3, #0x10
	strh	r0, [r1]
	ldr	r0, .L5 + 8
	b	.L4
.L6:
	.align	2, 0
.L5:
	.4byte	0x4000028
	.4byte	0x400002a
	.4byte	0x400002c
.L2:
	ldr	r0, .L7
	strh	r3, [r0]
	ldr	r1, .L7 + 4
	asr	r0, r3, #0x10
	strh	r0, [r1]
	ldr	r0, .L7 + 8
.L4:
	strh	r2, [r0]
	add	r1, r1, #0x4
	asr	r0, r2, #0x10
	strh	r0, [r1]
.L3:
	bx	lr
.L8:
	.align	2, 0
.L7:
	.4byte	0x4000038
	.4byte	0x400003a
	.4byte	0x400003c
	thumb_func_end SetBGOffset

.align 2, 0 @ Don't pad with nop.
