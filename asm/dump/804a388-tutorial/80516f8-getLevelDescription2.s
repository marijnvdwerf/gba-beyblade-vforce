	.include "asm/common.inc"

	thumb_func_start getLevelDescription2
getLevelDescription2:
	push	{lr}
	bl	getSomeLevelID
	mov	r1, #0xd0
	mul	r0, r0, r1
	ldr	r1, .L1
	add	r0, r0, r1
	pop	{r1}
	bx	r1
.L2:
	.align	2, 0
.L1:
	.4byte	0x8075b4c
	thumb_func_end getLevelDescription2

.align 2, 0 @ Don't pad with nop.
