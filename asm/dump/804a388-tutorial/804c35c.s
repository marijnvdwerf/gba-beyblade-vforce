	.include "asm/common.inc"

	thumb_func_start sub_804C35C
sub_804C35C:
	push	{r4, r5, r6, r7, lr}
	mov	r7, sl
	mov	r6, r9
	mov	r5, r8
	push	{r5, r6, r7}
	mov	r9, r1
	mov	r8, r2
	mov	r1, #0x4
	ldsh	r5, [r0, r1]
	ldr	r4, [r0, #0x8]
	add	r0, r5, #0
	sub	r5, r5, #0x1
	cmp	r0, #0
	beq	.L1	@cond_branch
	mov	r2, #0x0
	mov	sl, r2
	mov	r0, r9
	ADD r0, r8
	asr	r0, r0, #0x1
	lsl	r1, r5, #0xb
	sub	r0, r0, r3
	sub	r7, r0, r1
	add	r6, r1, r3
.L2:
	mov	r3, r9
	str	r3, [r4]
	mov	r0, r8
	str	r0, [r4, #0x4]
	str	r6, [r4, #0x8]
	mov	r0, #0x80
	lsl	r0, r0, #0x3
	str	r0, [r4, #0xc]
	mov	r1, sl
	str	r1, [r4, #0x10]
	str	r1, [r4, #0x14]
	ldr	r0, [r4, #0x30]
	mov	r2, r8
	sub	r1, r3, r2
	add	r2, r7, #0
	bl	sub_804ABD8
	add	r4, r4, #0x34
	add	r0, r5, #0
	mov	r3, #0x80
	lsl	r3, r3, #0x4
	add	r7, r7, r3
	ldr	r1, .L3
	add	r6, r6, r1
	sub	r5, r5, #0x1
	cmp	r0, #0
	bne	.L2	@cond_branch
.L1:
	pop	{r3, r4, r5}
	mov	r8, r3
	mov	r9, r4
	mov	sl, r5
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L4:
	.align	2, 0
.L3:
	.4byte	0xfffff800
	thumb_func_end sub_804C35C

.align 2, 0 @ Don't pad with nop.
