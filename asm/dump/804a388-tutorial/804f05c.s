	.include "asm/common.inc"

	thumb_func_start sub_804F05C
sub_804F05C:
	push	{r4, r5, r6, r7, lr}
	add	sp, sp, #0xfffffff0
	add	r6, r0, #0
	mov	r0, #0x94
	lsl	r0, r0, #0x1
	add	r2, r6, r0
	mov	r1, #0x95
	lsl	r1, r1, #0x1
	add	r0, r6, r1
	ldrh	r1, [r2]
	ldrh	r0, [r0]
	sub	r0, r0, r1
	asr	r0, r0, #0x4
	add	r1, r1, r0
	strh	r1, [r2]
	ldrh	r1, [r2]
	lsl	r0, r1, #0x2
	add	r0, r0, r1
	lsl	r0, r0, #0x3
	add	r0, r0, r1
	asr	r7, r0, #0x10
	cmp	r7, #0
	bne	.L1	@cond_branch
	mov	r2, #0x8c
	lsl	r2, r2, #0x1
	add	r4, r6, r2
	ldr	r0, [r4]
	cmp	r0, #0
	beq	.L2	@cond_branch
	bl	sub_8060A94
	str	r7, [r4]
.L2:
	mov	r0, #0x8e
	lsl	r0, r0, #0x1
	add	r4, r6, r0
	ldr	r0, [r4]
	cmp	r0, #0
	beq	.L17	@cond_branch
	bl	sub_8060A94
	str	r7, [r4]
	b	.L17
.L1:
	mov	r1, #0x8c
	lsl	r1, r1, #0x1
	add	r5, r6, r1
	ldr	r4, [r5]
	cmp	r4, #0
	bne	.L6	@cond_branch
	mov	r0, #0x0
	bl	allocSprite
	str	r0, [r5]
	cmp	r0, #0
	beq	.L6	@cond_branch
	ldr	r1, .L15
	mov	r3, #0x80
	lsl	r3, r3, #0x2
	str	r4, [sp]
	str	r4, [sp, #0x4]
	str	r4, [sp, #0x8]
	str	r4, [sp, #0xc]
	add	r2, r3, #0
	bl	LoadSpriteSheet
.L6:
	mov	r2, #0x8e
	lsl	r2, r2, #0x1
	add	r5, r6, r2
	ldr	r4, [r5]
	cmp	r4, #0
	bne	.L9	@cond_branch
	cmp	r7, #0x19
	ble	.L8	@cond_branch
	mov	r0, #0x0
	bl	allocSprite
	str	r0, [r5]
	cmp	r0, #0
	beq	.L9	@cond_branch
	ldr	r1, .L15 + 4
	mov	r2, #0x84
	lsl	r2, r2, #0x7
	mov	r3, #0x80
	lsl	r3, r3, #0x2
	str	r4, [sp]
	str	r4, [sp, #0x4]
	str	r4, [sp, #0x8]
	str	r4, [sp, #0xc]
	bl	LoadSpriteSheet
.L9:
	cmp	r7, #0x19
	bgt	.L11	@cond_branch
.L8:
	mov	r0, #0x8e
	lsl	r0, r0, #0x1
	add	r4, r6, r0
	ldr	r0, [r4]
	cmp	r0, #0
	beq	.L11	@cond_branch
	bl	sub_8060A94
	mov	r0, #0x0
	str	r0, [r4]
.L11:
	mov	r1, #0x8c
	lsl	r1, r1, #0x1
	add	r0, r6, r1
	ldr	r0, [r0]
	cmp	r0, #0
	beq	.L12	@cond_branch
	cmp	r7, #0x1a
	bgt	.L13	@cond_branch
	sub	r1, r7, #1
	b	.L14
.L16:
	.align	2, 0
.L15:
	.4byte	0x821dff0
	.4byte	0x8224868
.L13:
	mov	r1, #0x19
.L14:
	strh	r1, [r0, #0x18]
.L12:
	mov	r2, #0x8e
	lsl	r2, r2, #0x1
	add	r0, r6, r2
	ldr	r1, [r0]
	cmp	r1, #0
	beq	.L17	@cond_branch
	add	r0, r7, #0
	sub	r0, r0, #0x1a
	strh	r0, [r1, #0x18]
.L17:
	mov	r1, #0x95
	lsl	r1, r1, #0x1
	add	r0, r6, r1
	ldrh	r1, [r0]
	mov	r0, #0xbd
	lsl	r0, r0, #0x8
	cmp	r1, r0
	bls	.L18	@cond_branch
	mov	r2, #0x88
	lsl	r2, r2, #0x1
	add	r0, r6, r2
	ldr	r4, [r0]
	mov	r1, #0x8a
	lsl	r1, r1, #0x1
	add	r0, r6, r1
	ldr	r3, [r0]
	mov	r2, #0x0
	ldr	r0, .L21
	ldr	r0, [r0]
	lsr	r0, r0, #0x4
	mov	r1, #0x3
	and	r0, r0, r1
	cmp	r0, #0x1
	bhi	.L19	@cond_branch
	mov	r2, #0x1
.L19:
	strh	r2, [r3, #0x18]
	strh	r2, [r4, #0x18]
	b	.L25
.L22:
	.align	2, 0
.L21:
	.4byte	0x3000e30
.L18:
	ldr	r0, .L26
	cmp	r1, r0
	bhi	.L23	@cond_branch
	mov	r2, #0x88
	lsl	r2, r2, #0x1
	add	r0, r6, r2
	ldr	r3, [r0]
	mov	r1, #0x8a
	lsl	r1, r1, #0x1
	add	r0, r6, r1
	ldr	r2, [r0]
	ldr	r0, .L26 + 4
	ldr	r0, [r0]
	lsr	r0, r0, #0x4
	mov	r1, #0x3
	and	r0, r0, r1
	mov	r1, #0x0
	cmp	r0, #0x1
	bhi	.L24	@cond_branch
	mov	r1, #0x2
.L24:
	strh	r1, [r2, #0x18]
	strh	r1, [r3, #0x18]
	b	.L25
.L27:
	.align	2, 0
.L26:
	.4byte	0x2fff
	.4byte	0x3000e30
.L23:
	mov	r2, #0x88
	lsl	r2, r2, #0x1
	add	r0, r6, r2
	ldr	r0, [r0]
	mov	r1, #0x0
	strh	r1, [r0, #0x18]
	add	r2, r2, #0x4
	add	r0, r6, r2
	ldr	r0, [r0]
	strh	r1, [r0, #0x18]
.L25:
	mov	r1, #0x88
	lsl	r1, r1, #0x1
	add	r0, r6, r1
	ldr	r1, [r0]
	ldr	r5, [r1, #0xc]
	mov	r2, #0x98
	lsl	r2, r2, #0x1
	add	r0, r6, r2
	ldr	r0, [r0]
	sub	r0, r0, r5
	asr	r0, r0, #0x3
	add	r5, r5, r0
	sub	r2, r2, #0x1c
	add	r0, r6, r2
	ldr	r0, [r0]
	str	r5, [r0, #0xc]
	str	r5, [r1, #0xc]
	mov	r1, #0x8c
	lsl	r1, r1, #0x1
	add	r0, r6, r1
	ldr	r0, [r0]
	cmp	r0, #0
	beq	.L28	@cond_branch
	str	r5, [r0, #0xc]
.L28:
	mov	r2, #0x8e
	lsl	r2, r2, #0x1
	add	r0, r6, r2
	ldr	r0, [r0]
	cmp	r0, #0
	beq	.L29	@cond_branch
	str	r5, [r0, #0xc]
.L29:
	add	r4, r6, #0
	add	r4, r4, #0x60
	asr	r7, r5, #0x8
	add	r2, r7, #0
	add	r2, r2, #0x14
	lsl	r2, r2, #0x10
	asr	r2, r2, #0x10
	add	r0, r4, #0
	mov	r1, #0xa
	bl	sub_8061844
	mov	r0, #0x4
	bl	sub_8051780
	cmp	r0, #0
	bne	.L30	@cond_branch
	add	r0, r6, #0
	add	r0, r0, #0x90
	add	r2, r7, #4
	lsl	r2, r2, #0x10
	asr	r2, r2, #0x10
	mov	r1, #0xd0
	bl	sub_8061844
	mov	r1, #0x92
	lsl	r1, r1, #0x1
	add	r0, r6, r1
	ldr	r0, [r0]
	str	r5, [r0, #0xc]
.L30:
	ldr	r0, .L34
	ldr	r0, [r0]
	mov	r2, #0x8d
	lsl	r2, r2, #0x2
	add	r0, r0, r2
	ldr	r0, [r0]
	lsl	r5, r0, #0x4
	bl	sub_8051734
	ldr	r0, [r0, #0x4]
	cmp	r5, r0
	bge	.L31	@cond_branch
	bl	sub_8057C40
	asr	r0, r0, #0x4
	mov	r1, #0x7
	and	r0, r0, r1
	mov	r2, #0xf
	cmp	r0, #0x3
	bgt	.L33	@cond_branch
	mov	r2, #0xe
	b	.L33
.L35:
	.align	2, 0
.L34:
	.4byte	0x3000fb0
.L31:
	mov	r2, #0xf
.L33:
	add	r0, r4, #0
	add	r1, r5, #0
	bl	sub_8061C48
	add	sp, sp, #0x10
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
	thumb_func_end sub_804F05C

.align 2, 0 @ Don't pad with nop.
