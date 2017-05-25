	.include "asm/common.inc"

	thumb_func_start sub_804F2A0
sub_804F2A0:
	push	{r4, r5, r6, lr}
	add	sp, sp, #0xfffffff0
	add	r5, r0, #0
	mov	r1, #0x96
	lsl	r1, r1, #0x1
	add	r0, r5, r1
	ldrb	r6, [r0]
	cmp	r6, #0
	bne	.L1	@cond_branch
	mov	r2, #0x90
	lsl	r2, r2, #0x1
	add	r4, r5, r2
	ldr	r0, [r4]
	cmp	r0, #0
	beq	.L13	@cond_branch
	bl	sub_8060A94
	str	r6, [r4]
	b	.L3
.L1:
	mov	r0, #0x90
	lsl	r0, r0, #0x1
	add	r6, r5, r0
	ldr	r4, [r6]
	cmp	r4, #0
	bne	.L4	@cond_branch
	mov	r0, #0x0
	bl	allocSprite
	str	r0, [r6]
	cmp	r0, #0
	beq	.L13	@cond_branch
	ldr	r1, .L10
	mov	r2, #0xd0
	lsl	r2, r2, #0x4
	str	r4, [sp]
	str	r4, [sp, #0x4]
	str	r4, [sp, #0x8]
	str	r4, [sp, #0xc]
	mov	r3, #0x0
	bl	LoadSpriteSheet
.L3:
	mov	r1, #0x90
	lsl	r1, r1, #0x1
	add	r0, r5, r1
	ldr	r0, [r0]
	cmp	r0, #0
	beq	.L13	@cond_branch
.L4:
	mov	r2, #0x87
	lsl	r2, r2, #0x1
	add	r1, r5, r2
	mov	r0, #0x1
	ldrh	r1, [r1]
	and	r0, r0, r1
	cmp	r0, #0
	beq	.L7	@cond_branch
	mov	r1, #0x90
	lsl	r1, r1, #0x1
	add	r0, r5, r1
	ldr	r2, [r0]
	ldr	r0, .L10 + 4
	ldr	r0, [r0]
	lsr	r0, r0, #0x4
	mov	r1, #0x3
	and	r0, r0, r1
	cmp	r0, #0x1
	bhi	.L8	@cond_branch
	mov	r1, #0x96
	lsl	r1, r1, #0x1
	add	r0, r5, r1
	ldrb	r0, [r0]
	sub	r0, r0, #0x1
	b	.L9
.L11:
	.align	2, 0
.L10:
	.4byte	0x8224dc4
	.4byte	0x3000e30
.L8:
	mov	r0, #0x5
.L9:
	strh	r0, [r2, #0x18]
	b	.L12
.L7:
	mov	r2, #0x90
	lsl	r2, r2, #0x1
	add	r0, r5, r2
	ldr	r1, [r0]
	add	r2, r2, #0xc
	add	r0, r5, r2
	ldrb	r0, [r0]
	sub	r0, r0, #0x1
	strh	r0, [r1, #0x18]
.L12:
	mov	r1, #0x8c
	lsl	r1, r1, #0x1
	add	r0, r5, r1
	ldr	r0, [r0]
	cmp	r0, #0
	beq	.L13	@cond_branch
	mov	r2, #0x90
	lsl	r2, r2, #0x1
	add	r0, r5, r2
	ldr	r1, [r0]
	sub	r2, r2, #0x10
	add	r0, r5, r2
	ldr	r0, [r0]
	ldr	r0, [r0, #0xc]
	mov	r2, #0x80
	lsl	r2, r2, #0x3
	add	r0, r0, r2
	str	r0, [r1, #0xc]
.L13:
	add	sp, sp, #0x10
	pop	{r4, r5, r6}
	pop	{r0}
	bx	r0
	thumb_func_end sub_804F2A0

.align 2, 0 @ Don't pad with nop.
