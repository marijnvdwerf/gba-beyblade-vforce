	.include "asm/common.inc"

	thumb_func_start sub_8049F58
sub_8049F58:
	add	r3, r0, #0
	cmp	r1, #0x3
	beq	.L8049F80	@cond_branch
	cmp	r1, #0x3
	bhi	.L8049F90	@cond_branch
	cmp	r1, #0x2
	bne	.L8049F90	@cond_branch
	ldr	r0, .L8049F78
	add	r1, r3, r0
	mov	r2, #0x0
	mov	r0, #0xfc
	strb	r0, [r1]
	ldr	r1, .L8049F78 + 4
	add	r0, r3, r1
	strb	r2, [r0]
	b	.L8049F90
.L8049F78:
	.align	2, 0

	.4byte	0x585
	.4byte	0x586
.L8049F80:
	ldr	r0, .L8049F94
	add	r1, r3, r0
	mov	r0, #0x4
	strb	r0, [r1]
	ldr	r0, .L8049F94 + 4
	add	r1, r3, r0
	mov	r0, #0x40
	strb	r0, [r1]
.L8049F90:
	bx	lr
.L8049F92:
	.align	2, 0
.L8049F94:
	.4byte	0x585
	.4byte	0x586
	thumb_func_end sub_8049F58

.align 2, 0 @ Don't pad with nop.
