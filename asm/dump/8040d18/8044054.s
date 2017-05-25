	.include "asm/common.inc"

	thumb_func_start sub_8044054
sub_8044054:
	push	{r4, r5, r6, r7, lr}
	mov	r7, r8
	push	{r7}
	add	r6, r0, #0
	add	r4, r1, #0
	bl	sub_8051734
	mov	r8, r0
	cmp	r4, #0x1
	beq	.L1	@cond_branch
	cmp	r4, #0x1
	bcc	.L2	@cond_branch
	cmp	r4, #0x2
	beq	.L3	@cond_branch
	b	.L24
.L2:
	ldr	r1, .L6
	mov	r0, #0x1
	str	r0, [r1]
	ldr	r0, .L6 + 4
	mov	r5, #0x0
	str	r5, [r0]
	ldr	r0, .L6 + 8
	strb	r5, [r0]
	mov	r0, #0x0
	bl	sub_804A0E0
	ldr	r4, .L6 + 12
	str	r0, [r4]
	mov	r0, #0x1
	bl	sub_804A0E0
	str	r0, [r4, #0x4]
	mov	r0, #0x2
	bl	sub_804A0E0
	str	r0, [r4, #0x8]
	mov	r0, #0x3
	bl	sub_804A0E0
	str	r0, [r4, #0xc]
	mov	r0, #0x4
	bl	sub_804A0E0
	str	r0, [r4, #0x10]
	mov	r0, #0x5
	bl	sub_804A0E0
	str	r0, [r4, #0x14]
	mov	r0, #0x6
	bl	sub_804A0E0
	str	r0, [r4, #0x18]
	mov	r0, #0x7
	bl	sub_804A0E0
	str	r0, [r4, #0x1c]
	mov	r0, #0x8
	bl	sub_804A0E0
	str	r0, [r4, #0x20]
	mov	r0, #0x9
	bl	sub_804A0E0
	str	r0, [r4, #0x24]
	ldr	r0, .L6 + 16
	mov	r1, #0x80
	lsl	r1, r1, #0x9
	str	r1, [r0]
	ldr	r0, .L6 + 20
	str	r5, [r0]
	mov	r2, #0x94
	lsl	r2, r2, #0x2
	add	r0, r6, r2
	NEG	r1, r1
	mov	r2, #0x0
	bl	sub_80596AC
	add	r1, r6, #0
	add	r1, r1, #0x80
	mov	r0, #0x30
	ldrb	r3, [r1]
	orr	r0, r0, r3
	strb	r0, [r1]
	bl	sub_8049168
	b	.L24
.L7:
	.align	2, 0
.L6:
	.4byte	0x3000174
	.4byte	0x3000178
	.4byte	0x30001a8
	.4byte	0x3000180
	.4byte	0x3000170
	.4byte	0x300016c
.L1:
	mov	r1, #0xa0
	lsl	r1, r1, #0x1
	add	r0, r6, r1
	bl	sub_80439A0
	ldr	r0, .L9
	ldr	r5, .L9 + 4
	ldr	r4, [r0]
	ldr	r0, [r5]
	sub	r4, r4, r0
	asr	r4, r4, #0x2
	mov	r2, #0x94
	lsl	r2, r2, #0x2
	add	r0, r6, r2
	NEG	r1, r4
	mov	r2, #0x0
	bl	sub_80596AC
	ldr	r2, [r5]
	add	r2, r2, r4
	str	r2, [r5]
	ldr	r0, .L9 + 8
	ldr	r1, .L9 + 12
	ldr	r1, [r1]
	ldr	r3, .L9 + 16
	add	r1, r1, r3
	bl	sub_8043F40
	b	.L24
.L10:
	.align	2, 0
.L9:
	.4byte	0x300016c
	.4byte	0x3000170
	.4byte	0x3000180
	.4byte	0x3000f48
	.4byte	0x6ec
.L3:
	ldr	r1, .L15
	mov	r0, #0x1
	ldrh	r1, [r1]
	and	r0, r0, r1
	cmp	r0, #0
	beq	.L17	@cond_branch
	ldr	r0, .L15 + 4
	ldrb	r0, [r0]
	cmp	r0, #0
	beq	.L12	@cond_branch
	mov	r0, #0x8
	bl	sub_804ABFC
	ldr	r0, .L15 + 8
	ldr	r0, [r0]
	ldr	r1, .L15 + 12
	add	r0, r0, r1
	mov	r2, #0x0
	ldsh	r0, [r0, r2]
	cmp	r0, #0
	blt	.L13	@cond_branch
	mov	r0, #0x26
	bl	sub_80490F8
	b	.L14
.L16:
	.align	2, 0
.L15:
	.4byte	0x3005da0
	.4byte	0x30001a8
	.4byte	0x3000f48
	.4byte	0x6ea
.L13:
	mov	r0, #0x15
	bl	sub_80490F8
.L14:
	ldr	r1, .L18
	mov	r0, #0x80
	lsl	r0, r0, #0x9
	str	r0, [r1]
	b	.L17
.L19:
	.align	2, 0
.L18:
	.4byte	0x300016c
.L12:
	ldr	r2, .L25
	ldr	r0, [r2]
	cmp	r0, #0x3f
	bhi	.L20	@cond_branch
	ldr	r0, .L25 + 4
	mov	r1, #0x20
	str	r1, [r0]
	mov	r0, #0x3f
	str	r0, [r2]
.L20:
	mov	r0, #0x8
	bl	sub_804ABFC
.L17:
	ldr	r7, .L25 + 8
	ldrb	r6, [r7]
	cmp	r6, #0
	bne	.L24	@cond_branch
	ldr	r0, .L25 + 12
	ldr	r1, .L25 + 16
	ldr	r2, [r1]
	ldr	r3, .L25 + 20
	add	r2, r2, r3
	ldr	r5, .L25
	ldr	r3, [r5]
	lsl	r3, r3, #0x8
	ldr	r4, .L25 + 4
	ldr	r1, [r4]
	orr	r3, r3, r1
	mov	r1, r8
	bl	sub_8043DB8
	ldr	r1, [r5]
	cmp	r1, #0x3f
	bhi	.L24	@cond_branch
	ldr	r0, [r4]
	add	r0, r0, #0x1
	str	r0, [r4]
	cmp	r0, #0x20
	bls	.L24	@cond_branch
	str	r6, [r4]
	lsl	r0, r1, #0x1
	str	r0, [r5]
	cmp	r0, #0x3f
	bls	.L24	@cond_branch
	mov	r0, #0x1
	strb	r0, [r7]
.L24:
	pop	{r3}
	mov	r8, r3
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L26:
	.align	2, 0
.L25:
	.4byte	0x3000174
	.4byte	0x3000178
	.4byte	0x30001a8
	.4byte	0x3000180
	.4byte	0x3000f48
	.4byte	0x6ec
	thumb_func_end sub_8044054

.align 2, 0 @ Don't pad with nop.
