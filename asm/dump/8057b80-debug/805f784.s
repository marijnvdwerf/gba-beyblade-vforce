	.include "asm/common.inc"

	thumb_func_start sub_805F784
sub_805F784:
	push	{r4, r5, r6, lr}
	add	r3, r0, #0
	lsl	r1, r1, #0x10
	lsr	r1, r1, #0x10
	add	r5, r1, #0
	lsl	r2, r2, #0x10
	lsr	r6, r2, #0x10
	mov	r1, #0x28
	ldsh	r0, [r3, r1]
	lsl	r0, r0, #0x3
	ldr	r1, [r3, #0x24]
	add	r4, r1, r0
	lsl	r0, r5, #0x3
	add	r2, r1, r0
	mov	r0, #0x4
	ldrh	r1, [r3, #0x32]
	and	r0, r0, r1
	cmp	r0, #0
	beq	.L1	@cond_branch
	ldrh	r0, [r4]
	strh	r0, [r3, #0x2e]
.L1:
	ldrh	r0, [r2]
	mov	r1, #0x0
	strh	r0, [r3, #0x2a]
	strh	r5, [r3, #0x28]
	add	r0, r3, #0
	add	r0, r0, #0x40
	strh	r1, [r0]
	mov	r0, #0x6
	ldsb	r0, [r2, r0]
	strh	r0, [r3, #0x3c]
	mov	r0, #0x6
	ldsb	r0, [r2, r0]
	strh	r0, [r3, #0x3e]
	ldrh	r0, [r2, #0x4]
	strh	r0, [r3, #0x3a]
	mov	r0, #0x7
	ldsb	r0, [r2, r0]
	strh	r0, [r3, #0x32]
	mov	r1, #0x2
	and	r0, r0, r1
	cmp	r0, #0
	beq	.L2	@cond_branch
	ldrh	r1, [r3, #0x2a]
	ldrh	r2, [r2, #0x2]
	add	r0, r1, r2
	sub	r0, r0, #0x1
	b	.L3
.L2:
	ldrh	r0, [r3, #0x2a]
.L3:
	strh	r0, [r3, #0x2c]
	add	r0, r3, #0
	add	r0, r0, #0x42
	mov	r1, #0x0
	strh	r6, [r0]
	add	r0, r0, #0x2
	strh	r1, [r0]
	pop	{r4, r5, r6}
	pop	{r0}
	bx	r0
	thumb_func_end sub_805F784

.align 2, 0 @ Don't pad with nop.
