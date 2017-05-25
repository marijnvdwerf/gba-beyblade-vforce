	.include "asm/common.inc"

	thumb_func_start sub_8049458
sub_8049458:
	push	{r4, r5, r6, r7, lr}
	mov	r7, #0x0
	bl	sub_8049018
	bl	VBlankIntrWait
	ldr	r4, .L15
	add	r0, r4, #0
	bl	sub_804A280
	bl	sub_80627F0
	ldr	r1, .L15 + 4
	mov	r0, #0x1
	strb	r0, [r1]
	ldr	r0, .L15 + 8
	strb	r7, [r0]
	bl	sub_8049168
	ldr	r0, [r4, #0xc]
	bl	sub_80490F8
	ldr	r1, [r4]
	mov	r0, #0x1
	NEG	r0, r0
	cmp	r1, r0
	bne	.L14	@cond_branch
	ldr	r0, [r4, #0x4]
	cmp	r0, r1
	bne	.L14	@cond_branch
	b	.L13
.L14:
	bl	VBlankIntrWait
	bl	updateKeyState
	ldr	r4, .L15
	add	r0, r4, #0
	bl	sub_804A280
	bl	sub_80627F0
	bl	sub_80493C8
	ldr	r0, .L15 + 4
	ldrb	r1, [r0]
	mov	r0, #0x1
	bl	sub_80490CC
	ldr	r0, .L15 + 12
	ldr	r0, [r0]
	bl	call_via_r0
	ldr	r1, [r4]
	ldr	r0, [r4, #0x4]
	cmp	r1, r0
	beq	.L5	@cond_branch
	ldr	r0, .L15 + 16
	add	r1, r4, r0
	ldr	r2, .L15 + 20
	add	r0, r4, r2
	ldrb	r1, [r1]
	ldrb	r0, [r0]
	cmp	r1, r0
	bne	.L5	@cond_branch
	mov	r7, #0x0
	bl	sub_804967C
.L5:
	ldr	r5, .L15
	add	r6, r5, #0
	add	r6, r6, #0xb4
	ldr	r0, [r6]
	cmp	r0, #0
	beq	.L13	@cond_branch
	mov	r3, #0xb2
	lsl	r3, r3, #0x3
	add	r0, r5, r3
	bl	sub_8050A50
	ldr	r1, .L15 + 24
	add	r0, r5, r1
	mov	r2, #0x0
	ldsh	r0, [r0, r2]
	cmp	r0, #0
	beq	.L7	@cond_branch
	mov	r3, #0x8b
	lsl	r3, r3, #0x3
	add	r0, r5, r3
	bl	sub_805041C
.L7:
	ldr	r0, [r6]
	ldr	r0, [r0, #0x4]
	ldr	r0, [r0, #0x14]
	cmp	r0, #0
	beq	.L8	@cond_branch
	bl	sub_804A110
.L8:
	add	r0, r5, #0
	bl	sub_80434EC
	mov	r0, #0x4
	bl	sub_8049344
	ldr	r0, .L15 + 16
	add	r1, r5, r0
	ldr	r2, .L15 + 28
	add	r4, r5, r2
	ldrb	r3, [r1]
	ldrb	r2, [r4]
	add	r0, r3, r2
	strb	r0, [r1]
	bl	sub_8057930
	add	r1, r7, #0
	add	r7, r7, #0x1
	mov	r0, #0x8
	bl	sub_80490CC
	mov	r0, #0x0
	ldsb	r0, [r4, r0]
	cmp	r0, #0
	bne	.L9	@cond_branch
	ldr	r0, [r6]
	ldr	r0, [r0, #0x4]
	ldr	r0, [r0, #0x20]
	cmp	r0, #0
	beq	.L10	@cond_branch
	add	r0, r5, #0
	bl	sub_804374C
.L10:
	mov	r0, #0x2
	mov	r1, #0x0
	bl	sub_80490CC
.L9:
	ldr	r5, .L15
	ldr	r3, .L15 + 16
	add	r2, r5, r3
	ldr	r1, .L15 + 20
	add	r0, r5, r1
	ldrb	r1, [r0]
	ldrb	r3, [r2]
	cmp	r3, r1
	bne	.L11	@cond_branch
	mov	r4, #0x0
	strb	r1, [r2]
	mov	r0, #0x1
	bl	sub_8049344
	ldr	r1, .L15 + 28
	add	r0, r5, r1
	strb	r4, [r0]
.L11:
	ldr	r1, [r5]
	mov	r0, #0x1
	NEG	r0, r0
	cmp	r1, r0
	bne	.L14	@cond_branch
	ldr	r0, [r5, #0x4]
	cmp	r0, r1
	beq	.L13	@cond_branch
	b	.L14
.L13:
	ldr	r0, .L15
	bl	sub_804A280
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L16:
	.align	2, 0
.L15:
	.4byte	0x3000650
	.4byte	0x3000bfc
	.4byte	0x3000bfd
	.4byte	0x807d93c
	.4byte	0x584
	.4byte	0x586
	.4byte	0x464
	.4byte	0x585
	thumb_func_end sub_8049458

.align 2, 0 @ Don't pad with nop.
