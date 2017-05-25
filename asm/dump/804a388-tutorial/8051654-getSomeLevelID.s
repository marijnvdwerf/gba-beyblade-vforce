	.include "asm/common.inc"

	thumb_func_start getSomeLevelID
getSomeLevelID:
	push	{lr}
	mov	r0, #0x20
	bl	sub_8051780
	cmp	r0, #0
	bne	.L1	@cond_branch
	ldr	r0, .L3
	ldr	r0, [r0]
	ldrb	r0, [r0]
	lsl	r0, r0, #0x18
	asr	r0, r0, #0x18
	b	.L2
.L4:
	.align	2, 0
.L3:
	.4byte	0x3000f48
.L1:
	ldr	r0, .L5
	ldr	r0, [r0]
	ldr	r1, .L5 + 4
	add	r0, r0, r1
	ldrh	r0, [r0]
.L2:
	pop	{r1}
	bx	r1
.L6:
	.align	2, 0
.L5:
	.4byte	0x3000f48
	.4byte	0x6c4
	thumb_func_end getSomeLevelID

.align 2, 0 @ Don't pad with nop.
