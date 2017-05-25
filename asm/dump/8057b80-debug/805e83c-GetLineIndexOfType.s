	.include "asm/common.inc"

	thumb_func_start GetLineIndexOfType
GetLineIndexOfType:
	push	{r4, lr}
	lsl	r1, r1, #0x18
	lsr	r4, r1, #0x18
	lsl	r2, r2, #0x10
	lsr	r2, r2, #0x10
	lsl	r3, r2, #0x5
	ldr	r1, [r0, #0xc]
	add	r1, r1, r3
	ldr	r0, [r0]
	ldr	r0, [r0, #0x8]
	cmp	r2, r0
	bge	.L1	@cond_branch
	add	r3, r0, #0
.L4:
	ldrb	r0, [r1, #0xf]
	cmp	r0, r4
	bne	.L2	@cond_branch
	add	r0, r2, #0
	b	.L3
.L2:
	add	r1, r1, #0x20
	add	r0, r2, #1
	lsl	r0, r0, #0x10
	lsr	r2, r0, #0x10
	cmp	r2, r3
	blt	.L4	@cond_branch
.L1:
	mov	r0, #0x1
	NEG	r0, r0
.L3:
	pop	{r4}
	pop	{r1}
	bx	r1
	thumb_func_end GetLineIndexOfType

.align 2, 0 @ Don't pad with nop.
