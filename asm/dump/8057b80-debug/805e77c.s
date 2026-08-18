	.include "asm/common.inc"

	thumb_func_start sub_805E77C
sub_805E77C:
	push	{r4, r5, lr}
	add	r4, r0, #0
	lsl	r1, r1, #0x18
	lsr	r5, r1, #0x18
	lsl	r2, r2, #0x10
	lsr	r2, r2, #0x10
	ldr	r3, [r4, #0xc]
	mov	r1, #0x0
	ldr	r0, [r4]
	ldr	r0, [r0, #0x8]
	cmp	r1, r0
	bge	.L805E7B6	@cond_branch
.L805E794:
	ldrb	r0, [r3, #0xf]
	cmp	r0, r5
	bne	.L805E7A0	@cond_branch
	ldrh	r0, [r3, #0x16]
	cmp	r0, r2
	beq	.L805E7B2	@cond_branch
.L805E7A0:
	add	r3, r3, #0x20
	add	r0, r1, #1
	lsl	r0, r0, #0x10
	lsr	r1, r0, #0x10
	ldr	r0, [r4]
	ldr	r0, [r0, #0x8]
	cmp	r1, r0
	blt	.L805E794	@cond_branch
	b	.L805E7B6
.L805E7B2:
	add	r0, r3, #0
	b	.L805E7B8
.L805E7B6:
	mov	r0, #0x0
.L805E7B8:
	pop	{r4, r5}
	pop	{r1}
	bx	r1
	thumb_func_end sub_805E77C

.align 2, 0 @ Don't pad with nop.
