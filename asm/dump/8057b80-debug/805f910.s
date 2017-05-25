	.include "asm/common.inc"

	thumb_func_start sub_805F910
sub_805F910:
	push	{r4, r5, r6, r7, lr}
	mov	r7, r9
	mov	r6, r8
	push	{r6, r7}
	add	r6, r0, #0
	mov	r8, r1
	mov	r9, r2
	mov	r7, #0x0
	b	.L1
.L6:
	lsl	r1, r7, #0x3
	ldr	r0, [r6, #0x8]
	add	r0, r0, r1
	ldrh	r2, [r0]
	lsl	r1, r2, #0x4
	ldr	r2, [r6, #0x10]
	add	r5, r2, r1
	ldrh	r3, [r0, #0x2]
	lsl	r1, r3, #0x4
	add	r1, r2, r1
	ldrh	r0, [r0, #0x4]
	lsl	r0, r0, #0x4
	add	r4, r2, r0
	ldr	r2, [r5, #0x4]
	ldr	r0, [r1, #0x4]
	add	r3, r1, #0
	cmp	r2, r0
	bgt	.L2	@cond_branch
	add	r3, r5, #0
.L2:
	ldr	r1, [r3, #0x4]
	ldr	r0, [r4, #0x4]
	cmp	r1, r0
	ble	.L3	@cond_branch
	add	r3, r4, #0
.L3:
	ldr	r0, [r3, #0x4]
	lsl	r0, r0, #0xa
	asr	r1, r0, #0x10
	cmp	r1, #0
	blt	.L5	@cond_branch
	mov	r2, r8
	mov	r3, #0x0
	ldsh	r0, [r2, r3]
	cmp	r1, r0
	bge	.L5	@cond_branch
	mov	r0, r9
	ldr	r3, [r0, #0x10]
	mov	r0, r8
	add	r2, r7, #0
	bl	call_via_r3
.L5:
	add	r0, r7, #1
	lsl	r0, r0, #0x10
	lsr	r7, r0, #0x10
.L1:
	ldr	r0, [r6]
	ldrh	r0, [r0, #0x6]
	cmp	r7, r0
	bcc	.L6	@cond_branch
	pop	{r3, r4}
	mov	r8, r3
	mov	r9, r4
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
	thumb_func_end sub_805F910

.align 2, 0 @ Don't pad with nop.
