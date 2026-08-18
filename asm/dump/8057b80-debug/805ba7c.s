	.include "asm/common.inc"

	thumb_func_start sub_805BA7C
sub_805BA7C:
	push	{r4, lr}
	mov	ip, r0
	ldr	r3, [r0, #0xc]
	mov	r0, #0x8a
	lsl	r0, r0, #0x1
	ADD r0, ip
	ldr	r0, [r0]
	cmp	r0, #0
	bne	.L805BAA0	@cond_branch
	b	.L805BAB8
.L805BA90:
	mov	r0, #0x8a
	lsl	r0, r0, #0x1
	ADD r0, ip
	ldr	r1, [r0]
	lsl	r0, r2, #0x2
	add	r0, r0, r1
	ldr	r0, [r0]
	b	.L805BABA
.L805BAA0:
	mov	r2, #0x0
	mov	r4, ip
	ldr	r0, [r4]
	ldr	r0, [r0, #0x8]
	cmp	r2, r0
	bge	.L805BAB8	@cond_branch
.L805BAAC:
	cmp	r3, r1
	beq	.L805BA90	@cond_branch
	add	r3, r3, #0x20
	add	r2, r2, #0x1
	cmp	r2, r0
	blt	.L805BAAC	@cond_branch
.L805BAB8:
	mov	r0, #0x0
.L805BABA:
	pop	{r4}
	pop	{r1}
	bx	r1
	thumb_func_end sub_805BA7C

.align 2, 0 @ Don't pad with nop.
