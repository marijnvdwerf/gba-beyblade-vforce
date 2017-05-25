	.include "asm/common.inc"

	thumb_func_start sub_805FB60
sub_805FB60:
	push	{r4, r5, r6, r7, lr}
	add	r6, r0, #0
	lsl	r1, r1, #0x10
	lsr	r1, r1, #0x10
	lsl	r2, r1, #0x2
	ldr	r0, [r6, #0x8]
	add	r5, r0, r2
	mov	r4, #0x0
	ldr	r0, .L5
	ldr	r2, .L5 + 4
	mov	r7, #0x0
	ldsh	r3, [r5, r7]
	bl	nullsub_10
	ldr	r0, .L5 + 8
	mov	r2, #0x2
	ldsh	r1, [r5, r2]
	bl	nullsub_9
	mov	r7, #0x0
	ldsh	r0, [r5, r7]
	mov	r2, #0x1
	NEG	r2, r2
	cmp	r0, r2
	beq	.L1	@cond_branch
	lsl	r0, r0, #0x2
	ldr	r1, [r6, #0xc]
	add	r4, r1, r0
.L1:
	cmp	r4, #0
	beq	.L2	@cond_branch
	add	r5, r2, #0
.L7:
	mov	r2, #0x0
	ldsh	r1, [r4, r2]
	mov	r7, #0x2
	ldsh	r3, [r4, r7]
	ldr	r0, .L5 + 12
	ldr	r2, .L5 + 16
	bl	nullsub_10
	mov	r1, #0x2
	ldsh	r0, [r4, r1]
	cmp	r0, r5
	beq	.L3	@cond_branch
	lsl	r0, r0, #0x2
	ldr	r1, [r6, #0xc]
	add	r4, r1, r0
	b	.L4
.L6:
	.align	2, 0
.L5:
	.4byte	0x8755730
	.4byte	0x8755738
	.4byte	0x8755748
	.4byte	0x8755754
	.4byte	0x875575c
.L3:
	mov	r4, #0x0
.L4:
	cmp	r4, #0
	bne	.L7	@cond_branch
.L2:
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
	thumb_func_end sub_805FB60

.align 2, 0 @ Don't pad with nop.
