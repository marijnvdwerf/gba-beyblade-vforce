	.include "asm/common.inc"

	thumb_func_start deallocBeybladeActorData
deallocBeybladeActorData:
	push	{r4, r5, r6, lr}
	ldr	r0, .L8057250
	ldr	r0, [r0]
	ldr	r1, .L8057250 + 4
	add	r4, r0, r1
	mov	r6, #0x0
	mov	r5, #0x3b
.L8057236:
	ldr	r0, [r4]
	cmp	r0, #0
	beq	.L8057242	@cond_branch
	bl	deallocateBlock
	str	r6, [r4]
.L8057242:
	add	r4, r4, #0x8
	sub	r5, r5, #0x1
	cmp	r5, #0
	bge	.L8057236	@cond_branch
	pop	{r4, r5, r6}
	pop	{r0}
	bx	r0
.L8057250:
	.align	2, 0

	.4byte	_gameData
	.4byte	0x1110
	thumb_func_end deallocBeybladeActorData

.align 2, 0 @ Don't pad with nop.
