	.include "asm/common.inc"

	thumb_func_start sub_8058038
sub_8058038:
	push	{r4, lr}
	lsl	r1, r1, #0x10
	lsr	r3, r1, #0x10
	ldr	r2, [r0]
	ldr	r1, [r2, #0x18]
	add	r2, r2, r1
	mov	r1, #0x0
	ldrh	r0, [r0, #0x28]
	cmp	r1, r0
	bcs	.L8058060	@cond_branch
.L805804C:
	ldrh	r4, [r2]
	cmp	r4, r3
	bne	.L8058056	@cond_branch
	add	r0, r2, #0
	b	.L8058062
.L8058056:
	ldrh	r4, [r2, #0x2]
	add	r2, r4, r2
	add	r1, r1, #0x1
	cmp	r1, r0
	bcc	.L805804C	@cond_branch
.L8058060:
	mov	r0, #0x0
.L8058062:
	pop	{r4}
	pop	{r1}
	bx	r1
	thumb_func_end sub_8058038

.align 2, 0 @ Don't pad with nop.
