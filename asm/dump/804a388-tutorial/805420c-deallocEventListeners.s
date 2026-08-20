	.include "asm/common.inc"

	thumb_func_start deallocEventListeners
deallocEventListeners:
	push	{r4, r5, lr}
	ldr	r5, .L805423C
	ldr	r0, [r5]
	mov	r4, #0xca
	lsl	r4, r4, #0x4
	add	r0, r0, r4
	ldr	r0, [r0]
	cmp	r0, #0
	beq	.L8054222	@cond_branch
	bl	deallocateBlock
.L8054222:
	ldr	r1, [r5]
	add	r0, r1, r4
	mov	r2, #0x0
	str	r2, [r0]
	ldr	r3, .L805423C + 4
	add	r0, r1, r3
	str	r2, [r0]
	ldr	r0, .L805423C + 8
	add	r1, r1, r0
	str	r2, [r1]
	pop	{r4, r5}
	pop	{r0}
	bx	r0
.L805423C:
	.align	2, 0

	.4byte	_gameData
	.4byte	0xca4
	.4byte	0xca8
	thumb_func_end deallocEventListeners

.align 2, 0 @ Don't pad with nop.
