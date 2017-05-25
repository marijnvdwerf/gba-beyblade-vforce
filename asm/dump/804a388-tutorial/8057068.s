	.include "asm/common.inc"

	thumb_func_start sub_8057068
sub_8057068:
	push	{r4, lr}
	add	r4, r0, #0
	bl	sub_80570D4
	lsl	r0, r0, #0x18
	cmp	r0, #0
	bne	.L1	@cond_branch
	ldr	r0, .L3
	b	.L2
.L4:
	.align	2, 0
.L3:
	.4byte	0x836067c
.L1:
	ldr	r0, .L5
	lsl	r1, r4, #0x2
	add	r1, r1, r0
	ldr	r0, [r1]
.L2:
	pop	{r4}
	pop	{r1}
	bx	r1
.L6:
	.align	2, 0
.L5:
	.4byte	0x8079b04
	thumb_func_end sub_8057068

.align 2, 0 @ Don't pad with nop.
