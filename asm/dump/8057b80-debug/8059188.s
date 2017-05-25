	.include "asm/common.inc"

	thumb_func_start sub_8059188
sub_8059188:
	push	{r4, r5, r6, r7, lr}
	mov	r7, r9
	mov	r6, r8
	push	{r6, r7}
	add	sp, sp, #0xfffffff4
	add	r5, r0, #0
	add	r4, r1, #0
	lsl	r2, r2, #0x18
	lsr	r6, r2, #0x18
	lsl	r3, r3, #0x10
	lsr	r3, r3, #0x10
	mov	r8, r3
	mov	r2, #0x88
	bl	sub_8067A2C
	add	r0, r5, #0
	add	r0, r0, #0x5e
	mov	r1, #0x0
	mov	r9, r1
	strb	r6, [r0]
	lsl	r1, r6, #0x1
	add	r1, r1, r6
	lsl	r1, r1, #0x3
	ldr	r0, .L4
	add	r1, r1, r0
	str	r1, [r5, #0x8]
	ldr	r0, [r4, #0x8]
	ldmia	r0!, {r2, r3, r4}
	stmia	r1!, {r2, r3, r4}
	ldmia	r0!, {r2, r3, r4}
	stmia	r1!, {r2, r3, r4}
	add	r4, r5, #0
	add	r4, r4, #0x64
	ldrh	r2, [r4]
	add	r0, r5, #0
	mov	r1, r8
	bl	sub_8059284
	lsr	r1, r0, #0xb
	cmp	r1, #0
	bne	.L1	@cond_branch
	mov	r1, #0x1
.L1:
	ldr	r0, .L4 + 4
	ldrb	r2, [r0]
	sub	r1, r2, r1
	strb	r1, [r0]
	add	r2, r5, #0
	add	r2, r2, #0x5c
	strb	r1, [r2]
	mov	r3, #0x1
	add	r0, r3, #0
	ldrh	r4, [r4]
	and	r0, r0, r4
	add	r7, r2, #0
	cmp	r0, #0
	bne	.L2	@cond_branch
	ldr	r2, .L4 + 8
	mov	r4, r9
	str	r4, [sp]
	add	r1, r5, #0
	add	r1, r1, #0x5f
	add	r0, r3, #0
	ldrb	r1, [r1]
	LSL	r0, r1
	str	r0, [sp, #0x4]
	add	r1, r5, #0
	add	r1, r1, #0x60
	add	r0, r3, #0
	ldrb	r1, [r1]
	LSL	r0, r1
	str	r0, [sp, #0x8]
	ldr	r4, [r2]
	add	r0, r5, #0
	mov	r1, #0x0
	mov	r2, #0x0
	mov	r3, #0x0
	bl	call_via_r4
	b	.L3
.L5:
	.align	2, 0
.L4:
	.4byte	0x3000ca0
	.4byte	0x3000e3c
	.4byte	0x807d944
.L2:
	mov	r0, r9
	str	r0, [sp]
	add	r1, r5, #0
	add	r1, r1, #0x5f
	add	r0, r3, #0
	ldrb	r1, [r1]
	LSL	r0, r1
	str	r0, [sp, #0x4]
	add	r1, r5, #0
	add	r1, r1, #0x60
	add	r0, r3, #0
	ldrb	r1, [r1]
	LSL	r0, r1
	str	r0, [sp, #0x8]
	add	r0, r5, #0
	mov	r1, #0x0
	mov	r2, #0x0
	mov	r3, #0x0
	bl	sub_80594FC
.L3:
	add	r0, r6, #0
	bl	GetBGLayerCntPtr
	ldrb	r7, [r7]
	lsl	r1, r7, #0x8
	mov	r2, r8
	orr	r1, r1, r2
	add	r2, r5, #0
	add	r2, r2, #0x5d
	ldrb	r2, [r2]
	lsl	r2, r2, #0x2
	orr	r1, r1, r2
	strh	r1, [r0]
	add	sp, sp, #0xc
	pop	{r3, r4}
	mov	r8, r3
	mov	r9, r4
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
	thumb_func_end sub_8059188

.align 2, 0 @ Don't pad with nop.
