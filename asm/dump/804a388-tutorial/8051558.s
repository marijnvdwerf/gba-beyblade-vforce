	.include "asm/common.inc"

	thumb_func_start sub_8051558
sub_8051558:
	push	{r4, r5, lr}
	ldr	r0, .L8051598
	ldr	r0, [r0]
	ldr	r2, .L8051598 + 4
	add	r1, r0, r2
	mov	r3, #0x0
	add	r4, r1, #0
	mov	r2, #0xa7
	lsl	r2, r2, #0x1
	mov	r5, #0x1
	NEG	r5, r5
.L805156E:
	ldmia	r4!, {r0}
	EOR	r3, r0
	sub	r2, r2, #0x1
	cmp	r2, r5
	bne	.L805156E	@cond_branch
	mov	r2, #0x0
	mov	r4, #0xac
	lsl	r4, r4, #0x3
	add	r0, r1, r4
	ldr	r0, [r0]
	cmp	r3, r0
	bne	.L8051590	@cond_branch
	ldr	r1, [r1]
	ldr	r0, .L8051598 + 8
	cmp	r1, r0
	bne	.L8051590	@cond_branch
	mov	r2, #0x1
.L8051590:
	add	r0, r2, #0
	pop	{r4, r5}
	pop	{r1}
	bx	r1
.L8051598:
	.align	2, 0

	.4byte	_currentGameState
	.4byte	0x6fc
	.4byte	0xdead
	thumb_func_end sub_8051558

.align 2, 0 @ Don't pad with nop.
