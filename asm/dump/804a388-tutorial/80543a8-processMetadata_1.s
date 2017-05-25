	.include "asm/common.inc"

	thumb_func_start processMetadata_1
processMetadata_1:
	push	{r4, r5, lr}
	add	r5, r2, #0
	ldr	r4, [sp, #0xc]
	add	r0, r5, #0
	bl	GetStruct4
	add	r3, r0, #0
	ldr	r0, .L6
	ldr	r2, [r0]
	cmp	r2, #0
	beq	.L16	@cond_branch
	ldrh	r1, [r4, #0x4]
	ldr	r0, .L6 + 4
	cmp	r1, r0
	beq	.L2	@cond_branch
	cmp	r1, r0
	bgt	.L3	@cond_branch
	ldr	r0, .L6 + 8
	cmp	r1, r0
	beq	.L4	@cond_branch
	b	.L16
.L7:
	.align	2, 0
.L6:
	.4byte	0x3000c10
	.4byte	0x4ecb
	.4byte	0x2a39
.L3:
	ldr	r0, .L10
	cmp	r1, r0
	beq	.L8	@cond_branch
	b	.L16
.L11:
	.align	2, 0
.L10:
	.4byte	0x8cec
.L2:
	ldr	r0, [r4, #0x8]
	strh	r0, [r3, #0x3c]
	b	.L16
.L4:
	mov	r0, #0x82
	lsl	r0, r0, #0x2
	add	r1, r2, r0
	mov	r0, #0xc0
	lsl	r0, r0, #0x4
	str	r0, [r1]
	mov	r0, #0x0
	mov	r1, #0x0
	mov	r2, #0x0
	bl	sub_8055734
	mov	r0, #0xc
	bl	sub_804ABFC
	b	.L16
.L8:
	mov	r1, #0x80
	lsl	r1, r1, #0x13
	add	r0, r2, #0
	bl	RiderHasFlag
	lsl	r0, r0, #0x18
	cmp	r0, #0
	bne	.L16	@cond_branch
	mov	r0, #0x4
	bl	sub_8051780
	cmp	r0, #0
	bne	.L16	@cond_branch
	ldr	r0, .L17
	ldr	r0, [r0]
	ldr	r1, .L17 + 4
	add	r0, r0, r1
	ldrb	r0, [r0]
	cmp	r0, #0
	bne	.L16	@cond_branch
	add	r0, r5, #0
	bl	turorial_804A488
.L16:
	pop	{r4, r5}
	pop	{r0}
	bx	r0
.L18:
	.align	2, 0
.L17:
	.4byte	0x3000fb0
	.4byte	0x161b
	thumb_func_end processMetadata_1

.align 2, 0 @ Don't pad with nop.
