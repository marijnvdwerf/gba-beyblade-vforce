	.include "asm/common.inc"

	thumb_func_start GetLevelDescriptionNo
GetLevelDescriptionNo:
	push	{r4, lr}
	bl	getLevelDescription2
	add	r4, r0, #0
	mov	r0, #0x20
	bl	sub_8051780
	cmp	r0, #0
	bne	.L80517C2	@cond_branch
	ldrb	r0, [r4]
	b	.L80517D6
.L80517C2:
	ldr	r2, .L80517DC
	ldr	r0, .L80517DC + 4
	ldr	r0, [r0]
	ldr	r1, .L80517DC + 8
	add	r0, r0, r1
	mov	r1, #0xd0
	ldrh	r0, [r0]
	mul	r0, r0, r1
	add	r0, r0, r2
	ldrb	r0, [r0]
.L80517D6:
	pop	{r4}
	pop	{r1}
	bx	r1
.L80517DC:
	.align	2, 0

	.4byte	LevelDescriptions
	.4byte	_currentGameState
	.4byte	0x6c4
	thumb_func_end GetLevelDescriptionNo

.align 2, 0 @ Don't pad with nop.
