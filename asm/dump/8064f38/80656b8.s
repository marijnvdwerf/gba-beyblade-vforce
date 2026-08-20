	.include "asm/common.inc"

	thumb_func_start sub_80656B8
sub_80656B8:
	push	{r4, r5, r6, lr}
	ldrb	r4, [r0, #0x4]
	ldr	r6, [r0, #0x10]
	ldr	r5, [r0]
	b	.L80656DE
.L80656C2:
	cmp	r1, #0x20
	beq	.L80656DE	@cond_branch
	ldr	r0, .L8065708
	add	r0, r1, r0
	ldrb	r2, [r0]
	add	r0, r5, #0
	mov	r1, #0x0
	bl	ActorSetFrame
	mov	r0, #0x1
	NEG	r0, r0
	str	r0, [r5, #0x70]
	add	r5, r5, #0xc4
	sub	r4, r4, #0x1
.L80656DE:
	cmp	r4, #0
	beq	.L80656EA	@cond_branch
	ldrb	r1, [r6]
	add	r6, r6, #0x1
	cmp	r1, #0
	bne	.L80656C2	@cond_branch
.L80656EA:
	add	r0, r4, #0
	sub	r4, r4, #0x1
	cmp	r0, #0
	beq	.L8065700	@cond_branch
	mov	r1, #0x0
.L80656F4:
	str	r1, [r5, #0x70]
	add	r5, r5, #0xc4
	add	r0, r4, #0
	sub	r4, r4, #0x1
	cmp	r0, #0
	bne	.L80656F4	@cond_branch
.L8065700:
	pop	{r4, r5, r6}
	pop	{r0}
	bx	r0
.L8065706:
	.align	2, 0
.L8065708:
	.4byte	byte_807D980
	thumb_func_end sub_80656B8

.align 2, 0 @ Don't pad with nop.
