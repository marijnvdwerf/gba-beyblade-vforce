	.include "asm/common.inc"

	thumb_func_start sub_805F3A8
sub_805F3A8:
	push	{r4, lr}
	add	r3, r0, #0
	ldr	r0, [r3]
	ldrh	r4, [r0, #0x4]
	lsl	r2, r4, #0x2
	add	r2, r2, r4
	lsl	r2, r2, #0x1
	lsl	r1, r1, #0x10
	asr	r1, r1, #0x10
	ldrh	r0, [r0, #0x18]
	cmp	r1, r0
	bge	.L805F3D0	@cond_branch
	cmp	r1, #0
	blt	.L805F3CC	@cond_branch
	mul	r1, r1, r2
	ldr	r0, [r3, #0x14]
	add	r0, r0, r1
	b	.L805F3CE
.L805F3CC:
	ldr	r0, [r3, #0x20]
.L805F3CE:
	str	r0, [r3, #0x4]
.L805F3D0:
	pop	{r4}
	pop	{r0}
	bx	r0
	thumb_func_end sub_805F3A8

.align 2, 0 @ Don't pad with nop.
