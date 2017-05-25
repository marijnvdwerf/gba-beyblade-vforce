	.include "asm/common.inc"

	thumb_func_start sub_8058794
sub_8058794:
	push	{r4, r5, r6, r7, lr}
	mov	r7, r9
	mov	r6, r8
	push	{r6, r7}
	add	r4, r0, #0
	mov	r8, r1
	mov	r9, r2
	add	r7, r3, #0
	ldr	r1, [r4, #0x74]
	mov	r0, #0x1
	NEG	r0, r0
	cmp	r1, r0
	bne	.L1	@cond_branch
	mov	r0, #0x0
	str	r0, [r4, #0x74]
	mov	r0, #0x40
	bl	slowAllocate
	cmp	r0, #0
	bne	.L2	@cond_branch
	ldr	r0, .L4
	bl	nullsub_8
	b	.L3
.L5:
	.align	2, 0
.L4:
	.4byte	0x872cbcc
.L2:
	str	r0, [r4, #0x7c]
	ldr	r0, [r0]
	str	r0, [r4, #0x78]
.L1:
	ldr	r1, [r4, #0x74]
	cmp	r1, #0x3
	ble	.L6	@cond_branch
	mov	r5, #0x1
	NEG	r5, r5
	mov	r6, #0x0
	mov	r2, #0x0
	ldr	r3, [r4, #0x78]
	add	r1, r3, #0
.L9:
	ldr	r0, [r1]
	cmp	r0, #0
	bne	.L7	@cond_branch
	cmp	r5, #0
	bge	.L8	@cond_branch
	add	r5, r2, #0
.L8:
	add	r6, r6, #0x1
.L7:
	add	r1, r1, #0x10
	add	r2, r2, #0x1
	cmp	r2, #0x3
	ble	.L9	@cond_branch
	mov	r0, #0x1
	NEG	r0, r0
	cmp	r5, r0
	bne	.L10	@cond_branch
	add	r1, r3, #0
	b	.L11
.L10:
	lsl	r0, r5, #0x4
	add	r1, r3, r0
.L11:
	cmp	r6, #0x4
	bne	.L13	@cond_branch
	mov	r0, #0x0
	str	r0, [r4, #0x74]
	add	r1, r3, #0
	b	.L13
.L6:
	lsl	r1, r1, #0x4
	ldr	r0, [r4, #0x78]
	add	r1, r0, r1
.L13:
	mov	r0, r8
	str	r0, [r1, #0x8]
	str	r7, [r1]
	ldr	r0, [sp, #0x1c]
	str	r0, [r1, #0x4]
	mov	r0, r9
	str	r0, [r1, #0xc]
	ldr	r0, [r4, #0x74]
	add	r0, r0, #0x1
	str	r0, [r4, #0x74]
.L3:
	pop	{r3, r4}
	mov	r8, r3
	mov	r9, r4
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
	thumb_func_end sub_8058794

.align 2, 0 @ Don't pad with nop.
