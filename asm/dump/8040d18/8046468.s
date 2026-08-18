	.include "asm/common.inc"

	thumb_func_start sub_8046468
sub_8046468:
	push	{r4, r5, lr}
	add	sp, sp, #0xffffffe4
	add	r4, r0, #0
	lsl	r2, r2, #0x18
	lsr	r5, r2, #0x18
	bl	getLanguage
	mov	r0, #0x1
	ldrb	r1, [r4, #0xe]
	and	r0, r0, r1
	cmp	r0, #0
	beq	.L8046486	@cond_branch
	ldr	r0, [r4]
	bl	sub_8060A60
.L8046486:
	mov	r0, #0x1
	ldrb	r1, [r4, #0xe]
	orr	r1, r1, r0
	strb	r1, [r4, #0xe]
	cmp	r5, #0
	beq	.L804649A	@cond_branch
	mov	r0, #0x2
	orr	r1, r1, r0
	strb	r1, [r4, #0xe]
	b	.L80464B2
.L804649A:
	ldr	r1, .L80464BC
	mov	r0, #0x10
	str	r0, [sp]
	str	r0, [sp, #0x4]
	add	r0, sp, #0x8
	mov	r2, #0x0
	mov	r3, #0x10
	bl	sub_8063830
	add	r0, sp, #0x8
	bl	deallocate_80637CC
.L80464B2:
	add	sp, sp, #0x1c
	pop	{r4, r5}
	pop	{r0}
	bx	r0
.L80464BA:
	.align	2, 0
.L80464BC:
	.4byte	0x5000200
	thumb_func_end sub_8046468

.align 2, 0 @ Don't pad with nop.
