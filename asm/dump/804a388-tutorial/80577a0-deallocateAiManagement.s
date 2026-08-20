	.include "asm/common.inc"

	thumb_func_start deallocateAiManagement
deallocateAiManagement:
	push	{lr}
	ldr	r0, .L80577B8
	ldr	r1, [r0]
	ldr	r2, .L80577B8 + 4
	add	r0, r1, r2
	ldr	r0, [r0]
	cmp	r0, #0
	bne	.L80577C4	@cond_branch
	ldr	r0, .L80577B8 + 8
	bl	printf
	b	.L80577CC
.L80577B8:
	.align	2, 0

	.4byte	_gameData
	.4byte	0xcbc
	.4byte	Str_872CA94
.L80577C4:
	ldr	r2, .L80577D0
	add	r0, r1, r2
	bl	deallocateQuadTree
.L80577CC:
	pop	{r0}
	bx	r0
.L80577D0:
	.align	2, 0

	.4byte	0xddc
	thumb_func_end deallocateAiManagement

.align 2, 0 @ Don't pad with nop.
