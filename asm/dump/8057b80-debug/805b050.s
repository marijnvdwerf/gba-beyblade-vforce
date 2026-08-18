	.include "asm/common.inc"

	thumb_func_start sub_805B050
sub_805B050:
	push	{r4, r5, r6, r7, lr}
	add	r5, r0, #0
	lsl	r1, r1, #0x18
	lsr	r6, r1, #0x18
	ldr	r1, [r5, #0x24]
	mov	r0, #0x4c
	mul	r1, r1, r0
	ldr	r0, [r5, #0xc]
	add	r2, r0, r1
	ldr	r0, [r2, #0x48]
	cmp	r0, #0
	beq	.L805B06A	@cond_branch
	add	r2, r0, #0
.L805B06A:
	ldr	r3, [r2, #0x38]
	cmp	r3, #0
	bne	.L805B076	@cond_branch
	mov	r0, #0x1
	NEG	r0, r0
	b	.L805B0B6
.L805B076:
	ldr	r4, [r2, #0x34]
	add	r7, r4, #0
	cmp	r6, #0
	beq	.L805B082	@cond_branch
	add	r4, r4, #0x1
	b	.L805B084
.L805B082:
	sub	r4, r4, #0x1
.L805B084:
	cmp	r4, #0
	bge	.L805B098	@cond_branch
	ldr	r0, [r2, #0x3c]
	mov	r1, #0x2
	and	r0, r0, r1
	cmp	r0, #0
	beq	.L805B096	@cond_branch
	mov	r4, #0x0
	b	.L805B098
.L805B096:
	add	r4, r4, r3
.L805B098:
	cmp	r4, r3
	blt	.L805B0AA	@cond_branch
	ldr	r0, [r2, #0x3c]
	mov	r1, #0x2
	and	r0, r0, r1
	mov	r4, #0x0
	cmp	r0, #0
	beq	.L805B0AA	@cond_branch
	add	r4, r7, #0
.L805B0AA:
	str	r4, [r2, #0x34]
	add	r0, r5, #0
	add	r1, r2, #0
	bl	sub_805AC80
	add	r0, r4, #0
.L805B0B6:
	pop	{r4, r5, r6, r7}
	pop	{r1}
	bx	r1
	thumb_func_end sub_805B050

.align 2, 0 @ Don't pad with nop.
