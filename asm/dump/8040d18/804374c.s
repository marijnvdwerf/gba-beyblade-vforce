	.include "asm/common.inc"

	thumb_func_start sub_804374C
sub_804374C:
	push	{r4, r5, r6, lr}
	add	r4, r0, #0
	mov	r1, #0x92
	lsl	r1, r1, #0x3
	add	r0, r4, r1
	ldr	r0, [r0]
	cmp	r0, #0
	bne	.L1	@cond_branch
	b	.L21
.L1:
	add	r0, r4, #0
	bl	sub_8043720
	add	r6, r0, #0
	ldr	r0, .L6
	ldrh	r1, [r0]
	mov	r0, #0xf0
	and	r0, r0, r1
	cmp	r0, #0
	beq	.L16	@cond_branch
	mov	r0, #0x40
	and	r0, r0, r1
	cmp	r0, #0
	beq	.L4	@cond_branch
	mov	r1, #0x8f
	lsl	r1, r1, #0x3
	add	r0, r4, r1
	mov	r1, #0x0
	bl	sub_805AFBC
	b	.L8
.L7:
	.align	2, 0
.L6:
	.4byte	0x3005da0
.L4:
	mov	r0, #0x80
	and	r0, r0, r1
	cmp	r0, #0
	beq	.L8	@cond_branch
	mov	r1, #0x8f
	lsl	r1, r1, #0x3
	add	r0, r4, r1
	mov	r1, #0x1
	bl	sub_805AFBC
.L8:
	ldr	r0, .L12
	ldrh	r1, [r0]
	mov	r0, #0x20
	and	r0, r0, r1
	cmp	r0, #0
	beq	.L9	@cond_branch
	mov	r0, #0x8f
	lsl	r0, r0, #0x3
	add	r5, r4, r0
	add	r0, r5, #0
	bl	sub_805B210
	mov	r1, #0x1
	NEG	r1, r1
	cmp	r0, r1
	beq	.L10	@cond_branch
	add	r0, r4, #0
	bl	sub_8043720
	add	r1, r0, #0
	mov	r0, #0x9
	bl	sub_80490CC
.L10:
	add	r0, r5, #0
	mov	r1, #0x0
	bl	sub_805B050
	b	.L14
.L13:
	.align	2, 0
.L12:
	.4byte	0x3005da0
.L9:
	mov	r0, #0x10
	and	r0, r0, r1
	cmp	r0, #0
	beq	.L14	@cond_branch
	mov	r1, #0x8f
	lsl	r1, r1, #0x3
	add	r5, r4, r1
	add	r0, r5, #0
	bl	sub_805B210
	mov	r1, #0x1
	NEG	r1, r1
	cmp	r0, r1
	beq	.L15	@cond_branch
	add	r0, r4, #0
	bl	sub_8043720
	mov	r1, #0x80
	lsl	r1, r1, #0x18
	orr	r1, r1, r0
	mov	r0, #0x9
	bl	sub_80490CC
.L15:
	add	r0, r5, #0
	mov	r1, #0x1
	bl	sub_805B050
.L14:
	add	r0, r4, #0
	bl	sub_8043720
	add	r1, r0, #0
	cmp	r6, r1
	beq	.L16	@cond_branch
	mov	r0, #0x4
	bl	sub_80490CC
.L16:
	ldr	r0, .L19
	ldrh	r1, [r0]
	mov	r0, #0x1
	and	r0, r0, r1
	cmp	r0, #0
	beq	.L17	@cond_branch
	add	r0, r4, #0
	bl	sub_8043720
	add	r1, r0, #0
	mov	r0, #0x5
	bl	sub_80490CC
	b	.L21
.L20:
	.align	2, 0
.L19:
	.4byte	0x3005da0
.L17:
	mov	r0, #0x2
	and	r0, r0, r1
	cmp	r0, #0
	beq	.L21	@cond_branch
	mov	r0, #0x6
	mov	r1, #0x0
	bl	sub_80490CC
.L21:
	pop	{r4, r5, r6}
	pop	{r0}
	bx	r0
	thumb_func_end sub_804374C

.align 2, 0 @ Don't pad with nop.
