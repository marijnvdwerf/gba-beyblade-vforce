	.include "asm/common.inc"

	thumb_func_start sub_805A2DC
sub_805A2DC:
	push	{r4, r5, r6, r7, lr}
	mov	r7, sl
	mov	r6, r9
	mov	r5, r8
	push	{r5, r6, r7}
	add	sp, sp, #0xfffffffc
	str	r0, [sp]
	mov	r9, r1
	mov	sl, r2
	mov	r1, #0x0
.L2:
	mov	r4, #0x0
	lsl	r0, r1, #0x1
	add	r2, r1, #1
	mov	r8, r2
	add	r0, r0, r1
	lsl	r0, r0, #0x2
	ldr	r2, [sp]
	add	r1, r0, r2
	ldr	r2, [r1]
	mov	ip, r2
	ldr	r7, [r1, #0x8]
	mov	r2, sl
	add	r6, r0, r2
	ldr	r5, [r1, #0x4]
.L1:
	lsl	r2, r4, #0x2
	add	r3, r2, r6
	ADD r2, r9
	ldr	r0, [r2]
	mov	r1, ip
	mul	r1, r1, r0
	add	r0, r1, #0
	ldr	r1, [r2, #0xc]
	mul	r1, r1, r5
	add	r0, r0, r1
	ldr	r1, [r2, #0x18]
	mul	r1, r1, r7
	add	r0, r0, r1
	asr	r0, r0, #0x8
	str	r0, [r3]
	add	r0, r4, #1
	lsl	r0, r0, #0x10
	lsr	r4, r0, #0x10
	cmp	r4, #0x2
	bls	.L1	@cond_branch
	mov	r2, r8
	lsl	r0, r2, #0x10
	lsr	r1, r0, #0x10
	cmp	r1, #0x2
	bls	.L2	@cond_branch
	add	sp, sp, #0x4
	pop	{r3, r4, r5}
	mov	r8, r3
	mov	r9, r4
	mov	sl, r5
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
	thumb_func_end sub_805A2DC

.align 2, 0 @ Don't pad with nop.
