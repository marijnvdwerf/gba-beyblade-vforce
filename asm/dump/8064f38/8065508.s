	.include "asm/common.inc"

	thumb_func_start sub_8065508
sub_8065508:
	push	{r4, r5, r6, r7, lr}
	add	sp, sp, #0xfffffffc
	add	r6, r0, #0
	ldr	r7, [r6, #0x8]
	mov	r1, #0x0
	ldrb	r0, [r6, #0x4]
	cmp	r1, r0
	bcs	.L8065532	@cond_branch
	mov	r4, #0xc4
	ldr	r2, [r6]
	mov	r3, #0x0
.L806551E:
	add	r0, r1, #0
	mul	r0, r0, r4
	add	r0, r2, r0
	str	r3, [r0, #0x70]
	add	r0, r1, #1
	lsl	r0, r0, #0x10
	lsr	r1, r0, #0x10
	ldrb	r0, [r6, #0x4]
	cmp	r1, r0
	bcc	.L806551E	@cond_branch
.L8065532:
	cmp	r7, #0
	bge	.L8065538	@cond_branch
	neg	r7, r7
.L8065538:
	add	r0, r7, #0
	mov	r1, #0x3c
	bl	DivRem
	add	r1, r0, #0
	ldrb	r2, [r6, #0x4]
	sub	r2, r2, #0x1
	mov	r0, #0x1
	str	r0, [sp]
	add	r0, r6, #0
	mov	r3, #0x2
	bl	sub_80655C0
	add	r0, r7, #0
	mov	r1, #0x3c
	bl	Div
	add	r7, r0, #0
	mov	r4, #0xc4
	ldrb	r2, [r6, #0x4]
	add	r1, r2, #0
	mul	r1, r1, r4
	ldr	r5, .L806559C
	add	r1, r1, r5
	ldr	r0, [r6]
	add	r0, r0, r1
	ldr	r1, .L806559C + 4
	add	r1, r1, #0x3a
	ldrb	r2, [r1]
	mov	r1, #0x0
	bl	ActorSetFrame
	ldr	r1, [r6]
	ldrb	r2, [r6, #0x4]
	add	r0, r2, #0
	mul	r0, r0, r4
	add	r0, r0, r1
	add	r0, r0, r5
	mov	r1, #0x1
	neg	r1, r1
	str	r1, [r0, #0x70]
	cmp	r7, #0
	beq	.L80655A4	@cond_branch
	add	r0, r7, #0
	mov	r1, #0x3c
	bl	DivRem
	add	r1, r0, #0
	b	.L80655A6
.L806559A:
	.align	2, 0
.L806559C:
	.4byte	0xfffffdb4
	.4byte	byte_807D980
.L80655A4:
	mov	r1, #0x0
.L80655A6:
	ldrb	r2, [r6, #0x4]
	sub	r2, r2, #0x4
	mov	r0, #0x0
	str	r0, [sp]
	add	r0, r6, #0
	mov	r3, #0x2
	bl	sub_80655C0
	add	sp, sp, #0x4
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
	thumb_func_end sub_8065508

.align 2, 0 @ Don't pad with nop.
