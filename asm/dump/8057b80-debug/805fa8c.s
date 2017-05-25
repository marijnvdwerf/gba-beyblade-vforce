	.include "asm/common.inc"

	thumb_func_start sub_805FA8C
sub_805FA8C:
	push	{r4, r5, lr}
	add	r3, r0, #0
	lsl	r1, r1, #0x10
	lsl	r2, r2, #0x10
	lsr	r5, r2, #0x10
	lsr	r1, r1, #0xe
	ldr	r0, [r3, #0x8]
	add	r4, r0, r1
	mov	r0, #0x4
	ldsh	r2, [r3, r0]
	lsl	r1, r2, #0x2
	ldr	r0, [r3, #0xc]
	add	r1, r0, r1
	ldrh	r0, [r3, #0x2]
	cmp	r2, r0
	bge	.L1	@cond_branch
	ldr	r0, .L4
	strh	r0, [r1, #0x2]
	strh	r5, [r1]
	mov	r0, #0x0
	ldsh	r1, [r4, r0]
	mov	r0, #0x1
	NEG	r0, r0
	cmp	r1, r0
	bne	.L2	@cond_branch
	ldrh	r0, [r3, #0x4]
	strh	r0, [r4]
	b	.L3
.L5:
	.align	2, 0
.L4:
	.4byte	0xffff
.L2:
	mov	r1, #0x2
	ldsh	r0, [r4, r1]
	lsl	r0, r0, #0x2
	ldr	r1, [r3, #0xc]
	add	r1, r1, r0
	ldrh	r0, [r3, #0x4]
	strh	r0, [r1, #0x2]
.L3:
	ldrh	r0, [r3, #0x4]
	strh	r0, [r4, #0x2]
	ldrh	r0, [r3, #0x4]
	add	r0, r0, #0x1
	strh	r0, [r3, #0x4]
.L1:
	pop	{r4, r5}
	pop	{r0}
	bx	r0
	thumb_func_end sub_805FA8C

.align 2, 0 @ Don't pad with nop.
