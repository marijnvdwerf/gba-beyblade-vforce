	.include "asm/common.inc"

	thumb_func_start sub_805FFE4
sub_805FFE4:
	push	{r4, r5, r6, lr}
	ldr	r0, .L8060014
	ldr	r3, [r0]
	ldr	r5, [r3, #0x14]
	mov	r2, #0x1
	add	r0, r5, #0
	and	r0, r0, r2
	cmp	r0, #0
	bne	.L8060034	@cond_branch
	ldr	r4, .L8060014 + 4
	ldrh	r1, [r4]
	mov	r6, #0x8
	add	r0, r6, #0
	and	r0, r0, r1
	cmp	r0, #0
	beq	.L806000E	@cond_branch
	ldrh	r1, [r4]
	mov	r0, #0x80
	and	r0, r0, r1
	cmp	r0, #0
	beq	.L806001C	@cond_branch
.L806000E:
	mov	r0, #0x0
	b	.L8060036
.L8060012:
	.align	2, 0
.L8060014:
	.4byte	_unk3005DC4
	.4byte	0x4000128
.L806001C:
	orr	r2, r2, r5
	str	r2, [r3, #0x14]
	ldrh	r1, [r4]
	mov	r0, #0x4
	and	r0, r0, r1
	cmp	r0, #0
	bne	.L806002E	@cond_branch
	orr	r2, r2, r6
	b	.L8060032
.L806002E:
	mov	r0, #0x10
	orr	r2, r2, r0
.L8060032:
	str	r2, [r3, #0x14]
.L8060034:
	mov	r0, #0x1
.L8060036:
	pop	{r4, r5, r6}
	pop	{r1}
	bx	r1
	thumb_func_end sub_805FFE4

.align 2, 0 @ Don't pad with nop.
