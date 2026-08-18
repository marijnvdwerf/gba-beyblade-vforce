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
	bne	.L804375E	@cond_branch
	b	.L8043854
.L804375E:
	add	r0, r4, #0
	bl	sub_8043720
	add	r6, r0, #0
	ldr	r0, .L8043788
	ldrh	r1, [r0]
	mov	r0, #0xf0
	and	r0, r0, r1
	cmp	r0, #0
	beq	.L8043824	@cond_branch
	mov	r0, #0x40
	and	r0, r0, r1
	cmp	r0, #0
	beq	.L804378C	@cond_branch
	mov	r1, #0x8f
	lsl	r1, r1, #0x3
	add	r0, r4, r1
	mov	r1, #0x0
	bl	sub_805AFBC
	b	.L80437A0
.L8043788:
	.align	2, 0

	.4byte	0x3005da0
.L804378C:
	mov	r0, #0x80
	and	r0, r0, r1
	cmp	r0, #0
	beq	.L80437A0	@cond_branch
	mov	r1, #0x8f
	lsl	r1, r1, #0x3
	add	r0, r4, r1
	mov	r1, #0x1
	bl	sub_805AFBC
.L80437A0:
	ldr	r0, .L80437D8
	ldrh	r1, [r0]
	mov	r0, #0x20
	and	r0, r0, r1
	cmp	r0, #0
	beq	.L80437DC	@cond_branch
	mov	r0, #0x8f
	lsl	r0, r0, #0x3
	add	r5, r4, r0
	add	r0, r5, #0
	bl	sub_805B210
	mov	r1, #0x1
	NEG	r1, r1
	cmp	r0, r1
	beq	.L80437CE	@cond_branch
	add	r0, r4, #0
	bl	sub_8043720
	add	r1, r0, #0
	mov	r0, #0x9
	bl	sub_80490CC
.L80437CE:
	add	r0, r5, #0
	mov	r1, #0x0
	bl	sub_805B050
	b	.L8043812
.L80437D8:
	.align	2, 0

	.4byte	0x3005da0
.L80437DC:
	mov	r0, #0x10
	and	r0, r0, r1
	cmp	r0, #0
	beq	.L8043812	@cond_branch
	mov	r1, #0x8f
	lsl	r1, r1, #0x3
	add	r5, r4, r1
	add	r0, r5, #0
	bl	sub_805B210
	mov	r1, #0x1
	NEG	r1, r1
	cmp	r0, r1
	beq	.L804380A	@cond_branch
	add	r0, r4, #0
	bl	sub_8043720
	mov	r1, #0x80
	lsl	r1, r1, #0x18
	orr	r1, r1, r0
	mov	r0, #0x9
	bl	sub_80490CC
.L804380A:
	add	r0, r5, #0
	mov	r1, #0x1
	bl	sub_805B050
.L8043812:
	add	r0, r4, #0
	bl	sub_8043720
	add	r1, r0, #0
	cmp	r6, r1
	beq	.L8043824	@cond_branch
	mov	r0, #0x4
	bl	sub_80490CC
.L8043824:
	ldr	r0, .L8043840
	ldrh	r1, [r0]
	mov	r0, #0x1
	and	r0, r0, r1
	cmp	r0, #0
	beq	.L8043844	@cond_branch
	add	r0, r4, #0
	bl	sub_8043720
	add	r1, r0, #0
	mov	r0, #0x5
	bl	sub_80490CC
	b	.L8043854
.L8043840:
	.align	2, 0

	.4byte	0x3005da0
.L8043844:
	mov	r0, #0x2
	and	r0, r0, r1
	cmp	r0, #0
	beq	.L8043854	@cond_branch
	mov	r0, #0x6
	mov	r1, #0x0
	bl	sub_80490CC
.L8043854:
	pop	{r4, r5, r6}
	pop	{r0}
	bx	r0
	thumb_func_end sub_804374C

.align 2, 0 @ Don't pad with nop.
