	.include "asm/common.inc"

	thumb_func_start sub_8053E18
sub_8053E18:
	push	{r4, r5, lr}
	lsl	r0, r0, #0x18
	lsr	r5, r0, #0x18
	ldr	r4, .L4
	ldr	r2, [r4]
	add	r0, r2, #0
	add	r0, r0, #0xb8
	ldr	r0, [r0]
	cmp	r0, #0
	bne	.L1	@cond_branch
	mov	r1, #0x80
	lsl	r1, r1, #0x3
	add	r0, r2, #0
	bl	SetRiderFlag
.L1:
	cmp	r5, #0
	beq	.L2	@cond_branch
	ldr	r1, [r4]
	ldr	r0, .L4 + 4
	add	r2, r1, r0
	mov	r0, #0x20
	strh	r0, [r2]
	ldr	r3, .L4 + 8
	add	r1, r1, r3
	mov	r0, #0x1
	strb	r0, [r1]
	b	.L13
.L5:
	.align	2, 0
.L4:
	.4byte	0x3000fb0
	.4byte	0xc6c
	.4byte	0x161b
.L2:
	ldr	r2, [r4]
	ldr	r0, .L10
	add	r1, r2, r0
	mov	r0, #0x8c
	lsl	r0, r0, #0x1
	strh	r0, [r1]
	ldr	r1, .L10 + 4
	add	r0, r2, r1
	ldrb	r0, [r0]
	cmp	r0, #0
	beq	.L6	@cond_branch
	ldr	r0, .L10 + 8
	ldr	r0, [r0]
	ldr	r3, .L10 + 12
	add	r0, r0, r3
	ldrb	r0, [r0]
	cmp	r0, #0x2
	bne	.L7	@cond_branch
	mov	r1, #0x80
	lsl	r1, r1, #0x14
	add	r0, r2, #0
	bl	RiderHasFlag
	lsl	r0, r0, #0x18
	cmp	r0, #0
	bne	.L13	@cond_branch
.L12:
	bl	sub_804FA40
	b	.L13
.L11:
	.align	2, 0
.L10:
	.4byte	0xc6c
	.4byte	0x1618
	.4byte	0x3000f48
	.4byte	0x6a4
.L7:
	mov	r1, #0x80
	lsl	r1, r1, #0x4
	add	r0, r2, #0
	bl	RiderHasFlag
	lsl	r0, r0, #0x18
	cmp	r0, #0
	bne	.L12	@cond_branch
	bl	sub_804FAD4
	b	.L13
.L6:
	bl	sub_804FA40
.L13:
	mov	r0, #0x1
	bl	sub_8051780
	cmp	r0, #0
	beq	.L14	@cond_branch
	ldr	r0, .L15
	ldr	r0, [r0]
	mov	r2, #0x0
	ldsb	r2, [r0, r2]
	ldr	r3, .L15 + 4
	add	r1, r0, r3
	mov	r3, #0x0
	strh	r2, [r1]
	mov	r1, #0xd8
	lsl	r1, r1, #0x3
	add	r0, r0, r1
	str	r3, [r0]
	bl	sub_805AAB4
.L14:
	pop	{r4, r5}
	pop	{r0}
	bx	r0
.L16:
	.align	2, 0
.L15:
	.4byte	0x3000f48
	.4byte	0x6c4
	thumb_func_end sub_8053E18

.align 2, 0 @ Don't pad with nop.
