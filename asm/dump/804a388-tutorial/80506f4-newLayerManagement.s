	.include "asm/common.inc"

	thumb_func_start newLayerManagement
newLayerManagement:
	push	{r4, r5, r6, r7, lr}
	mov	r7, sl
	mov	r6, r9
	mov	r5, r8
	push	{r5, r6, r7}
	add	sp, sp, #0xffffffd8
	mov	r9, r0
	str	r1, [sp, #0xc]
	str	r2, [sp, #0x10]
	ldr	r0, [sp, #0x48]
	lsl	r3, r3, #0x10
	lsr	r3, r3, #0x10
	str	r3, [sp, #0x14]
	lsl	r0, r0, #0x18
	lsr	r0, r0, #0x18
	str	r0, [sp, #0x18]
	mov	r0, #0x0
	str	r0, [sp, #0x1c]
	mov	sl, r0
	bl	sub_8059934
	mov	r4, #0x0
	ldr	r1, [sp, #0x10]
	add	r1, r1, #0x74
	mov	r8, r1
.L22:
	lsl	r0, r4, #0x1
	add	r0, r0, r4
	lsl	r0, r0, #0x3
	add	r0, r0, #0x14
	ldr	r2, [sp, #0x10]
	add	r3, r2, r0
	lsl	r0, r4, #0x4
	add	r0, r0, r4
	lsl	r0, r0, #0x3
	ldr	r5, [sp, #0xc]
	add	r5, r5, r0
	mov	ip, r5
	ldr	r0, [r3]
	add	r1, r4, #1
	str	r1, [sp, #0x20]
	cmp	r0, #0
	beq	.L5	@cond_branch
	mov	r2, #0x1
	ldrb	r0, [r0, #0x18]
	and	r2, r2, r0
	NEG	r0, r2
	orr	r0, r0, r2
	asr	r1, r0, #0x1f
	mov	r0, #0x2
	and	r1, r1, r0
	mov	r0, sl
	ASR	r0, r1
	mov	r5, #0x1
	b	.L2
.L3:
	add	r0, r1, #1
	lsl	r0, r0, #0x10
	lsr	r1, r0, #0x10
	mov	r0, sl
	ASR	r0, r1
.L2:
	and	r0, r0, r5
	cmp	r0, #0
	bne	.L3	@cond_branch
	cmp	r1, #0x3
	bls	.L4	@cond_branch
	ldr	r0, .L6
	bl	printf
	b	.L5
.L7:
	.align	2, 0
.L6:
	.4byte	0x872934c
.L4:
	mov	r0, #0x1
	LSL	r0, r1
	mov	r5, sl
	orr	r5, r5, r0
	lsl	r0, r5, #0x10
	lsr	r0, r0, #0x10
	mov	sl, r0
	lsl	r0, r1, #0x18
	lsr	r1, r0, #0x18
	ldr	r5, [r3]
	mov	r6, #0x40
	str	r0, [sp, #0x24]
	cmp	r2, #0
	beq	.L8	@cond_branch
	ldr	r6, .L13
.L8:
	ldr	r0, [r3, #0xc]
	mov	r2, #0x1
	orr	r0, r0, r2
	lsl	r0, r0, #0x10
	lsr	r0, r0, #0x10
	str	r0, [sp]
	ldr	r0, [r3, #0x4]
	NEG	r0, r0
	asr	r0, r0, #0x8
	str	r0, [sp, #0x4]
	ldr	r0, [r3, #0x8]
	NEG	r0, r0
	asr	r0, r0, #0x8
	str	r0, [sp, #0x8]
	mov	r0, ip
	add	r2, r5, #0
	add	r3, r6, #0
	bl	sub_8058968
	cmp	r4, #0x1
	beq	.L9	@cond_branch
	cmp	r4, #0x1
	bgt	.L10	@cond_branch
	cmp	r4, #0
	beq	.L11	@cond_branch
	b	.L20
.L14:
	.align	2, 0
.L13:
	.4byte	0x4040
.L10:
	cmp	r4, #0x2
	beq	.L15	@cond_branch
	cmp	r4, #0x3
	beq	.L16	@cond_branch
	b	.L20
.L11:
	mov	r3, r8
	ldrb	r3, [r3]
	lsl	r0, r3, #0x1e
	lsr	r7, r0, #0x1e
	b	.L20
.L9:
	mov	r5, r8
	ldrb	r5, [r5]
	lsl	r0, r5, #0x1c
	lsr	r7, r0, #0x1e
	b	.L20
.L15:
	mov	r1, r8
	ldrb	r1, [r1]
	lsl	r0, r1, #0x1a
	lsr	r7, r0, #0x1e
	b	.L20
.L16:
	mov	r2, r8
	ldrb	r2, [r2]
	lsr	r7, r2, #0x6
.L20:
	ldr	r3, [sp, #0x24]
	lsr	r0, r3, #0x18
	bl	GetBGLayerCntPtr
	mov	r1, #0x3
	add	r2, r7, #0
	and	r2, r2, r1
	mov	r5, #0x4
	NEG	r5, r5
	add	r1, r5, #0
	ldrb	r3, [r0]
	and	r1, r1, r3
	orr	r1, r1, r2
	strb	r1, [r0]
	ldr	r5, [sp, #0x1c]
	add	r5, r5, #0x1
	str	r5, [sp, #0x1c]
.L5:
	ldr	r4, [sp, #0x20]
	cmp	r4, #0x3
	bgt	.L21	@cond_branch
	b	.L22
.L21:
	ldr	r0, [sp, #0x18]
	cmp	r0, #0
	beq	.L25	@cond_branch
	ldr	r1, [sp, #0x10]
	ldr	r0, [r1, #0x78]
	cmp	r0, #0
	beq	.L24	@cond_branch
	bl	loadPalette
.L24:
	ldr	r2, [sp, #0x10]
	ldr	r0, [r2, #0x7c]
	cmp	r0, #0
	beq	.L25	@cond_branch
	bl	loadPalette2
.L25:
	mov	r0, #0x0
	mov	r3, sp
	ldrh	r5, [r3, #0x1c]
	mov	r3, r9
	strh	r5, [r3, #0x2]
	strh	r0, [r3, #0x4]
	mov	r1, sl
	strh	r1, [r3, #0x6]
	mov	r2, sp
	ldrh	r2, [r2, #0x14]
	strh	r2, [r3, #0x8]
	ldr	r5, [sp, #0xc]
	str	r5, [r3, #0xc]
	ldr	r1, [sp, #0x10]
	str	r1, [r3, #0x10]
	str	r0, [r3, #0x14]
	ldr	r0, .L26
	ldrb	r0, [r0]
	strb	r0, [r3]
	ldr	r0, .L26 + 4
	ldrb	r0, [r0]
	strb	r0, [r3, #0x1]
	add	sp, sp, #0x28
	pop	{r3, r4, r5}
	mov	r8, r3
	mov	r9, r4
	mov	sl, r5
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L27:
	.align	2, 0
.L26:
	.4byte	0x3000de0
	.4byte	0x3000e3c
	thumb_func_end newLayerManagement

.align 2, 0 @ Don't pad with nop.
