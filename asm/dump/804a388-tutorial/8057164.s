	.include "asm/common.inc"

	thumb_func_start sub_8057164
sub_8057164:
	push	{r4, r5, r6, lr}
	add	r2, r0, #0
	ldr	r0, [r2, #0x4]
	add	r4, r0, #4
	mov	r3, #0x0
	ldsh	r1, [r2, r3]
	ldr	r0, [r0]
	cmp	r1, r0
	bne	.L1	@cond_branch
	ldr	r0, .L3
	b	.L10
.L4:
	.align	2, 0
.L3:
	.4byte	0xffff
.L1:
	mov	r6, #0x0
	ldsh	r3, [r2, r6]
	mov	r0, #0x1
	NEG	r0, r0
	ldrh	r5, [r2]
	cmp	r3, r0
	beq	.L13	@cond_branch
	ldrh	r1, [r2, #0x2]
	mov	r6, #0x2
	ldsh	r0, [r2, r6]
	cmp	r0, #0
	bne	.L6	@cond_branch
	cmp	r3, #0
	bne	.L13	@cond_branch
	b	.L8
.L6:
	sub	r0, r1, #1
	strh	r0, [r2, #0x2]
.L8:
	ldr	r1, .L11
	mov	r3, #0x0
	ldsh	r0, [r2, r3]
	lsl	r0, r0, #0x1
	add	r0, r0, r4
	ldrh	r1, [r1]
	ldrh	r0, [r0]
	cmp	r1, r0
	bne	.L9	@cond_branch
	mov	r0, #0x3c
	strh	r0, [r2, #0x2]
	add	r0, r5, #1
	b	.L10
.L12:
	.align	2, 0
.L11:
	.4byte	0x3005da0
.L9:
	cmp	r1, #0
	beq	.L13	@cond_branch
	mov	r0, #0x0
	strh	r0, [r2, #0x2]
.L10:
	strh	r0, [r2]
.L13:
	pop	{r4, r5, r6}
	pop	{r0}
	bx	r0
	thumb_func_end sub_8057164

.align 2, 0 @ Don't pad with nop.
