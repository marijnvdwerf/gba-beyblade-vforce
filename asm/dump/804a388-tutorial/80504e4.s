	.include "asm/common.inc"

	thumb_func_start sub_80504E4
sub_80504E4:
	push	{r4, r5, r6, r7, lr}
	mov	r7, r8
	push	{r7}
	add	r4, r0, #0
	mov	ip, r1
	mov	r8, r2
	add	r6, r3, #0
	mov	r3, #0x80
	lsl	r3, r3, #0x1
	add	r5, r3, #0
	ldr	r1, [r4, #0x8]
	mov	r2, #0x0
	b	.L1
.L2:
	mov	r0, ip
	mul	r0, r0, r5
	asr	r0, r0, #0x8
	str	r0, [r1, #0x10]
	mov	r0, r8
	mul	r0, r0, r3
	asr	r0, r0, #0x8
	str	r0, [r1, #0x14]
	add	r5, r5, r6
	ldr	r0, [sp, #0x18]
	add	r3, r3, r0
	add	r1, r1, #0x18
	add	r2, r2, #0x1
.L1:
	mov	r7, #0xc
	ldsh	r0, [r4, r7]
	cmp	r2, r0
	blt	.L2	@cond_branch
	pop	{r3}
	mov	r8, r3
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
	thumb_func_end sub_80504E4

.align 2, 0 @ Don't pad with nop.
