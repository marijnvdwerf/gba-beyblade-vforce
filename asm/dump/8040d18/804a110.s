	.include "asm/common.inc"

	thumb_func_start sub_804A110
sub_804A110:
	push	{r4, r5, r6, r7, lr}
	mov	r7, sl
	mov	r6, r9
	mov	r5, r8
	push	{r5, r6, r7}
	ldr	r1, .L804A194
	mov	r2, #0x8e
	lsl	r2, r2, #0x3
	add	r0, r1, r2
	ldr	r6, [r0]
	add	r0, r1, #0
	add	r0, r0, #0xb4
	ldr	r0, [r0]
	ldr	r0, [r0, #0x4]
	ldr	r2, [r0, #0x18]
	mov	r8, r2
	ldr	r7, [r0, #0x14]
	sub	r7, r7, #0x1
	mov	r0, #0x1
	neg	r0, r0
	cmp	r7, r0
	beq	.L804A1D6	@cond_branch
	mov	sl, r1
	mov	r0, #0x80
	add r0, sl
	mov	r9, r0
.L804A144:
	mov	r2, r8
	ldr	r0, .L804A194 + 4
	add r0, sl
	ldrb	r0, [r0]
	lsl	r0, r0, #0x18
	asr	r0, r0, #0x18
	cmp	r0, #0
	bgt	.L804A156	@cond_branch
	add	r2, r2, #0x4
.L804A156:
	mov	r1, #0x0
	ldsh	r0, [r2, r1]
	lsl	r0, r0, #0x8
	ldr	r1, [r6]
	sub	r3, r0, r1
	mov	r1, #0x2
	ldsh	r0, [r2, r1]
	lsl	r0, r0, #0x8
	ldr	r1, [r6, #0x4]
	sub	r4, r0, r1
	ldr	r0, .L804A194 + 8
	and	r3, r3, r0
	and	r4, r4, r0
	cmp	r3, #0
	bne	.L804A178	@cond_branch
	cmp	r4, #0
	beq	.L804A1C6	@cond_branch
.L804A178:
	mov	r0, #0x20
	mov	r2, r9
	ldrb	r2, [r2]
	and	r0, r0, r2
	cmp	r0, #0
	bne	.L804A1A0	@cond_branch
	add	r0, r3, #0
	mov	r1, #0x10
	bl	sub_80491E0
	lsl	r0, r0, #0x10
	asr	r5, r0, #0x10
	b	.L804A1A2
.L804A192:
	.align	2, 0
.L804A194:
	.4byte	_unk3000650
	.4byte	0x585
	.4byte	0xffffff00
.L804A1A0:
	mov	r5, #0x0
.L804A1A2:
	mov	r0, #0x10
	mov	r1, r9
	ldrb	r1, [r1]
	and	r0, r0, r1
	cmp	r0, #0
	bne	.L804A1BC	@cond_branch
	add	r0, r4, #0
	mov	r1, #0x10
	bl	sub_80491E0
	lsl	r0, r0, #0x10
	asr	r2, r0, #0x10
	b	.L804A1BE
.L804A1BC:
	mov	r2, #0x0
.L804A1BE:
	add	r0, r6, #0
	add	r1, r5, #0
	bl	sub_8061824
.L804A1C6:
	add	r6, r6, #0x30
	mov	r2, #0x2c
	add r8, r2
	sub	r7, r7, #0x1
	mov	r0, #0x1
	neg	r0, r0
	cmp	r7, r0
	bne	.L804A144	@cond_branch
.L804A1D6:
	pop	{r3, r4, r5}
	mov	r8, r3
	mov	r9, r4
	mov	sl, r5
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
	thumb_func_end sub_804A110

.align 2, 0 @ Don't pad with nop.
