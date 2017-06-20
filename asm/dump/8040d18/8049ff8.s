	.include "asm/common.inc"

	thumb_func_start sub_8049FF8
sub_8049FF8:
	push	{lr}
	add	r3, r0, #0
	mov	r2, #0x6
	cmp	r1, #0x2
	beq	.L1	@cond_branch
	cmp	r1, #0x2
	bhi	.L2	@cond_branch
	cmp	r1, #0x1
	beq	.L3	@cond_branch
	b	.L18
.L2:
	cmp	r1, #0x3
	beq	.L5	@cond_branch
	cmp	r1, #0x4
	beq	.L6	@cond_branch
	b	.L18
.L1:
	ldr	r0, .L9
	add	r1, r3, r0
	mov	r2, #0x0
	mov	r0, #0x40
	strb	r0, [r1]
	ldr	r0, .L9 + 4
	add	r1, r3, r0
	mov	r0, #0xfe
	strb	r0, [r1]
	ldr	r1, .L9 + 8
	add	r0, r3, r1
	strb	r2, [r0]
	b	.L18
.L10:
	.align	2, 0
.L9:
	.4byte	0x584
	.4byte	0x585
	.4byte	0x586
.L5:
	ldr	r2, .L12
	add	r1, r3, r2
	mov	r0, #0x0
	strb	r0, [r1]
	ldr	r0, .L12 + 4
	add	r1, r3, r0
	mov	r0, #0x2
	strb	r0, [r1]
	add	r2, r2, #0x2
	add	r1, r3, r2
	mov	r0, #0x40
	strb	r0, [r1]
	ldr	r1, .L12 + 8
	ldr	r3, .L12 + 12
	add	r0, r3, #0
	strh	r0, [r1]
	add	r1, r1, #0x2
	mov	r2, #0x80
	lsl	r2, r2, #0x5
	add	r0, r2, #0
	strh	r0, [r1]
	mov	r2, #0x80
	lsl	r2, r2, #0x13
	ldrh	r0, [r2]
	mov	r3, #0x80
	lsl	r3, r3, #0x2
	add	r1, r3, #0
	orr	r0, r0, r1
	strh	r0, [r2]
	b	.L18
.L13:
	.align	2, 0
.L12:
	.4byte	0x584
	.4byte	0x585
	.4byte	0x4000050
	.4byte	0xf42
.L6:
	ldr	r1, .L15
	add	r0, r3, r1
	mov	r1, #0x0
	ldsb	r1, [r0, r1]
	add	r0, r1, #0
	mul	r0, r0, r2
	asr	r2, r0, #0x6
	asr	r1, r1, #0x4
	mov	r0, #0x10
	sub	r0, r0, r1
	ldr	r1, .L15 + 4
	lsl	r0, r0, #0x8
	orr	r2, r2, r0
	strh	r2, [r1]
	b	.L18
.L16:
	.align	2, 0
.L15:
	.4byte	0x584
	.4byte	0x4000052
.L3:
	ldr	r2, .L19
	add	r3, r3, r2
	mov	r0, #0x0
	ldsb	r0, [r3, r0]
	cmp	r0, #0
	bne	.L17	@cond_branch
	mov	r2, #0x80
	lsl	r2, r2, #0x13
	ldrh	r1, [r2]
	ldr	r0, .L19 + 4
	and	r0, r0, r1
	strh	r0, [r2]
.L17:
	ldrb	r3, [r3]
	cmp	r3, #0x40
	bne	.L18	@cond_branch
	bl	Background_80498D8
.L18:
	pop	{r0}
	bx	r0
.L20:
	.align	2, 0
.L19:
	.4byte	0x584
	.4byte	0xfdff
	thumb_func_end sub_8049FF8

.align 2, 0 @ Don't pad with nop.
