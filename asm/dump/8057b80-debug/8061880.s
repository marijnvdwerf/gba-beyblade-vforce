	.include "asm/common.inc"

	thumb_func_start sub_8061880
sub_8061880:
	push	{r4, lr}
	add	r3, r0, #0
	lsl	r1, r1, #0x10
	lsr	r1, r1, #0x10
	lsl	r2, r2, #0x10
	lsr	r2, r2, #0x10
	ldr	r0, [r3, #0x2c]
	cmp	r0, #0
	beq	.L1	@cond_branch
	ldrh	r4, [r0, #0x14]
	add	r1, r4, r1
	lsl	r1, r1, #0x10
	lsr	r1, r1, #0x10
	ldrh	r0, [r0, #0x16]
	add	r2, r0, r2
	lsl	r2, r2, #0x10
	lsr	r2, r2, #0x10
	add	r0, r3, #0
	bl	sub_8061684
	b	.L2
.L1:
	mov	r4, #0x80
	lsl	r4, r4, #0x1
	add	r0, r4, #0
	lsl	r1, r1, #0x10
	asr	r1, r1, #0x10
	add	r1, r1, r0
	lsl	r1, r1, #0x10
	lsr	r1, r1, #0x10
	lsl	r2, r2, #0x10
	asr	r2, r2, #0x10
	add	r2, r2, r0
	lsl	r2, r2, #0x10
	lsr	r2, r2, #0x10
	add	r0, r3, #0
	bl	sub_8061684
.L2:
	pop	{r4}
	pop	{r0}
	bx	r0
	thumb_func_end sub_8061880

.align 2, 0 @ Don't pad with nop.
