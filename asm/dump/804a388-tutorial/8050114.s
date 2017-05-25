	.include "asm/common.inc"

	thumb_func_start sub_8050114
sub_8050114:
	ldrh	r1, [r0, #0x2]
	ldrh	r2, [r0, #0x4]
	EOR	r1, r2
	lsl	r1, r1, #0x10
	asr	r1, r1, #0x10
	ldrh	r3, [r0, #0x6]
	lsl	r2, r3, #0x16
	lsr	r2, r2, #0x16
	EOR	r1, r2
	ldrb	r3, [r0, #0xd]
	lsl	r2, r3, #0x1c
	lsr	r2, r2, #0x1c
	EOR	r1, r2
	ldrh	r2, [r0, #0x8]
	EOR	r1, r2
	ldrb	r3, [r0, #0xc]
	EOR	r1, r3
	ldrh	r2, [r0, #0xa]
	EOR	r1, r2
	mov	r2, #0x3f
	and	r1, r1, r2
	ldrb	r0, [r0, #0x7]
	lsr	r0, r0, #0x2
	cmp	r0, r1
	beq	.L1	@cond_branch
	ldr	r0, .L3
	ldr	r0, [r0]
	ldr	r3, .L3 + 4
	add	r0, r0, r3
	mov	r1, #0x1
	ldrh	r2, [r0]
	orr	r1, r1, r2
	strh	r1, [r0]
	mov	r0, #0x0
	b	.L2
.L4:
	.align	2, 0
.L3:
	.4byte	0x3000fb0
	.4byte	0x161c
.L1:
	ldr	r0, .L5
	ldr	r1, [r0]
	ldr	r3, .L5 + 4
	add	r1, r1, r3
	ldr	r0, .L5 + 8
	ldrh	r2, [r1]
	and	r0, r0, r2
	strh	r0, [r1]
	mov	r0, #0x1
.L2:
	bx	lr
.L6:
	.align	2, 0
.L5:
	.4byte	0x3000fb0
	.4byte	0x161c
	.4byte	0xfffe
	thumb_func_end sub_8050114

.align 2, 0 @ Don't pad with nop.
