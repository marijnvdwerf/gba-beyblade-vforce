	.include "asm/common.inc"

	thumb_func_start sub_804A51C
sub_804A51C:
	push	{r4, lr}
	ldr	r0, .L804A54C
	ldr	r0, [r0]
	mov	r1, #0xa8
	lsl	r1, r1, #0x5
	add	r4, r0, r1
	ldr	r0, [r4]
	cmp	r0, #0
	beq	.L804A546	@cond_branch
	mov	r0, #0x1
	bl	sub_80556DC
	cmp	r0, #0
	beq	.L804A546	@cond_branch
	ldr	r0, [r4]
	bl	sub_804A550
	mov	r0, #0x0
	str	r0, [r4]
	bl	sub_8055624
.L804A546:
	pop	{r4}
	pop	{r0}
	bx	r0
.L804A54C:
	.align	2, 0

	.4byte	_gameData
	thumb_func_end sub_804A51C

.align 2, 0 @ Don't pad with nop.
