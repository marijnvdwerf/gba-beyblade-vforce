	.include "asm/common.inc"

	thumb_func_start sub_8041390
sub_8041390:
	push	{r4, r5, lr}
	add	r5, r0, #0
	ldr	r2, [r5]
	cmp	r2, #0
	beq	.L1	@cond_branch
	mov	r3, #0x80
	lsl	r3, r3, #0x5
	add	r0, r1, r3
	str	r0, [r2, #0x8]
.L1:
	ldr	r0, [r5, #0x4]
	asr	r4, r1, #0x8
	add	r1, r4, #0
	add	r1, r1, #0x8
	lsl	r1, r1, #0x10
	asr	r1, r1, #0x10
	ldr	r2, [r0, #0x4]
	lsl	r2, r2, #0x8
	asr	r2, r2, #0x10
	bl	sub_8061844
	ldr	r0, [r5, #0x8]
	add	r4, r4, #0x58
	lsl	r4, r4, #0x10
	asr	r4, r4, #0x10
	ldr	r2, [r0, #0x4]
	lsl	r2, r2, #0x8
	asr	r2, r2, #0x10
	add	r1, r4, #0
	bl	sub_8061844
	ldr	r0, [r5, #0xc]
	ldr	r2, [r0, #0x4]
	lsl	r2, r2, #0x8
	asr	r2, r2, #0x10
	add	r1, r4, #0
	bl	sub_8061844
	ldr	r0, [r5, #0x10]
	ldr	r2, [r0, #0x4]
	lsl	r2, r2, #0x8
	asr	r2, r2, #0x10
	add	r1, r4, #0
	bl	sub_8061844
	ldr	r0, [r5, #0x14]
	ldr	r2, [r0, #0x4]
	lsl	r2, r2, #0x8
	asr	r2, r2, #0x10
	add	r1, r4, #0
	bl	sub_8061844
	pop	{r4, r5}
	pop	{r0}
	bx	r0
	thumb_func_end sub_8041390

.align 2, 0 @ Don't pad with nop.
