	.include "asm/common.inc"

	thumb_func_start sub_8057094
sub_8057094:
	push	{r4, lr}
	add	r4, r0, #0
	bl	sub_80570D4
	lsl	r0, r0, #0x18
	cmp	r0, #0
	bne	.L80570AC	@cond_branch
	ldr	r0, .L80570A8
	b	.L80570B4
.L80570A6:
	.align	2, 0
.L80570A8:
	.4byte	SpriteSheet_836087C
.L80570AC:
	ldr	r0, .L80570BC
	lsl	r1, r4, #0x2
	add	r1, r1, r0
	ldr	r0, [r1]
.L80570B4:
	pop	{r4}
	pop	{r1}
	bx	r1
.L80570BA:
	.align	2, 0
.L80570BC:
	.4byte	CollectionSpriteSheets
	thumb_func_end sub_8057094

.align 2, 0 @ Don't pad with nop.
