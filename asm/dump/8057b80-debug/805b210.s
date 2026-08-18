	.include "asm/common.inc"

	thumb_func_start sub_805B210
sub_805B210:
	add	r2, r0, #0
	ldr	r3, [r2, #0x24]
	mov	r0, #0x4c
	add	r1, r3, #0
	mul	r1, r1, r0
	ldr	r0, [r2, #0xc]
	add	r1, r0, r1
	cmp	r3, #0
	blt	.L805B23A	@cond_branch
	ldr	r0, [r2, #0x14]
	cmp	r3, r0
	bge	.L805B23A	@cond_branch
	ldr	r0, [r1, #0x48]
	cmp	r0, #0
	beq	.L805B230	@cond_branch
	add	r1, r0, #0
.L805B230:
	ldr	r0, [r1, #0x40]
	cmp	r0, #0
	beq	.L805B23A	@cond_branch
	ldr	r0, [r1, #0x34]
	b	.L805B23E
.L805B23A:
	mov	r0, #0x1
	NEG	r0, r0
.L805B23E:
	bx	lr
	thumb_func_end sub_805B210

.align 2, 0 @ Don't pad with nop.
