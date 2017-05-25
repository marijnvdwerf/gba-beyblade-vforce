	.include "asm/common.inc"

	thumb_func_start sub_8062C24
sub_8062C24:
	push	{r4, r5, r6, r7, lr}
	ldr	r0, .L9
	ldr	r0, [r0]
	cmp	r0, #0x1
	beq	.L1	@cond_branch
	b	.L63
.L1:
	ldr	r2, .L9 + 4
	ldr	r1, .L9 + 8
	ldr	r0, [r2]
	ldr	r1, [r1]
	sub	r0, r0, r1
	str	r0, [r2]
	cmp	r0, #0
	ble	.L64	@cond_branch
	b	.L63
.L64:
	ldr	r3, .L9 + 12
	ldr	r2, [r3]
	ldrb	r5, [r2]
	add	r2, r2, #0x1
	str	r2, [r3]
	mov	r0, #0x80
	and	r0, r0, r5
	add	r4, r3, #0
	cmp	r0, #0
	bne	.L5	@cond_branch
	b	.L6
.L5:
	lsr	r0, r5, #0x4
	sub	r0, r0, #0x8
	cmp	r0, #0x5
	bls	.L7	@cond_branch
	b	.L62
.L7:
	lsl	r0, r0, #0x2
	ldr	r1, .L9 + 16
	add	r0, r0, r1
	ldr	r0, [r0]
	mov	pc, r0
.L10:
	.align	2, 0
.L9:
	.4byte	0x3005e0c
	.4byte	0x3005e08
	.4byte	0x3005e10
	.4byte	0x3005e00
	.4byte	.L11
.L11:
	.4byte	.L12
	.4byte	.L13
	.4byte	.L62
	.4byte	.L15
	.4byte	.L16
	.4byte	.L43
.L12:
	ldr	r0, [r4]
	ldrb	r3, [r0]
	add	r0, r0, #0x2
	str	r0, [r4]
	ldr	r2, .L19
	mov	r0, #0xf
	and	r0, r0, r5
	lsl	r1, r0, #0x3
	add	r1, r1, r0
	lsl	r1, r1, #0x2
	ldr	r0, [r2]
	add	r0, r0, r1
	add	r4, r0, #4
	mov	r1, #0x4
	b	.L18
.L20:
	.align	2, 0
.L19:
	.4byte	0x3005e28
.L24:
	add	r4, r4, #0x8
.L18:
	add	r0, r1, #0
	sub	r1, r1, #0x1
	cmp	r0, #0
	bne	.L21	@cond_branch
	b	.L62
.L21:
	ldrb	r0, [r4]
	cmp	r0, #0
	beq	.L24	@cond_branch
	ldrb	r0, [r4, #0x1]
	cmp	r0, r3
	bne	.L24	@cond_branch
	ldr	r0, [r4, #0x4]
	bl	sub_8062A90
	mov	r0, #0x0
	strb	r0, [r4]
	b	.L62
.L13:
	ldr	r0, [r4]
	ldrb	r6, [r0]
	add	r0, r0, #0x1
	str	r0, [r4]
	ldrb	r7, [r0]
	add	r0, r0, #0x1
	str	r0, [r4]
	mov	r1, #0xf
	and	r1, r1, r5
	ldr	r3, .L39
	ldr	r2, [r3]
	lsl	r0, r1, #0x3
	add	r0, r0, r1
	lsl	r0, r0, #0x2
	add	r0, r0, r2
	ldr	r2, [r0]
	mov	ip, r3
	cmp	r2, #0
	bne	.L26	@cond_branch
	b	.L62
.L26:
	add	r4, r0, #4
	mov	r3, #0x0
	mov	r1, #0x3
	ldrb	r0, [r0, #0x4]
	cmp	r0, #0
	beq	.L33	@cond_branch
	ldrb	r0, [r4, #0x1]
	cmp	r0, r6
	bne	.L33	@cond_branch
	b	.L62
.L33:
	add	r4, r4, #0x8
	sub	r1, r1, #0x1
	mov	r0, #0x1
	NEG	r0, r0
	cmp	r1, r0
	beq	.L31	@cond_branch
	ldrb	r0, [r4]
	cmp	r0, #0
	beq	.L33	@cond_branch
	ldrb	r0, [r4, #0x1]
	cmp	r0, r6
	bne	.L33	@cond_branch
	mov	r3, #0x1
.L31:
	cmp	r3, #0
	beq	.L34	@cond_branch
	b	.L62
.L34:
	mov	r0, #0xf
	and	r0, r0, r5
	lsl	r1, r0, #0x3
	add	r1, r1, r0
	lsl	r1, r1, #0x2
	mov	r3, ip
	ldr	r0, [r3]
	add	r0, r0, r1
	add	r4, r0, #4
	mov	r1, #0x3
.L41:
	ldrb	r0, [r4]
	cmp	r0, #0
	bne	.L36	@cond_branch
	cmp	r2, #0
	beq	.L62	@cond_branch
	add	r0, r2, #0
	add	r1, r6, #0
	bl	sub_80629F0
	str	r0, [r4, #0x4]
	add	r1, r7, #0
	bl	sub_8062AD4
	mov	r0, #0x1
	strb	r0, [r4]
	strb	r6, [r4, #0x1]
	b	.L62
.L40:
	.align	2, 0
.L39:
	.4byte	0x3005e28
.L36:
	add	r4, r4, #0x8
	sub	r1, r1, #0x1
	mov	r0, #0x1
	NEG	r0, r0
	cmp	r1, r0
	bne	.L41	@cond_branch
	b	.L62
.L15:
	mov	r0, #0xf
	and	r0, r0, r5
	cmp	r0, #0x1
	beq	.L43	@cond_branch
	cmp	r0, #0x1
	bgt	.L44	@cond_branch
	cmp	r0, #0
	beq	.L45	@cond_branch
	b	.L62
.L44:
	cmp	r0, #0x2
	beq	.L47	@cond_branch
	cmp	r0, #0x3
	beq	.L48	@cond_branch
	b	.L62
.L45:
	ldr	r0, .L51
	ldr	r0, [r0]
	str	r0, [r4]
	b	.L62
.L52:
	.align	2, 0
.L51:
	.4byte	0x3005e20
.L47:
	ldr	r3, .L54
	ldr	r0, [r4]
	ldrb	r5, [r0]
	lsl	r2, r5, #0x18
	str	r2, [r3]
	add	r0, r0, #0x1
	str	r0, [r4]
	ldrb	r5, [r0]
	lsl	r1, r5, #0x10
	orr	r1, r1, r2
	str	r1, [r3]
	add	r2, r0, #1
	str	r2, [r4]
	ldrb	r0, [r0, #0x1]
	lsl	r0, r0, #0x8
	orr	r0, r0, r1
	str	r0, [r3]
	add	r1, r2, #1
	str	r1, [r4]
	ldrb	r2, [r2, #0x1]
	orr	r0, r0, r2
	str	r0, [r3]
	add	r1, r1, #0x1
	str	r1, [r4]
	b	.L62
.L55:
	.align	2, 0
.L54:
	.4byte	0x3005e10
.L48:
	ldr	r0, .L57
	bl	printf
	b	.L62
.L58:
	.align	2, 0
.L57:
	.4byte	0x8755e14
.L16:
	ldr	r0, [r4]
	ldrb	r3, [r0]
	add	r0, r0, #0x1
	str	r0, [r4]
	mov	r2, #0xf
	and	r2, r2, r5
	ldr	r0, .L60
	ldr	r0, [r0]
	lsl	r1, r2, #0x3
	add	r1, r1, r2
	lsl	r1, r1, #0x2
	add	r1, r1, r0
	ldr	r0, .L60 + 4
	ldr	r0, [r0]
	ldr	r0, [r0, #0xc]
	lsl	r3, r3, #0x2
	add	r3, r3, r0
	ldr	r0, [r3]
	str	r0, [r1]
	b	.L62
.L61:
	.align	2, 0
.L60:
	.4byte	0x3005e28
	.4byte	0x3005e14
.L43:
	ldr	r0, [r4]
	add	r0, r0, #0x1
	str	r0, [r4]
	b	.L62
.L6:
	lsl	r1, r5, #0x8
	ldrb	r0, [r2]
	orr	r1, r1, r0
	add	r0, r2, #1
	str	r0, [r3]
	ldr	r2, .L65
	lsl	r1, r1, #0x10
	ldr	r0, [r2]
	add	r0, r0, r1
	str	r0, [r2]
.L62:
	ldr	r0, .L65
	ldr	r0, [r0]
	cmp	r0, #0
	bgt	.L63	@cond_branch
	b	.L64
.L63:
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L66:
	.align	2, 0
.L65:
	.4byte	0x3005e08
	thumb_func_end sub_8062C24

.align 2, 0 @ Don't pad with nop.
