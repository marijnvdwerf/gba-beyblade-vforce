	.include "asm/common.inc"

	thumb_func_start sub_804EE54
sub_804EE54:
	push	{r4, r5, r6, r7, lr}
	add	sp, sp, #0xfffffffc
	ldr	r0, .L7
	ldr	r1, [r0]
	mov	r0, #0xf5
	lsl	r0, r0, #0x4
	add	r5, r1, r0
	add	r0, r0, #0xf0
	add	r2, r1, r0
	ldr	r0, [r2]
	cmp	r0, #0
	bne	.L1	@cond_branch
	b	.L4
.L1:
	sub	r0, r0, #0x1
	str	r0, [r2]
	cmp	r0, #0
	bne	.L3	@cond_branch
	b	.L4
.L3:
	ldr	r2, .L7 + 4
	add	r0, r1, r2
	ldrh	r0, [r0]
	sub	r0, r0, #0x1
	cmp	r0, #0x5
	bls	.L5	@cond_branch
	b	.L34
.L5:
	lsl	r0, r0, #0x2
	ldr	r1, .L7 + 8
	add	r0, r0, r1
	ldr	r0, [r0]
	mov	pc, r0
.L8:
	.align	2, 0
.L7:
	.4byte	0x3000fb0
	.4byte	0x105a
	.4byte	.L9
.L9:
	.4byte	.L10
	.4byte	.L11
	.4byte	.L28
	.4byte	.L28
	.4byte	.L14
	.4byte	.L15
.L10:
	add	r0, r5, #0
	add	r0, r0, #0xf0
	ldr	r0, [r0]
	cmp	r0, #0x20
	beq	.L16	@cond_branch
	b	.L34
.L16:
	add	r4, r5, #0
	add	r4, r4, #0xc0
	mov	r1, #0x80
	NEG	r1, r1
	mov	r0, #0x0
	str	r0, [sp]
	add	r0, r4, #0
	mov	r2, #0x0
	mov	r3, #0x18
	bl	sub_80504E4
	ldr	r2, .L21
	mov	r6, #0x80
	lsl	r6, r6, #0x1
	str	r6, [sp]
	add	r0, r4, #0
	mov	r1, #0x0
	mov	r3, #0x0
	bl	sub_805052C
	mov	r0, #0x4
	bl	sub_8051780
	cmp	r0, #0
	beq	.L18	@cond_branch
	b	.L34
.L18:
	add	r4, r4, #0x18
	mov	r3, #0x18
	NEG	r3, r3
	str	r0, [sp]
	add	r0, r4, #0
	mov	r1, #0x80
	mov	r2, #0x0
	bl	sub_80504E4
	str	r6, [sp]
	add	r0, r4, #0
	mov	r1, #0x0
	add	r2, r6, #0
	mov	r3, #0x0
	bl	sub_805052C
	b	.L34
.L22:
	.align	2, 0
.L21:
	.4byte	0xffffff00
.L15:
	add	r0, r5, #0
	add	r0, r0, #0xf0
	ldr	r0, [r0]
	mov	r7, #0xf8
	lsl	r7, r7, #0x7
	cmp	r0, #0x1f
	bgt	.L23	@cond_branch
	mov	r7, #0xc8
	lsl	r7, r7, #0x8
.L23:
	add	r6, r5, #0
	add	r6, r6, #0x30
	cmp	r0, #0x20
	bne	.L24	@cond_branch
	add	r4, r5, #0
	add	r4, r4, #0xc0
	mov	r1, #0x80
	NEG	r1, r1
	mov	r0, #0x0
	str	r0, [sp]
	add	r0, r4, #0
	mov	r2, #0x0
	mov	r3, #0x18
	bl	sub_80504E4
	ldr	r2, .L26
	mov	r0, #0x80
	lsl	r0, r0, #0x1
	str	r0, [sp]
	add	r0, r4, #0
	mov	r1, #0x0
	mov	r3, #0x0
	bl	sub_805052C
.L24:
	ldr	r1, [r5, #0x30]
	lsl	r1, r1, #0x8
	asr	r1, r1, #0x10
	ldr	r2, [r6, #0x4]
	sub	r0, r7, r2
	asr	r0, r0, #0x3
	add	r2, r2, r0
	lsl	r2, r2, #0x8
	asr	r2, r2, #0x10
	add	r0, r6, #0
	bl	sub_8061844
	b	.L34
.L27:
	.align	2, 0
.L26:
	.4byte	0xffffff00
.L11:
	bl	sub_8057C40
	asr	r1, r0, #0x4
	mov	r0, #0x7
	and	r1, r1, r0
	mov	r0, #0x3
	and	r0, r0, r1
	cmp	r0, #0
	bne	.L28	@cond_branch
	asr	r0, r1, #0x2
	mov	r1, #0xf
	cmp	r0, #0
	beq	.L29	@cond_branch
	mov	r1, #0xd
.L29:
	add	r0, r5, #0
	bl	sub_806185C
.L28:
	add	r0, r5, #0
	add	r0, r0, #0xf0
	ldr	r0, [r0]
	cmp	r0, #0x20
	bne	.L34	@cond_branch
	add	r4, r5, #0
	add	r4, r4, #0xc0
	str	r0, [sp]
	add	r0, r4, #0
	mov	r1, #0x0
	mov	r2, #0x30
	mov	r3, #0x0
	bl	sub_80504E4
	mov	r2, #0x80
	lsl	r2, r2, #0x1
	add	r0, r4, #0
	mov	r1, #0x0
	bl	sub_8050578
	b	.L34
.L14:
	bl	sub_8057C40
	asr	r1, r0, #0x4
	mov	r0, #0x7
	and	r1, r1, r0
	mov	r0, #0x3
	and	r0, r0, r1
	cmp	r0, #0
	bne	.L32	@cond_branch
	asr	r0, r1, #0x2
	mov	r1, #0xf
	cmp	r0, #0
	beq	.L33	@cond_branch
	mov	r1, #0xd
.L33:
	add	r0, r5, #0
	bl	sub_806185C
.L32:
	add	r0, r5, #0
	add	r0, r0, #0xf0
	ldr	r0, [r0]
	cmp	r0, #0x20
	bne	.L34	@cond_branch
	add	r4, r5, #0
	add	r4, r4, #0xc0
	str	r0, [sp]
	add	r0, r4, #0
	mov	r1, #0x0
	mov	r2, #0x30
	mov	r3, #0x0
	bl	sub_80504E4
	mov	r2, #0x80
	lsl	r2, r2, #0x1
	add	r0, r4, #0
	mov	r1, #0x0
	bl	sub_8050578
.L34:
	mov	r0, #0x87
	lsl	r0, r0, #0x1
	add	r4, r5, r0
	mov	r0, #0x2
	ldrh	r1, [r4]
	and	r0, r0, r1
	cmp	r0, #0
	beq	.L35	@cond_branch
	add	r0, r5, #0
	add	r0, r0, #0xc0
	bl	sub_805041C
.L35:
	mov	r0, #0x4
	ldrh	r4, [r4]
	and	r0, r0, r4
	cmp	r0, #0
	beq	.L37	@cond_branch
	add	r0, r5, #0
	add	r0, r0, #0xd8
	bl	sub_805041C
	b	.L37
.L4:
	bl	sub_804FD64
.L37:
	add	r0, r5, #0
	bl	sub_804F478
	add	r0, r5, #0
	bl	sub_804F05C
	add	r0, r5, #0
	bl	sub_804F2A0
	add	sp, sp, #0x4
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
	thumb_func_end sub_804EE54

.align 2, 0 @ Don't pad with nop.
