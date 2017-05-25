	.include "asm/common.inc"

	thumb_func_start sub_805B800
sub_805B800:
	push	{r4, r5, r6, r7, lr}
	mov	r7, sl
	mov	r6, r9
	mov	r5, r8
	push	{r5, r6, r7}
	add	sp, sp, #0xffffffbc
	add	r6, r0, #0
	add	r4, r3, #0
	ldr	r0, [sp, #0x64]
	lsl	r1, r1, #0x10
	lsl	r0, r0, #0x18
	lsr	r7, r0, #0x18
	mov	r0, #0x0
	mov	sl, r0
	lsr	r0, r1, #0x10
	mov	r9, r0
	asr	r1, r1, #0x10
	lsl	r2, r2, #0x10
	asr	r5, r2, #0x10
	cmp	r4, #0
	beq	.L10	@cond_branch
	ldrb	r0, [r4]
	cmp	r0, #0
	beq	.L10	@cond_branch
	mov	r0, #0x0
	mov	r8, r0
	add	r2, sp, #0x4
.L14:
	ldrb	r0, [r4]
	add	r4, r4, #0x1
	cmp	r0, #0xfb
	beq	.L3	@cond_branch
	cmp	r0, #0xfb
	bgt	.L4	@cond_branch
	cmp	r0, #0
	beq	.L5	@cond_branch
	cmp	r0, #0xa
	beq	.L6	@cond_branch
	b	.L9
.L4:
	cmp	r0, #0xfc
	beq	.L8	@cond_branch
	cmp	r0, #0xff
	bne	.L9	@cond_branch
.L5:
	mov	r0, r8
	strb	r0, [r2]
	str	r7, [sp]
	add	r0, r6, #0
	add	r2, r5, #0
	add	r3, sp, #0x4
	bl	sub_805B41C
	b	.L10
.L6:
	mov	r0, r8
	strb	r0, [r2]
	str	r7, [sp]
	add	r0, r6, #0
	add	r2, r5, #0
	add	r3, sp, #0x4
	bl	sub_805B41C
	add	r2, sp, #0x4
	mov	r1, r9
	lsl	r0, r1, #0x10
	asr	r1, r0, #0x10
	ldrb	r0, [r6, #0xd]
	add	r5, r0, r5
	b	.L13
.L8:
	mov	r0, r8
	strb	r0, [r2]
	str	r7, [sp]
	add	r0, r6, #0
	add	r2, r5, #0
	add	r3, sp, #0x4
	bl	sub_805B41C
	add	r1, r0, #0
	ldrb	r0, [r4]
	strb	r0, [r6, #0xc]
	add	r4, r4, #0x1
	add	r2, sp, #0x4
	b	.L13
.L3:
	ldrb	r0, [r4]
	strb	r0, [r6, #0xd]
	add	r4, r4, #0x1
	b	.L13
.L9:
	strb	r0, [r2]
	add	r2, r2, #0x1
.L13:
	mov	r0, sl
	cmp	r0, #0
	beq	.L14	@cond_branch
.L10:
	add	sp, sp, #0x44
	pop	{r3, r4, r5}
	mov	r8, r3
	mov	r9, r4
	mov	sl, r5
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
	thumb_func_end sub_805B800

.align 2, 0 @ Don't pad with nop.
