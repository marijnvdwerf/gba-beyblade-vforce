	.include "asm/common.inc"

	thumb_func_start sub_805F47C
sub_805F47C:
	push	{r4, r5, r6, lr}
	add	r4, r0, #0
	mov	r1, #0x28
	ldsh	r0, [r4, r1]
	lsl	r0, r0, #0x3
	ldr	r1, [r4, #0x24]
	add	r6, r1, r0
	mov	r2, #0x3a
	ldsh	r1, [r4, r2]
	add	r0, r4, #0
	add	r0, r0, #0x44
	mov	r3, #0x0
	ldsh	r0, [r0, r3]
	add	r1, r1, r0
	ldr	r2, [r4]
	ldrh	r0, [r2, #0x1a]
	cmp	r0, #0
	bne	.L1	@cond_branch
	b	.L54
.L1:
	ldrh	r0, [r2, #0x18]
	cmp	r0, #0
	bne	.L3	@cond_branch
	b	.L54
.L3:
	ldrh	r0, [r4, #0x3c]
	strh	r0, [r4, #0x3e]
	lsl	r0, r0, #0x10
	cmp	r0, #0
	bne	.L7	@cond_branch
	mov	r0, #0x8
	ldrh	r2, [r4, #0x32]
	and	r0, r0, r2
	cmp	r0, #0
	bne	.L7	@cond_branch
	mov	r3, #0x28
	ldsh	r0, [r4, r3]
	cmp	r0, #0
	blt	.L7	@cond_branch
	add	r0, r4, #0
	add	r0, r0, #0x42
	ldrh	r2, [r0]
	add	r0, r4, #0
	add	r1, r2, #0
	bl	sub_805F784
	b	.L54
.L7:
	add	r2, r4, #0
	add	r2, r2, #0x40
	cmp	r1, #0
	ble	.L9	@cond_branch
	asr	r0, r1, #0x1
	ldrh	r1, [r2]
	add	r0, r1, r0
	strh	r0, [r2]
.L9:
	ldrh	r1, [r4, #0x32]
	mov	r0, #0x10
	and	r0, r0, r1
	cmp	r0, #0
	beq	.L10	@cond_branch
	mov	r0, #0x21
	NEG	r0, r0
	and	r0, r0, r1
	strh	r0, [r4, #0x32]
	ldrh	r1, [r4, #0x38]
	mov	r3, #0x38
	ldsh	r0, [r4, r3]
	cmp	r0, #0
	bge	.L11	@cond_branch
	NEG	r0, r1
	ldr	r3, .L13
	add	r1, r3, #0
	b	.L12
.L14:
	.align	2, 0
.L13:
	.4byte	0x3ff
.L11:
	ldr	r0, .L18
.L12:
	and	r0, r0, r1
	strh	r0, [r2]
	add	r0, r4, #0
	add	r0, r0, #0x58
	mov	r3, #0x0
	ldsh	r1, [r0, r3]
	add	r3, r0, #0
	cmp	r1, #0
	blt	.L15	@cond_branch
	mov	r1, #0x38
	ldsh	r0, [r4, r1]
	ldrh	r1, [r4, #0x38]
	cmp	r0, #0
	blt	.L16	@cond_branch
	b	.L20
.L19:
	.align	2, 0
.L18:
	.4byte	0x3ff
.L15:
	mov	r1, #0x38
	ldsh	r0, [r4, r1]
	ldrh	r1, [r4, #0x38]
	cmp	r0, #0
	blt	.L20	@cond_branch
	ldrh	r0, [r4, #0x2a]
	strh	r0, [r4, #0x2e]
	add	r0, r0, #0x1
	b	.L21
.L16:
	ldrh	r0, [r4, #0x2a]
	strh	r0, [r4, #0x2e]
	add	r0, r0, #0x2
.L21:
	strh	r0, [r4, #0x2c]
.L20:
	strh	r1, [r3]
.L10:
	ldrh	r3, [r2]
	mov	r0, #0x0
	ldsh	r1, [r2, r0]
	ldr	r0, .L27
	cmp	r1, r0
	bgt	.L22	@cond_branch
	b	.L54
.L22:
	ldr	r1, .L27 + 4
	add	r0, r3, r1
	mov	r1, #0x0
	strh	r0, [r2]
	ldrh	r0, [r4, #0x2c]
	strh	r0, [r4, #0x2e]
	mov	r0, #0x4
	ldrh	r3, [r4, #0x32]
	and	r0, r0, r3
	cmp	r0, #0
	beq	.L24	@cond_branch
	strh	r1, [r4, #0x3a]
	strh	r1, [r4, #0x38]
	add	r0, r4, #0
	add	r0, r0, #0x58
	strh	r1, [r0]
	strh	r1, [r2]
	mov	r0, #0x10
	ldrh	r1, [r4, #0x32]
	orr	r0, r0, r1
	strh	r0, [r4, #0x32]
.L24:
	ldrh	r1, [r4, #0x32]
	mov	r0, #0x2
	and	r0, r0, r1
	add	r2, r1, #0
	cmp	r0, #0
	beq	.L25	@cond_branch
	ldrh	r0, [r4, #0x2c]
	sub	r0, r0, #0x1
	b	.L26
.L28:
	.align	2, 0
.L27:
	.4byte	0x3ff
	.4byte	0xfffffc00
.L25:
	ldrh	r0, [r4, #0x2c]
	add	r0, r0, #0x1
.L26:
	strh	r0, [r4, #0x2c]
	mov	r3, #0x2c
	ldsh	r0, [r4, r3]
	mov	r3, #0x2a
	ldsh	r1, [r4, r3]
	sub	r0, r0, r1
	ldrh	r1, [r6, #0x2]
	cmp	r0, r1
	blt	.L41	@cond_branch
	mov	r0, #0x8
	and	r0, r0, r2
	cmp	r0, #0
	beq	.L30	@cond_branch
	mov	r0, #0x0
	strh	r0, [r4, #0x3a]
	ldrh	r2, [r4, #0x2a]
	ldrh	r3, [r6, #0x2]
	add	r0, r2, r3
	sub	r0, r0, #0x1
	strh	r0, [r4, #0x2c]
	mov	r0, #0x2c
	ldsh	r1, [r4, r0]
	add	r0, r4, #0
	bl	sub_805F3A8
	b	.L31
.L30:
	mov	r0, #0x1
	and	r0, r0, r2
	cmp	r0, #0
	beq	.L32	@cond_branch
	mov	r0, #0x2
	EOR	r0, r2
	strh	r0, [r4, #0x32]
	ldrh	r1, [r4, #0x2a]
	ldrh	r2, [r6, #0x2]
	add	r0, r1, r2
	sub	r0, r0, #0x2
	b	.L33
.L32:
	ldrh	r0, [r4, #0x2a]
.L33:
	strh	r0, [r4, #0x2c]
.L31:
	ldrh	r1, [r4, #0x3c]
	mov	r3, #0x3c
	ldsh	r0, [r4, r3]
	cmp	r0, #0
	beq	.L36	@cond_branch
	sub	r2, r1, #1
	strh	r2, [r4, #0x3c]
	lsl	r0, r2, #0x10
	asr	r0, r0, #0x10
	ldr	r1, .L45
	cmp	r0, r1
	bge	.L35	@cond_branch
	ldr	r1, .L45 + 4
	add	r0, r1, #0
	orr	r2, r2, r0
	strh	r2, [r4, #0x3c]
.L35:
	mov	r2, #0x3c
	ldsh	r0, [r4, r2]
	cmp	r0, #0
	beq	.L36	@cond_branch
	ldr	r5, [r4, #0x6c]
	cmp	r5, #0
	beq	.L37	@cond_branch
	ldr	r1, [r4, #0x70]
	mov	r3, #0x28
	ldsh	r2, [r4, r3]
	add	r0, r4, #0
	mov	r3, #0x2
	bl	call_via_r5
.L37:
	mov	r1, #0x3c
	ldsh	r0, [r4, r1]
	cmp	r0, #0
	bne	.L41	@cond_branch
.L36:
	mov	r0, #0x8
	ldrh	r2, [r4, #0x32]
	and	r0, r0, r2
	cmp	r0, #0
	bne	.L41	@cond_branch
	mov	r0, #0x1
	ldr	r5, [r4, #0x6c]
	cmp	r5, #0
	beq	.L40	@cond_branch
	ldr	r1, [r4, #0x70]
	mov	r3, #0x28
	ldsh	r2, [r4, r3]
	add	r0, r4, #0
	mov	r3, #0x1
	bl	call_via_r5
	lsl	r0, r0, #0x18
	lsr	r0, r0, #0x18
.L40:
	cmp	r0, #0
	beq	.L41	@cond_branch
	add	r0, r4, #0
	add	r0, r0, #0x42
	ldrh	r2, [r0]
	add	r0, r4, #0
	add	r1, r2, #0
	bl	sub_805F784
.L41:
	mov	r0, #0x2c
	ldsh	r1, [r4, r0]
	ldrh	r2, [r4, #0x2a]
	mov	r3, #0x2a
	ldsh	r0, [r4, r3]
	cmp	r1, r0
	bge	.L54	@cond_branch
	ldrh	r1, [r4, #0x32]
	mov	r0, #0x8
	and	r0, r0, r1
	cmp	r0, #0
	beq	.L43	@cond_branch
	mov	r0, #0x0
	strh	r0, [r4, #0x3a]
	mov	r0, #0x2c
	ldsh	r1, [r4, r0]
	add	r0, r4, #0
	bl	sub_805F3A8
	ldrh	r1, [r4, #0x2a]
	ldrh	r6, [r6, #0x2]
	add	r0, r1, r6
	b	.L44
.L46:
	.align	2, 0
.L45:
	.4byte	0xfffff448
	.4byte	0xffff
.L43:
	mov	r0, #0x1
	and	r0, r0, r1
	cmp	r0, #0
	beq	.L47	@cond_branch
	mov	r0, #0x2
	EOR	r0, r1
	strh	r0, [r4, #0x32]
	add	r0, r2, #1
	b	.L48
.L47:
	ldrh	r6, [r6, #0x2]
	add	r0, r6, r2
.L44:
	sub	r0, r0, #0x1
.L48:
	strh	r0, [r4, #0x2c]
	ldrh	r1, [r4, #0x3c]
	mov	r2, #0x3c
	ldsh	r0, [r4, r2]
	cmp	r0, #0
	beq	.L49	@cond_branch
	sub	r2, r1, #1
	strh	r2, [r4, #0x3c]
	lsl	r0, r2, #0x10
	asr	r0, r0, #0x10
	ldr	r1, .L55
	cmp	r0, r1
	bge	.L50	@cond_branch
	ldr	r3, .L55 + 4
	add	r0, r3, #0
	orr	r2, r2, r0
	strh	r2, [r4, #0x3c]
.L50:
	mov	r1, #0x3c
	ldsh	r0, [r4, r1]
	cmp	r0, #0
	bne	.L54	@cond_branch
.L49:
	mov	r0, #0x8
	ldrh	r2, [r4, #0x32]
	and	r0, r0, r2
	cmp	r0, #0
	bne	.L54	@cond_branch
	mov	r0, #0x1
	ldr	r5, [r4, #0x6c]
	cmp	r5, #0
	beq	.L53	@cond_branch
	ldr	r1, [r4, #0x70]
	mov	r3, #0x28
	ldsh	r2, [r4, r3]
	add	r0, r4, #0
	mov	r3, #0x1
	bl	call_via_r5
	lsl	r0, r0, #0x18
	lsr	r0, r0, #0x18
.L53:
	cmp	r0, #0
	beq	.L54	@cond_branch
	add	r0, r4, #0
	add	r0, r0, #0x42
	ldrh	r2, [r0]
	add	r0, r4, #0
	add	r1, r2, #0
	bl	sub_805F784
.L54:
	pop	{r4, r5, r6}
	pop	{r0}
	bx	r0
.L56:
	.align	2, 0
.L55:
	.4byte	0xfffff448
	.4byte	0xffff
	thumb_func_end sub_805F47C

.align 2, 0 @ Don't pad with nop.
