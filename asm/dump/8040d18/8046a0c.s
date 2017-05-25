	.include "asm/common.inc"

	thumb_func_start sub_8046A0C
sub_8046A0C:
	push	{r4, r5, r6, r7, lr}
	add	r7, r0, #0
	add	r4, r1, #0
	cmp	r4, #0x1
	beq	.L1	@cond_branch
	cmp	r4, #0x1
	bcc	.L2	@cond_branch
	cmp	r4, #0x2
	bne	.L3	@cond_branch
	b	.L4
.L3:
	b	.L21
.L2:
	bl	sub_8049168
	ldr	r0, .L7
	ldr	r1, .L7 + 4
	str	r1, [r0]
	ldr	r0, .L7 + 8
	mov	r4, #0x0
	str	r4, [r0]
	mov	r2, #0x94
	lsl	r2, r2, #0x2
	add	r0, r7, r2
	mov	r2, #0x0
	bl	sub_80596AC
	ldr	r0, .L7 + 12
	strb	r4, [r0]
	ldr	r0, .L7 + 16
	strb	r4, [r0]
	ldr	r0, .L7 + 20
	str	r4, [r0]
	b	.L21
.L8:
	.align	2, 0
.L7:
	.4byte	0x30004b8
	.4byte	0xffff0000
	.4byte	0x30004b4
	.4byte	0x30004c0
	.4byte	0x30004c1
	.4byte	0x30004bc
.L1:
	mov	r1, #0xa0
	lsl	r1, r1, #0x1
	add	r0, r7, r1
	bl	sub_80439A0
	mov	r0, #0x0
	bl	sub_804A0E0
	ldr	r1, .L16
	ldr	r1, [r1]
	asr	r1, r1, #0x8
	NEG	r1, r1
	add	r1, r1, #0x10
	lsl	r1, r1, #0x10
	asr	r1, r1, #0x10
	mov	r2, #0x4a
	bl	sub_8061844
	ldr	r0, .L16 + 4
	ldrb	r0, [r0]
	cmp	r0, #0
	beq	.L10	@cond_branch
	ldr	r6, .L16 + 8
	ldrb	r0, [r6]
	cmp	r0, #0
	bne	.L10	@cond_branch
	bl	sub_80515A4
	lsl	r0, r0, #0x18
	lsr	r5, r0, #0x18
	cmp	r5, #0
	beq	.L11	@cond_branch
	mov	r0, #0x1
	bl	sub_8051640
.L11:
	strb	r4, [r6]
	mov	r0, #0x0
	bl	sub_804A0E0
	add	r4, r0, #0
	ldr	r6, .L16 + 12
	bl	getLanguage
	lsl	r0, r0, #0x2
	add	r1, r0, #0
	add	r1, r1, #0x28
	cmp	r5, #0
	beq	.L12	@cond_branch
	sub	r1, r1, #0x14
.L12:
	add	r0, r1, r6
	ldr	r1, [r0]
	add	r0, r4, #0
	mov	r2, #0xf
	bl	sub_8061660
.L10:
	ldr	r0, .L16 + 16
	ldr	r5, .L16
	ldr	r4, [r0]
	ldr	r0, [r5]
	sub	r4, r4, r0
	asr	r4, r4, #0x2
	mov	r2, #0x94
	lsl	r2, r2, #0x2
	add	r0, r7, r2
	add	r1, r4, #0
	mov	r2, #0x0
	bl	sub_80596AC
	ldr	r0, [r5]
	add	r0, r0, r4
	str	r0, [r5]
	cmp	r4, #0
	bne	.L14	@cond_branch
	ldr	r6, .L16 + 4
	ldrb	r0, [r6]
	cmp	r0, #0
	bne	.L14	@cond_branch
	mov	r0, #0x0
	bl	sub_804A0E0
	add	r5, r0, #0
	ldr	r4, .L16 + 12
	bl	getLanguage
	lsl	r0, r0, #0x2
	add	r0, r0, r4
	ldr	r1, [r0]
	add	r0, r5, #0
	mov	r2, #0xf
	bl	sub_8061660
	mov	r0, #0x1
	strb	r0, [r6]
.L14:
	ldr	r1, .L16 + 20
	ldr	r0, [r1]
	add	r0, r0, #0x1
	b	.L15
.L17:
	.align	2, 0
.L16:
	.4byte	0x30004b8
	.4byte	0x30004c1
	.4byte	0x30004c0
	.4byte	0x806e0dc
	.4byte	0x30004b4
	.4byte	0x30004bc
.L4:
	ldr	r0, .L22
	ldrb	r0, [r0]
	cmp	r0, #0
	beq	.L21	@cond_branch
	ldr	r1, .L22 + 4
	mov	r0, #0x1
	ldrh	r1, [r1]
	and	r0, r0, r1
	ldr	r1, .L22 + 8
	cmp	r0, #0
	beq	.L19	@cond_branch
	ldr	r0, [r1]
	cmp	r0, #0x78
	bgt	.L20	@cond_branch
.L19:
	ldr	r1, [r1]
	mov	r0, #0x96
	lsl	r0, r0, #0x2
	cmp	r1, r0
	ble	.L21	@cond_branch
.L20:
	ldr	r0, .L22 + 12
	ldr	r0, [r0]
	bl	sub_80490F8
	ldr	r1, .L22 + 16
	ldr	r0, .L22 + 20
.L15:
	str	r0, [r1]
.L21:
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L23:
	.align	2, 0
.L22:
	.4byte	0x30004c0
	.4byte	0x3005da0
	.4byte	0x30004bc
	.4byte	0x3000648
	.4byte	0x30004b4
	.4byte	0xffff0000
	thumb_func_end sub_8046A0C

.align 2, 0 @ Don't pad with nop.
