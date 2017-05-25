	.include "asm/common.inc"

	thumb_func_start sub_80662F8
sub_80662F8:
	push	{r4, r5, r6, lr}
	ldr	r2, [r0, #0xc]
	ldr	r6, [r0, #0x4]
	mov	r5, #0x0
	mov	r1, #0x0
	ldr	r3, [r0]
	cmp	r3, #0x1
	bhi	.L1	@cond_branch
	mov	r1, #0x1
.L1:
	cmp	r1, #0
	beq	.L2	@cond_branch
	mov	r5, #0xff
	mov	r0, #0x80
	lsl	r0, r0, #0xd
	orr	r2, r2, r0
	b	.L15
.L2:
	mov	r1, #0x0
	cmp	r3, #0x4
	bne	.L4	@cond_branch
	mov	r1, #0x1
.L4:
	cmp	r1, #0
	bne	.L5	@cond_branch
	mov	r1, #0x0
	cmp	r3, #0x2
	bne	.L6	@cond_branch
	mov	r1, #0x1
.L6:
	cmp	r1, #0
	beq	.L7	@cond_branch
	mov	r2, #0x0
	b	.L15
.L7:
	cmp	r2, #0
	beq	.L15	@cond_branch
	ldr	r0, [r0, #0x8]
	mov	r3, #0x7e
	NEG	r3, r3
	cmp	r0, r3
	bge	.L10	@cond_branch
	sub	r0, r3, r0
	cmp	r0, #0x19
	ble	.L11	@cond_branch
	mov	r2, #0x0
	b	.L19
.L11:
	LSR	r2, r0
	b	.L19
.L10:
	cmp	r0, #0x7f
	ble	.L14	@cond_branch
.L5:
	mov	r5, #0xff
	mov	r2, #0x0
	b	.L15
.L14:
	add	r5, r0, #0
	add	r5, r5, #0x7f
	mov	r0, #0x7f
	and	r0, r0, r2
	cmp	r0, #0x40
	bne	.L16	@cond_branch
	mov	r0, #0x80
	and	r0, r0, r2
	cmp	r0, #0
	beq	.L18	@cond_branch
	add	r2, r2, #0x40
	b	.L18
.L16:
	add	r2, r2, #0x3f
.L18:
	cmp	r2, #0
	bge	.L19	@cond_branch
	lsr	r2, r2, #0x1
	add	r5, r5, #0x1
.L19:
	lsr	r2, r2, #0x7
.L15:
	ldr	r0, .L20
	and	r2, r2, r0
	ldr	r0, .L20 + 4
	and	r4, r4, r0
	orr	r4, r4, r2
	mov	r0, #0xff
	and	r5, r5, r0
	lsl	r1, r5, #0x17
	ldr	r0, .L20 + 8
	and	r4, r4, r0
	orr	r4, r4, r1
	lsl	r1, r6, #0x1f
	ldr	r0, .L20 + 12
	and	r4, r4, r0
	orr	r4, r4, r1
	add	r0, r4, #0
	pop	{r4, r5, r6, pc}
.L21:
	.align	2, 0
.L20:
	.4byte	0x7fffff
	.4byte	0xff800000
	.4byte	0x807fffff
	.4byte	0x7fffffff
	thumb_func_end sub_80662F8

.align 2, 0 @ Don't pad with nop.
