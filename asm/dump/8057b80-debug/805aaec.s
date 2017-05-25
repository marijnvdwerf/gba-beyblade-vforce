	.include "asm/common.inc"

	thumb_func_start sub_805AAEC
sub_805AAEC:
	add	r2, r0, #0
	lsl	r1, r1, #0x10
	lsr	r1, r1, #0x10
	cmp	r2, #0
	beq	.L1	@cond_branch
	ldr	r0, .L3
	str	r2, [r0]
	ldr	r0, .L3 + 4
	strh	r1, [r0]
	b	.L2
.L4:
	.align	2, 0
.L3:
	.4byte	0x3005db0
	.4byte	0x3005db4
.L1:
	ldr	r1, .L5
	ldr	r0, .L5 + 4
	ldr	r0, [r0]
	ldr	r0, [r0]
	str	r0, [r1]
	ldr	r1, .L5 + 8
	ldr	r0, .L5 + 12
	ldrh	r0, [r0]
	strh	r0, [r1]
.L2:
	ldr	r1, .L5 + 16
	mov	r0, #0x2
	strh	r0, [r1]
	bx	lr
.L6:
	.align	2, 0
.L5:
	.4byte	0x3005db0
	.4byte	0x3005dbc
	.4byte	0x3005db4
	.4byte	0x3005db8
	.4byte	0x3005ca4
	thumb_func_end sub_805AAEC

.align 2, 0 @ Don't pad with nop.
