	.include "asm/common.inc"

	thumb_func_start deallocateAiManagement
deallocateAiManagement:
	push	{lr}
	ldr	r0, .L3
	ldr	r1, [r0]
	ldr	r2, .L3 + 4
	add	r0, r1, r2
	ldr	r0, [r0]
	cmp	r0, #0
	bne	.L1	@cond_branch
	ldr	r0, .L3 + 8
	bl	printf
	b	.L2
.L4:
	.align	2, 0
.L3:
	.4byte	0x3000fb0
	.4byte	0xcbc
	.4byte	0x872ca94
.L1:
	ldr	r2, .L5
	add	r0, r1, r2
	bl	deallocateQuadTree
.L2:
	pop	{r0}
	bx	r0
.L6:
	.align	2, 0
.L5:
	.4byte	0xddc
	thumb_func_end deallocateAiManagement

.align 2, 0 @ Don't pad with nop.
