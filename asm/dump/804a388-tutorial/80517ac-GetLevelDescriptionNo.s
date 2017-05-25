	.include "asm/common.inc"

	thumb_func_start GetLevelDescriptionNo
GetLevelDescriptionNo:
	push	{r4, lr}
	bl	getLevelDescription2
	add	r4, r0, #0
	mov	r0, #0x20
	bl	sub_8051780
	cmp	r0, #0
	bne	.L1	@cond_branch
	ldrb	r0, [r4]
	b	.L2
.L1:
	ldr	r2, .L3
	ldr	r0, .L3 + 4
	ldr	r0, [r0]
	ldr	r1, .L3 + 8
	add	r0, r0, r1
	mov	r1, #0xd0
	ldrh	r0, [r0]
	mul	r0, r0, r1
	add	r0, r0, r2
	ldrb	r0, [r0]
.L2:
	pop	{r4}
	pop	{r1}
	bx	r1
.L4:
	.align	2, 0
.L3:
	.4byte	0x8075b4c
	.4byte	0x3000f48
	.4byte	0x6c4
	thumb_func_end GetLevelDescriptionNo

.align 2, 0 @ Don't pad with nop.
