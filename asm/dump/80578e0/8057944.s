	.include "asm/common.inc"

	thumb_func_start sub_8057944
sub_8057944:
	ldr	r2, .L2
	ldr	r1, .L2 + 4
	str	r1, [r2]
	ldr	r3, .L2 + 8
	str	r3, [r2, #0x4]
	ldr	r0, .L2 + 12
	sub	r1, r0, r1
	add	r0, r1, #0
	add	r0, r0, #0x20
	cmp	r0, #0
	bge	.L1	@cond_branch
	add	r0, r0, #0x3
.L1:
	asr	r0, r0, #0x2
	mov	r1, #0x84
	lsl	r1, r1, #0x18
	orr	r0, r0, r1
	str	r0, [r2, #0x8]
	ldr	r0, [r2, #0x8]
	ldr	r0, .L2 + 16
	str	r3, [r0]
	bx	lr
.L3:
	.align	2, 0
.L2:
	.4byte	0x40000d4
	.4byte	0x8000168
	.4byte	0x3000fe0
	.4byte	0x800026c
	.4byte	0x3007ffc
	thumb_func_end sub_8057944

.align 2, 0 @ Don't pad with nop.
