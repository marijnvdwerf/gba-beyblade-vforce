	.include "asm/common.inc"

	thumb_func_start sub_8046424
sub_8046424:
	push	{lr}
	cmp	r1, #0x1
	beq	.L804643E	@cond_branch
	cmp	r1, #0x1
	bcc	.L8046438	@cond_branch
	cmp	r1, #0x2
	beq	.L8046446	@cond_branch
	cmp	r1, #0x5
	beq	.L804645C	@cond_branch
	b	.L8046462
.L8046438:
	bl	sub_8049168
	b	.L8046462
.L804643E:
	add	r0, r0, #0xb8
	bl	sub_80439A0
	b	.L8046462
.L8046446:
	ldr	r0, .L8046458
	ldrh	r0, [r0]
	cmp	r0, #0x2
	bne	.L8046462	@cond_branch
	mov	r0, #0xa
	bl	sub_80490F8
	b	.L8046462
.L8046456:
	.align	2, 0
.L8046458:
	.4byte	_unk3005DA0
.L804645C:
	mov	r0, #0xf
	bl	sub_80490F8
.L8046462:
	pop	{r0}
	bx	r0
	thumb_func_end sub_8046424

.align 2, 0 @ Don't pad with nop.
