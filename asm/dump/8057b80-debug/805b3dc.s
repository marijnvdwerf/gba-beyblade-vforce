	.include "asm/common.inc"

	thumb_func_start sub_805B3DC
sub_805B3DC:
	push	{r4, r5, r6, lr}
	add	r4, r0, #0
	add	r5, r2, #0
	mov	r2, #0x0
	ldrb	r0, [r4]
	add	r4, r4, #0x1
	cmp	r0, #0
	beq	.L1	@cond_branch
	ldr	r6, .L5
.L4:
	mov	r3, #0x5
	cmp	r0, #0x20
	beq	.L3	@cond_branch
	add	r0, r0, r6
	ldrb	r0, [r0]
	add	r3, r5, #0
	cmp	r1, #0
	beq	.L3	@cond_branch
	add	r0, r1, r0
	ldrb	r0, [r0]
	sub	r3, r3, r0
.L3:
	add	r2, r2, r3
	ldrb	r0, [r4]
	add	r4, r4, #0x1
	cmp	r0, #0
	bne	.L4	@cond_branch
.L1:
	add	r0, r2, #0
	pop	{r4, r5, r6}
	pop	{r1}
	bx	r1
.L6:
	.align	2, 0
.L5:
	.4byte	0x807d980
	thumb_func_end sub_805B3DC

.align 2, 0 @ Don't pad with nop.
