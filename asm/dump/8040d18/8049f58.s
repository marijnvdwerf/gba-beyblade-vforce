	.include "asm/common.inc"

	thumb_func_start sub_8049F58
sub_8049F58:
	add	r3, r0, #0
	cmp	r1, #0x3
	beq	.L1	@cond_branch
	cmp	r1, #0x3
	bhi	.L4	@cond_branch
	cmp	r1, #0x2
	bne	.L4	@cond_branch
	ldr	r0, .L5
	add	r1, r3, r0
	mov	r2, #0x0
	mov	r0, #0xfc
	strb	r0, [r1]
	ldr	r1, .L5 + 4
	add	r0, r3, r1
	strb	r2, [r0]
	b	.L4
.L6:
	.align	2, 0
.L5:
	.4byte	0x585
	.4byte	0x586
.L1:
	ldr	r0, .L7
	add	r1, r3, r0
	mov	r0, #0x4
	strb	r0, [r1]
	ldr	r0, .L7 + 4
	add	r1, r3, r0
	mov	r0, #0x40
	strb	r0, [r1]
.L4:
	bx	lr
.L8:
	.align	2, 0
.L7:
	.4byte	0x585
	.4byte	0x586
	thumb_func_end sub_8049F58

.align 2, 0 @ Don't pad with nop.
