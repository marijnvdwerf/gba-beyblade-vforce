	.include "asm/common.inc"

	thumb_func_start sub_805C3BC
sub_805C3BC:
	push	{r4, r5, r6, r7, lr}
	add	sp, sp, #0xffffffe8
	add	r5, r0, #0
	add	r4, r1, #0
	add	r6, r2, #0
	add	r7, r3, #0
	add	r1, r1, #0x8d
	mov	r0, #0x4
	ldrb	r1, [r1]
	and	r0, r0, r1
	cmp	r0, #0
	beq	.L1	@cond_branch
	add	r0, r5, #0
	add	r1, r6, #0
	mov	r2, sp
	bl	sub_805DD18
	b	.L2
.L1:
	add	r0, r5, #0
	add	r1, r6, #0
	mov	r2, sp
	add	r3, r7, #0
	bl	sub_805DFD4
.L2:
	cmp	r0, #0
	beq	.L3	@cond_branch
	ldr	r1, [sp]
	lsl	r1, r1, #0x5
	add	r0, r4, #0
	add	r0, r0, #0x9a
	mov	r2, #0x0
	ldsh	r0, [r0, r2]
	lsl	r0, r0, #0x8
	sub	r1, r1, r0
	str	r1, [r4, #0x4]
	ldr	r1, [sp, #0x4]
	lsl	r1, r1, #0x5
	add	r0, r4, #0
	add	r0, r0, #0x9c
	mov	r2, #0x0
	ldsh	r0, [r0, r2]
	lsl	r0, r0, #0x8
	sub	r1, r1, r0
	str	r1, [r4, #0x8]
	ldr	r1, [sp, #0x8]
	lsl	r1, r1, #0x5
	add	r0, r4, #0
	add	r0, r0, #0x9e
	mov	r2, #0x0
	ldsh	r0, [r0, r2]
	lsl	r0, r0, #0x8
	sub	r1, r1, r0
	str	r1, [r4, #0xc]
	add	r0, r4, #0
	add	r0, r0, #0x80
	str	r5, [r0]
	add	r0, r0, #0x4
	str	r6, [r0]
	add	r1, r4, #0
	add	r1, r1, #0x88
	lsl	r0, r7, #0x8
	str	r0, [r1]
	mov	r0, #0x0
	str	r0, [r4, #0x44]
.L3:
	add	sp, sp, #0x18
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
	thumb_func_end sub_805C3BC

.align 2, 0 @ Don't pad with nop.
