	.include "asm/common.inc"

	thumb_func_start sub_804AD74
sub_804AD74:
	push	{r4, r5, r6, r7, lr}
	add	sp, sp, #0xfffffffc
	ldr	r0, .L13
	ldr	r0, [r0]
	ldr	r1, .L13 + 4
	add	r3, r0, r1
	ldr	r1, .L13 + 8
	mov	r4, #0x0
	ldsh	r2, [r1, r4]
	ldrh	r3, [r3]
	add	r5, r3, r2
	ldr	r3, .L13 + 12
	add	r0, r0, r3
	ldrh	r3, [r0]
	add	r4, r3, r2
	add	r0, r2, #0
	add	r2, r1, #0
	cmp	r0, #0
	bge	.L6	@cond_branch
	cmp	r5, #0
	bge	.L2	@cond_branch
	mov	r5, #0x0
.L2:
	cmp	r4, #0
	bge	.L3	@cond_branch
	mov	r4, #0x0
.L3:
	cmp	r3, #0
	beq	.L4	@cond_branch
	lsl	r0, r4, #0x10
	lsr	r0, r0, #0x10
	str	r2, [sp]
	bl	sub_804AFD4
	ldr	r2, [sp]
.L4:
	cmp	r5, #0
	bne	.L6	@cond_branch
	cmp	r4, #0
	bne	.L6	@cond_branch
	strh	r4, [r2]
.L6:
	mov	r3, #0x0
	ldsh	r0, [r2, r3]
	cmp	r0, #0
	ble	.L12	@cond_branch
	ldr	r7, .L13 + 16
	mov	r1, #0x0
	ldsh	r0, [r7, r1]
	cmp	r5, r0
	ble	.L8	@cond_branch
	add	r5, r0, #0
.L8:
	ldr	r6, .L13 + 20
	mov	r3, #0x0
	ldsh	r1, [r6, r3]
	cmp	r4, r1
	ble	.L9	@cond_branch
	add	r4, r1, #0
.L9:
	ldr	r0, .L13
	ldr	r0, [r0]
	ldr	r3, .L13 + 12
	add	r0, r0, r3
	ldrh	r0, [r0]
	cmp	r0, r1
	bge	.L10	@cond_branch
	lsl	r0, r4, #0x10
	lsr	r0, r0, #0x10
	str	r2, [sp]
	bl	sub_804AFD4
	ldr	r2, [sp]
.L10:
	mov	r1, #0x0
	ldsh	r0, [r7, r1]
	cmp	r5, r0
	bne	.L12	@cond_branch
	mov	r3, #0x0
	ldsh	r0, [r6, r3]
	cmp	r4, r0
	bne	.L12	@cond_branch
	mov	r0, #0x0
	strh	r0, [r2]
.L12:
	add	sp, sp, #0x4
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L14:
	.align	2, 0
.L13:
	.4byte	0x3000f48
	.4byte	0x6e4
	.4byte	0x3000f1c
	.4byte	0x6e6
	.4byte	0x3000f18
	.4byte	0x3000f14
	thumb_func_end sub_804AD74

.align 2, 0 @ Don't pad with nop.
