	.include "asm/common.inc"

	thumb_func_start sub_8060040
sub_8060040:
	push	{lr}
	ldr	r0, .L8060054
	ldr	r0, [r0]
	ldr	r1, [r0, #0x14]
	mov	r0, #0x8
	and	r0, r0, r1
	cmp	r0, #0
	beq	.L8060058	@cond_branch
	mov	r0, #0x1
	b	.L8060068
.L8060054:
	.align	2, 0

	.4byte	_unk3005DC4
.L8060058:
	mov	r0, #0x10
	and	r1, r1, r0
	cmp	r1, #0
	bne	.L8060066	@cond_branch
	ldr	r0, .L806006C
	bl	printf
.L8060066:
	mov	r0, #0x0
.L8060068:
	pop	{r1}
	bx	r1
.L806006C:
	.align	2, 0

	.4byte	Str_87558B4
	thumb_func_end sub_8060040

.align 2, 0 @ Don't pad with nop.
