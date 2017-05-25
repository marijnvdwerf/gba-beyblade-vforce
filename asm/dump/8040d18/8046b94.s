	.include "asm/common.inc"

	thumb_func_start sub_8046B94
sub_8046B94:
	push	{r4, r5, r6, r7, lr}
	add	r6, r0, #0
	cmp	r1, #0x1
	beq	.L1	@cond_branch
	cmp	r1, #0x1
	bcc	.L2	@cond_branch
	cmp	r1, #0x2
	beq	.L3	@cond_branch
	b	.L18
.L2:
	ldr	r0, .L7
	ldr	r1, .L7 + 4
	str	r1, [r0]
	ldr	r0, .L7 + 8
	mov	r4, #0x0
	str	r4, [r0]
	mov	r2, #0x94
	lsl	r2, r2, #0x2
	add	r0, r6, r2
	mov	r2, #0x0
	bl	sub_80596AC
	ldr	r0, .L7 + 12
	str	r4, [r0]
	bl	sub_804915C
	add	r1, r0, #0
	cmp	r1, #0xc
	bne	.L5	@cond_branch
	ldr	r0, .L7 + 16
	str	r1, [r0]
	b	.L18
.L8:
	.align	2, 0
.L7:
	.4byte	0x30004c8
	.4byte	0xffff0000
	.4byte	0x30004c4
	.4byte	0x30004cc
	.4byte	0x3000648
.L5:
	ldr	r1, .L10
	mov	r0, #0x15
	b	.L9
.L11:
	.align	2, 0
.L10:
	.4byte	0x3000648
.L1:
	ldr	r7, .L14
	ldr	r0, [r7]
	cmp	r0, #0x1
	bne	.L12	@cond_branch
	mov	r0, #0x0
	bl	sub_804A0E0
	add	r5, r0, #0
	ldr	r4, .L14 + 4
	bl	getLanguage
	lsl	r0, r0, #0x2
	add	r4, r4, #0x3c
	add	r0, r0, r4
	ldr	r1, [r0]
	add	r0, r5, #0
	mov	r2, #0xf
	bl	sub_8061660
.L12:
	mov	r1, #0xa0
	lsl	r1, r1, #0x1
	add	r0, r6, r1
	bl	sub_80439A0
	mov	r0, #0x0
	bl	sub_804A0E0
	ldr	r5, .L14 + 8
	ldr	r1, [r5]
	asr	r1, r1, #0x8
	NEG	r1, r1
	add	r1, r1, #0x10
	lsl	r1, r1, #0x10
	asr	r1, r1, #0x10
	mov	r2, #0x4a
	bl	sub_8061844
	ldr	r0, .L14 + 12
	ldr	r4, [r0]
	ldr	r0, [r5]
	sub	r4, r4, r0
	asr	r4, r4, #0x2
	mov	r2, #0x94
	lsl	r2, r2, #0x2
	add	r0, r6, r2
	add	r1, r4, #0
	mov	r2, #0x0
	bl	sub_80596AC
	ldr	r0, [r5]
	add	r0, r0, r4
	str	r0, [r5]
	ldr	r0, [r7]
	add	r0, r0, #0x1
	str	r0, [r7]
	b	.L18
.L15:
	.align	2, 0
.L14:
	.4byte	0x30004cc
	.4byte	0x806e0dc
	.4byte	0x30004c8
	.4byte	0x30004c4
.L3:
	ldr	r1, .L19
	mov	r0, #0x1
	ldrh	r1, [r1]
	and	r0, r0, r1
	cmp	r0, #0
	bne	.L16	@cond_branch
	ldr	r0, .L19 + 4
	ldr	r1, [r0]
	mov	r0, #0x96
	lsl	r0, r0, #0x2
	cmp	r1, r0
	ble	.L17	@cond_branch
.L16:
	mov	r0, #0x17
	bl	sub_80490F8
	ldr	r1, .L19 + 8
	ldr	r0, .L19 + 12
	str	r0, [r1]
.L17:
	ldr	r1, .L19
	mov	r0, #0x2
	ldrh	r1, [r1]
	and	r0, r0, r1
	cmp	r0, #0
	beq	.L18	@cond_branch
	bl	sub_8049178
	ldr	r1, .L19 + 8
	ldr	r0, .L19 + 12
.L9:
	str	r0, [r1]
.L18:
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L20:
	.align	2, 0
.L19:
	.4byte	0x3005da0
	.4byte	0x30004cc
	.4byte	0x30004c4
	.4byte	0xffff0000
	thumb_func_end sub_8046B94

.align 2, 0 @ Don't pad with nop.
