	.include "asm/common.inc"

	thumb_func_start sub_8057068
sub_8057068:
	push	{r4, lr}
	add	r4, r0, #0
	bl	sub_80570D4
	lsl	r0, r0, #0x18
	cmp	r0, #0
	bne	.L8057080	@cond_branch
	ldr	r0, .L805707C
	b	.L8057088
.L805707A:
	.align	2, 0
.L805707C:
	.4byte	Pal_836067C
.L8057080:
	ldr	r0, .L8057090
	lsl	r1, r4, #0x2
	add	r1, r1, r0
	ldr	r0, [r1]
.L8057088:
	pop	{r4}
	pop	{r1}
	bx	r1
.L805708E:
	.align	2, 0
.L8057090:
	.4byte	CollectionPalettes
	thumb_func_end sub_8057068

.align 2, 0 @ Don't pad with nop.
