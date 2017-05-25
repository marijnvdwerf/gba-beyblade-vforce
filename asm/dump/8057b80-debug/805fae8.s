	.include "asm/common.inc"

	thumb_func_start sub_805FAE8
sub_805FAE8:
	push	{r4, r5, r6, r7, lr}
	mov	r7, sl
	mov	r6, r9
	mov	r5, r8
	push	{r5, r6, r7}
	add	r7, r0, #0
	mov	sl, r1
	add	r6, r2, #0
	mov	r9, r3
	ldr	r0, [sp, #0x24]
	lsl	r0, r0, #0x10
	mov	r1, #0x0
	mov	r8, r1
	lsr	r0, r0, #0xe
	ldr	r1, [r7, #0x8]
	add	r1, r1, r0
	mov	r5, #0x0
	mov	r2, #0x0
	ldsh	r0, [r1, r2]
	mov	r2, #0x1
	NEG	r2, r2
	cmp	r0, r2
	beq	.L1	@cond_branch
	b	.L2
.L4:
	mov	r1, #0x0
	ldsh	r0, [r5, r1]
	lsl	r0, r0, #0x3
	ldr	r2, [r6, #0x8]
	add	r2, r2, r0
	mov	r0, r8
	add	r0, r0, #0x1
	lsl	r0, r0, #0x10
	lsr	r0, r0, #0x10
	mov	r8, r0
	ldr	r1, [r6, #0x10]
	mov	r3, r9
	ldr	r4, [r3, #0x28]
	mov	r0, sl
	ldr	r3, [sp, #0x20]
	bl	call_via_r4
	mov	r1, #0x2
	ldsh	r0, [r5, r1]
	mov	r2, #0x1
	NEG	r2, r2
	cmp	r0, r2
	beq	.L3	@cond_branch
.L2:
	lsl	r0, r0, #0x2
	ldr	r1, [r7, #0xc]
	add	r5, r1, r0
.L1:
	cmp	r5, #0
	bne	.L4	@cond_branch
.L3:
	mov	r0, r8
	pop	{r3, r4, r5}
	mov	r8, r3
	mov	r9, r4
	mov	sl, r5
	pop	{r4, r5, r6, r7}
	pop	{r1}
	bx	r1
	thumb_func_end sub_805FAE8

.align 2, 0 @ Don't pad with nop.
