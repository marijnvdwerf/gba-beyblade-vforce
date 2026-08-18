	.include "asm/common.inc"

	thumb_func_start sub_805AAEC
sub_805AAEC:
	add	r2, r0, #0
	lsl	r1, r1, #0x10
	lsr	r1, r1, #0x10
	cmp	r2, #0
	beq	.L805AB08	@cond_branch
	ldr	r0, .L805AB00
	str	r2, [r0]
	ldr	r0, .L805AB00 + 4
	strh	r1, [r0]
	b	.L805AB1A
.L805AB00:
	.align	2, 0

	.4byte	0x3005db0
	.4byte	0x3005db4
.L805AB08:
	ldr	r1, .L805AB24
	ldr	r0, .L805AB24 + 4
	ldr	r0, [r0]
	ldr	r0, [r0]
	str	r0, [r1]
	ldr	r1, .L805AB24 + 8
	ldr	r0, .L805AB24 + 12
	ldrh	r0, [r0]
	strh	r0, [r1]
.L805AB1A:
	ldr	r1, .L805AB24 + 16
	mov	r0, #0x2
	strh	r0, [r1]
	bx	lr
.L805AB22:
	.align	2, 0
.L805AB24:
	.4byte	0x3005db0
	.4byte	0x3005dbc
	.4byte	0x3005db4
	.4byte	0x3005db8
	.4byte	0x3005ca4
	thumb_func_end sub_805AAEC

.align 2, 0 @ Don't pad with nop.
