	.include "asm/common.inc"

	thumb_func_start sub_8049FF8
sub_8049FF8:
	push	{lr}
	add	r3, r0, #0
	mov	r2, #0x6
	cmp	r1, #0x2
	beq	.L804A016	@cond_branch
	cmp	r1, #0x2
	bhi	.L804A00C	@cond_branch
	cmp	r1, #0x1
	beq	.L804A0B0	@cond_branch
	b	.L804A0D2
.L804A00C:
	cmp	r1, #0x3
	beq	.L804A03C	@cond_branch
	cmp	r1, #0x4
	beq	.L804A088	@cond_branch
	b	.L804A0D2
.L804A016:
	ldr	r0, .L804A030
	add	r1, r3, r0
	mov	r2, #0x0
	mov	r0, #0x40
	strb	r0, [r1]
	ldr	r0, .L804A030 + 4
	add	r1, r3, r0
	mov	r0, #0xfe
	strb	r0, [r1]
	ldr	r1, .L804A030 + 8
	add	r0, r3, r1
	strb	r2, [r0]
	b	.L804A0D2
.L804A030:
	.align	2, 0

	.4byte	0x584
	.4byte	0x585
	.4byte	0x586
.L804A03C:
	ldr	r2, .L804A078
	add	r1, r3, r2
	mov	r0, #0x0
	strb	r0, [r1]
	ldr	r0, .L804A078 + 4
	add	r1, r3, r0
	mov	r0, #0x2
	strb	r0, [r1]
	add	r2, r2, #0x2
	add	r1, r3, r2
	mov	r0, #0x40
	strb	r0, [r1]
	ldr	r1, .L804A078 + 8
	ldr	r3, .L804A078 + 12
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
	b	.L804A0D2
.L804A078:
	.align	2, 0

	.4byte	0x584
	.4byte	0x585
	.4byte	0x4000050
	.4byte	0xf42
.L804A088:
	ldr	r1, .L804A0A8
	add	r0, r3, r1
	mov	r1, #0x0
	ldsb	r1, [r0, r1]
	add	r0, r1, #0
	mul	r0, r0, r2
	asr	r2, r0, #0x6
	asr	r1, r1, #0x4
	mov	r0, #0x10
	sub	r0, r0, r1
	ldr	r1, .L804A0A8 + 4
	lsl	r0, r0, #0x8
	orr	r2, r2, r0
	strh	r2, [r1]
	b	.L804A0D2
.L804A0A6:
	.align	2, 0
.L804A0A8:
	.4byte	0x584
	.4byte	0x4000052
.L804A0B0:
	ldr	r2, .L804A0D8
	add	r3, r3, r2
	mov	r0, #0x0
	ldsb	r0, [r3, r0]
	cmp	r0, #0
	bne	.L804A0C8	@cond_branch
	mov	r2, #0x80
	lsl	r2, r2, #0x13
	ldrh	r1, [r2]
	ldr	r0, .L804A0D8 + 4
	and	r0, r0, r1
	strh	r0, [r2]
.L804A0C8:
	ldrb	r3, [r3]
	cmp	r3, #0x40
	bne	.L804A0D2	@cond_branch
	bl	Background_80498D8
.L804A0D2:
	pop	{r0}
	bx	r0
.L804A0D6:
	.align	2, 0
.L804A0D8:
	.4byte	0x584
	.4byte	0xfdff
	thumb_func_end sub_8049FF8

.align 2, 0 @ Don't pad with nop.
