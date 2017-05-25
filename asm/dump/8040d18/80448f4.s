	.include "asm/common.inc"

	thumb_func_start sub_80448F4
sub_80448F4:
	push	{r4, r5, r6, r7, lr}
	mov	r7, r9
	mov	r6, r8
	push	{r6, r7}
	add	sp, sp, #0xfffffff0
	add	r7, r0, #0
	add	r4, r1, #0
	bl	isMultiplayer
	ldr	r1, .L8
	mov	r9, r1
	lsl	r0, r0, #0x10
	lsr	r0, r0, #0x10
	mov	r5, #0x1
	sub	r0, r5, r0
	lsl	r0, r0, #0x4
	ldr	r2, .L8 + 4
	add	r0, r0, r2
	ldr	r1, [r1]
	add	r0, r0, r1
	mov	r8, r0
	ldr	r3, .L8 + 8
	add	r6, r1, r3
	cmp	r4, #0x1
	bne	.L1	@cond_branch
	b	.L2
.L1:
	cmp	r4, #0x1
	bcc	.L3	@cond_branch
	cmp	r4, #0x2
	bne	.L4	@cond_branch
	b	.L5
.L4:
	cmp	r4, #0x7
	beq	.L6	@cond_branch
	b	.L50
.L9:
	.align	2, 0
.L8:
	.4byte	0x3000fb0
	.4byte	0x15d4
	.4byte	0x15c4
.L3:
	mov	r0, #0x0
	bl	allocSprite
	add	r4, r0, #0
	ldr	r0, .L17
	str	r4, [r0]
	cmp	r4, #0
	beq	.L10	@cond_branch
	ldr	r1, .L17 + 4
	ldr	r2, .L17 + 8
	mov	r3, #0xa8
	lsl	r3, r3, #0x7
	mov	r0, #0x0
	str	r0, [sp]
	str	r0, [sp, #0x4]
	str	r0, [sp, #0x8]
	str	r0, [sp, #0xc]
	add	r0, r4, #0
	bl	LoadSpriteSheet
.L10:
	mov	r0, #0x0
	bl	allocSprite
	add	r4, r0, #0
	ldr	r0, .L17 + 12
	str	r4, [r0]
	cmp	r4, #0
	beq	.L11	@cond_branch
	ldr	r1, .L17 + 4
	mov	r2, #0xc0
	lsl	r2, r2, #0x9
	mov	r3, #0xa8
	lsl	r3, r3, #0x7
	mov	r0, #0x0
	str	r0, [sp]
	str	r0, [sp, #0x4]
	str	r5, [sp, #0x8]
	str	r0, [sp, #0xc]
	add	r0, r4, #0
	bl	LoadSpriteSheet
.L11:
	ldr	r1, .L17 + 16
	mov	r0, #0x80
	lsl	r0, r0, #0x4
	str	r0, [r1]
	ldr	r1, .L17 + 20
	mov	r0, #0xd8
	lsl	r0, r0, #0x8
	str	r0, [r1]
	mov	r0, #0x96
	lsl	r0, r0, #0x3
	add	r4, r7, r0
	ldr	r1, .L17 + 24
	add	r0, r4, #0
	mov	r2, #0x0
	bl	newIconMenu
	mov	r1, #0x96
	lsl	r1, r1, #0x8
	add	r0, r4, #0
	bl	sub_8050FEC
	ldr	r1, .L17 + 28
	mov	r0, #0x0
	strb	r0, [r1]
	bl	sub_805FFE4
	lsl	r0, r0, #0x18
	cmp	r0, #0
	bne	.L12	@cond_branch
	b	.L50
.L12:
	bl	sub_8060070
	lsl	r0, r0, #0x18
	cmp	r0, #0
	bne	.L14	@cond_branch
	b	.L50
.L14:
	mov	r0, #0x10
	NEG	r0, r0
	ldrb	r1, [r6, #0x2]
	and	r0, r0, r1
	mov	r1, #0x8
	orr	r0, r0, r1
	mov	r1, #0xf
	and	r0, r0, r1
	strb	r0, [r6, #0x2]
	b	.L16
.L18:
	.align	2, 0
.L17:
	.4byte	0x30001f0
	.4byte	0x823bf04
	.4byte	0xffff0000
	.4byte	0x30001f4
	.4byte	0x30001f8
	.4byte	0x30001fc
	.4byte	0x8069108
	.4byte	0x3000200
.L6:
	mov	r2, #0x96
	lsl	r2, r2, #0x3
	add	r0, r7, r2
	bl	sub_8051028
	ldr	r0, .L24
	ldr	r0, [r0]
	cmp	r0, #0
	beq	.L19	@cond_branch
	bl	sub_8060A94
.L19:
	ldr	r0, .L24 + 4
	ldr	r0, [r0]
	cmp	r0, #0
	beq	.L20	@cond_branch
	bl	sub_8060A94
.L20:
	ldr	r0, .L24 + 8
	ldrb	r0, [r0]
	cmp	r0, #0
	bne	.L21	@cond_branch
	b	.L50
.L21:
	add	r0, r7, #0
	add	r0, r0, #0x7f
	mov	r2, #0x0
	strb	r2, [r0]
	mov	r3, r9
	ldr	r0, [r3]
	ldr	r4, .L24 + 12
	add	r1, r0, r4
	strb	r2, [r1]
	ldr	r3, .L24 + 16
	add	r1, r0, r3
	strb	r2, [r1]
	add	r4, r4, #0x2
	add	r0, r0, r4
	strb	r2, [r0]
	bl	sub_80600B4
	b	.L50
.L25:
	.align	2, 0
.L24:
	.4byte	0x30001f0
	.4byte	0x30001f4
	.4byte	0x3000200
	.4byte	0x1618
	.4byte	0x1619
.L2:
	ldr	r5, .L36
	ldr	r0, [r5]
	cmp	r0, #0
	beq	.L26	@cond_branch
	bl	sub_8057C40
	ldr	r5, [r5]
	ldr	r1, .L36 + 4
	ldr	r2, [r1]
	ldr	r3, [r5, #0x8]
	sub	r2, r2, r3
	asr	r2, r2, #0x3
	ldr	r4, .L36 + 8
	mov	r1, #0xff
	lsl	r1, r1, #0x1
	and	r1, r1, r0
	add	r1, r1, r4
	mov	r4, #0x0
	ldsh	r0, [r1, r4]
	add	r2, r2, r0
	add	r3, r3, r2
	str	r3, [r5, #0x8]
.L26:
	ldr	r5, .L36 + 12
	ldr	r0, [r5]
	cmp	r0, #0
	beq	.L27	@cond_branch
	bl	sub_8057C40
	ldr	r5, [r5]
	ldr	r1, .L36 + 16
	ldr	r2, [r1]
	ldr	r3, [r5, #0x8]
	sub	r2, r2, r3
	asr	r2, r2, #0x3
	ldr	r4, .L36 + 8
	mov	r1, #0xff
	lsl	r1, r1, #0x1
	and	r1, r1, r0
	add	r1, r1, r4
	mov	r4, #0x0
	ldsh	r0, [r1, r4]
	sub	r2, r2, r0
	add	r3, r3, r2
	str	r3, [r5, #0x8]
.L27:
	mov	r1, #0xa0
	lsl	r1, r1, #0x1
	add	r0, r7, r1
	bl	sub_80439A0
	mov	r2, #0x96
	lsl	r2, r2, #0x3
	add	r4, r7, r2
	add	r0, r4, #0
	bl	sub_8050C18
	bl	sub_805FFE4
	lsl	r0, r0, #0x18
	cmp	r0, #0
	bne	.L28	@cond_branch
	b	.L50
.L28:
	bl	sub_8060070
	lsl	r0, r0, #0x18
	cmp	r0, #0
	bne	.L30	@cond_branch
	b	.L50
.L30:
	bl	sub_8060040
	lsl	r0, r0, #0x18
	cmp	r0, #0
	beq	.L32	@cond_branch
	ldr	r5, .L36 + 20
	mov	r0, #0x20
	ldrh	r3, [r5]
	and	r0, r0, r3
	cmp	r0, #0
	beq	.L33	@cond_branch
	add	r0, r4, #0
	bl	sub_8050F0C
.L33:
	mov	r0, #0x10
	ldrh	r5, [r5]
	and	r0, r0, r5
	cmp	r0, #0
	beq	.L34	@cond_branch
	add	r0, r4, #0
	bl	sub_8050E80
.L34:
	ldr	r4, .L36 + 24
	add	r0, r7, r4
	ldr	r0, [r0]
	strb	r0, [r6, #0x4]
.L16:
	add	r0, r6, #0
	bl	sub_8043960
	b	.L50
.L37:
	.align	2, 0
.L36:
	.4byte	0x30001f0
	.4byte	0x30001f8
	.4byte	0x874cc3c
	.4byte	0x30001f4
	.4byte	0x30001fc
	.4byte	0x3005da0
	.4byte	0x4b4
.L32:
	mov	r0, r8
	mov	r1, #0x8
	bl	sub_8043970
	lsl	r0, r0, #0x18
	cmp	r0, #0
	beq	.L50	@cond_branch
	mov	r0, r8
	mov	r1, #0x4
	ldsb	r1, [r0, r1]
	ldr	r2, .L41
	add	r0, r7, r2
	ldr	r0, [r0]
	cmp	r1, r0
	beq	.L50	@cond_branch
	add	r0, r4, #0
	bl	sub_8050DF8
	b	.L50
.L42:
	.align	2, 0
.L41:
	.4byte	0x4b4
.L5:
	bl	sub_805FFE4
	lsl	r0, r0, #0x18
	cmp	r0, #0
	beq	.L50	@cond_branch
	bl	sub_8060070
	lsl	r0, r0, #0x18
	cmp	r0, #0
	beq	.L50	@cond_branch
	bl	sub_8060040
	lsl	r0, r0, #0x18
	cmp	r0, #0
	beq	.L46	@cond_branch
	ldr	r1, .L51
	add	r0, r5, #0
	ldrh	r1, [r1]
	and	r0, r0, r1
	cmp	r0, #0
	beq	.L46	@cond_branch
	mov	r0, #0xf
	ldrb	r3, [r6, #0x2]
	and	r0, r0, r3
	mov	r1, #0x10
	orr	r0, r0, r1
	strb	r0, [r6, #0x2]
	add	r0, r6, #0
	bl	sub_8043960
.L46:
	mov	r0, r8
	mov	r1, #0x8
	bl	sub_8043970
	lsl	r0, r0, #0x18
	cmp	r0, #0
	beq	.L50	@cond_branch
	mov	r0, #0xf0
	mov	r4, r8
	ldrb	r4, [r4, #0x2]
	and	r0, r0, r4
	cmp	r0, #0x10
	bne	.L50	@cond_branch
	mov	r0, #0xf
	ldrb	r1, [r6, #0x2]
	and	r0, r0, r1
	mov	r1, #0x10
	orr	r0, r0, r1
	strb	r0, [r6, #0x2]
	add	r0, r6, #0
	bl	sub_8043960
	ldr	r1, .L51 + 4
	ldr	r0, .L51 + 8
	str	r0, [r1]
	ldr	r1, .L51 + 12
	mov	r0, #0xf0
	lsl	r0, r0, #0x9
	str	r0, [r1]
	mov	r2, #0x96
	lsl	r2, r2, #0x3
	add	r0, r7, r2
	bl	sub_8050F98
	ldr	r3, .L51 + 16
	add	r0, r7, r3
	ldr	r0, [r0]
	cmp	r0, #0
	beq	.L49	@cond_branch
	ldr	r1, .L51 + 20
	mov	r0, #0x1
	strb	r0, [r1]
	mov	r0, #0xa
	bl	sub_80490F8
	b	.L50
.L52:
	.align	2, 0
.L51:
	.4byte	0x3005da0
	.4byte	0x30001f8
	.4byte	0xffff0000
	.4byte	0x30001fc
	.4byte	0x4b4
	.4byte	0x3000200
.L49:
	mov	r0, #0x1b
	bl	sub_80490F8
.L50:
	add	sp, sp, #0x10
	pop	{r3, r4}
	mov	r8, r3
	mov	r9, r4
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
	thumb_func_end sub_80448F4

.align 2, 0 @ Don't pad with nop.
