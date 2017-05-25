	.include "asm/common.inc"

	thumb_func_start sub_8059F20
sub_8059F20:
	push	{r4, r5, r6, r7, lr}
	mov	r7, sl
	mov	r6, r9
	mov	r5, r8
	push	{r5, r6, r7}
	add	sp, sp, #0xfffffff8
	mov	sl, r0
	mov	r9, r1
	mov	r8, r2
	add	r6, r3, #0
	ldr	r0, [sp, #0x28]
	ldr	r1, [sp, #0x2c]
	lsl	r0, r0, #0x10
	lsr	r3, r0, #0x10
	lsl	r1, r1, #0x10
	lsr	r1, r1, #0x10
	add	r5, r3, #0
	mov	r4, r8
	mov	r2, r9
	add	r0, r2, r5
	ldrb	r2, [r0]
	add	r5, r5, #0x1
	cmp	r2, #0
	beq	.L6	@cond_branch
	add	r7, r3, r1
	cmp	r5, r7
	bgt	.L6	@cond_branch
.L7:
	cmp	r2, #0xa
	bne	.L3	@cond_branch
	add	r6, r6, #0x2
	mov	r4, r8
	b	.L4
.L3:
	cmp	r2, #0x20
	beq	.L5	@cond_branch
	str	r6, [sp]
	ldr	r0, .L8
	add	r0, r2, r0
	ldrb	r0, [r0]
	str	r0, [sp, #0x4]
	mov	r0, sl
	mov	r1, #0x1
	mov	r2, #0x2
	add	r3, r4, #0
	bl	sub_8059E5C
.L5:
	add	r4, r4, #0x1
.L4:
	mov	r1, r9
	add	r0, r1, r5
	ldrb	r2, [r0]
	add	r5, r5, #0x1
	cmp	r2, #0
	beq	.L6	@cond_branch
	cmp	r5, r7
	ble	.L7	@cond_branch
.L6:
	add	sp, sp, #0x8
	pop	{r3, r4, r5}
	mov	r8, r3
	mov	r9, r4
	mov	sl, r5
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L9:
	.align	2, 0
.L8:
	.4byte	0x807d7fc
	thumb_func_end sub_8059F20

.align 2, 0 @ Don't pad with nop.
