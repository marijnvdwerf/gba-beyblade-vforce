	.include "asm/common.inc"

	thumb_func_start teletypeDefaultUserCodeHandler
teletypeDefaultUserCodeHandler:
	push	{r4, r5, r6, lr}
	add	r4, r0, #0
	mov	r0, #0xfe
	lsl	r0, r0, #0x17
	and	r0, r0, r1
	lsr	r2, r0, #0x18
	ldr	r6, .L4
	and	r6, r6, r1
	ldr	r0, .L4 + 4
	ldr	r5, [r0]
	cmp	r1, #0
	bge	.L1	@cond_branch
	NEG	r6, r6
.L1:
	add	r0, r2, #0
	sub	r0, r0, #0x41
	cmp	r0, #0x35
	bls	.L2	@cond_branch
	b	.L57
.L2:
	lsl	r0, r0, #0x2
	ldr	r1, .L4 + 8
	add	r0, r0, r1
	ldr	r0, [r0]
	mov	pc, r0
.L5:
	.align	2, 0
.L4:
	.4byte	0xffffff
	.4byte	0x3000ee8
	.4byte	.L6
.L6:
	.4byte	.L39
	.4byte	.L40
	.4byte	.L9
	.4byte	.L57
	.4byte	.L57
	.4byte	.L44
	.4byte	.L57
	.4byte	.L57
	.4byte	.L57
	.4byte	.L57
	.4byte	.L57
	.4byte	.L57
	.4byte	.L57
	.4byte	.L61
	.4byte	.L57
	.4byte	.L54
	.4byte	.L55
	.4byte	.L57
	.4byte	.L57
	.4byte	.L58
	.4byte	.L59
	.4byte	.L60
	.4byte	.L57
	.4byte	.L57
	.4byte	.L57
	.4byte	.L57
	.4byte	.L57
	.4byte	.L57
	.4byte	.L57
	.4byte	.L57
	.4byte	.L57
	.4byte	.L57
	.4byte	.L39
	.4byte	.L40
	.4byte	.L41
	.4byte	.L57
	.4byte	.L57
	.4byte	.L44
	.4byte	.L57
	.4byte	.L57
	.4byte	.L57
	.4byte	.L57
	.4byte	.L57
	.4byte	.L57
	.4byte	.L57
	.4byte	.L61
	.4byte	.L57
	.4byte	.L54
	.4byte	.L55
	.4byte	.L57
	.4byte	.L57
	.4byte	.L58
	.4byte	.L59
	.4byte	.L60
.L54:
	add	r0, r4, #0
	bl	sub_80640F8
	b	.L61
.L39:
	mov	r1, #0x0
	cmp	r2, #0x61
	bne	.L62	@cond_branch
	mov	r1, #0x1
.L62:
	add	r4, r1, #0
	add	r0, r6, #0
	bl	GetTalkingHead
	cmp	r4, #0
	beq	.L63	@cond_branch
	ldr	r2, [r0, #0x20]
	b	.L64
.L63:
	ldr	r2, [r0, #0x18]
.L64:
	cmp	r4, #0
	beq	.L65	@cond_branch
	ldr	r3, [r0, #0x24]
	b	.L66
.L65:
	ldr	r3, [r0, #0x1c]
.L66:
	add	r0, r5, #0
	add	r1, r4, #0
	bl	sub_8055C04
	add	r0, r5, #0
	add	r1, r4, #0
	bl	sub_8055C18
	lsl	r0, r0, #0x18
	cmp	r0, #0
	beq	.L67	@cond_branch
	add	r0, r5, #0
	add	r1, r4, #0
	bl	sub_8055B7C
	b	.L86
.L67:
	add	r0, r5, #0
	add	r1, r4, #0
	bl	sub_8055B64
	b	.L86
.L40:
	mov	r1, #0x0
	cmp	r2, #0x62
	bne	.L70	@cond_branch
	mov	r1, #0x1
.L70:
	add	r0, r5, #0
	bl	sub_8055B7C
	b	.L86
.L60:
	mov	r1, #0x0
	cmp	r2, #0x76
	bne	.L72	@cond_branch
	mov	r1, #0x1
.L72:
	add	r0, r5, #0
	add	r2, r6, #0
	bl	sub_8055BA0
	b	.L86
.L55:
	mov	r1, #0x0
	cmp	r2, #0x71
	bne	.L74	@cond_branch
	mov	r1, #0x1
.L74:
	add	r0, r5, #0
	mov	r2, #0x1
	bl	sub_8055BC0
	b	.L86
.L59:
	mov	r1, #0x0
	cmp	r2, #0x75
	bne	.L76	@cond_branch
	mov	r1, #0x1
.L76:
	add	r0, r5, #0
	mov	r2, #0x0
	bl	sub_8055BC0
	b	.L86
.L58:
	ldr	r2, .L79
	ldr	r0, [r2]
	mov	r1, #0x1
	orr	r0, r0, r1
	ldr	r1, .L79 + 4
	and	r0, r0, r1
	mov	r1, #0x3
	and	r6, r6, r1
	lsl	r1, r6, #0x8
	orr	r0, r0, r1
	str	r0, [r2]
	b	.L86
.L80:
	.align	2, 0
.L79:
	.4byte	0x3000eec
	.4byte	0xfffffcff
.L44:
	ldr	r3, .L82
	ldr	r0, [r3]
	mov	r1, #0x2
	orr	r0, r0, r1
	ldr	r1, .L82 + 4
	and	r0, r0, r1
	lsl	r1, r6, #0xa
	mov	r2, #0xf0
	lsl	r2, r2, #0x6
	and	r1, r1, r2
	orr	r0, r0, r1
	str	r0, [r3]
	b	.L86
.L83:
	.align	2, 0
.L82:
	.4byte	0x3000eec
	.4byte	0xffffc3ff
.L41:
	add	r0, r4, #0
	bl	sub_8064130
	b	.L86
.L9:
	lsl	r1, r6, #0x18
	lsr	r1, r1, #0x18
	add	r0, r4, #0
	bl	pushTeletypeStringPalette
	b	.L86
.L61:
	add	r0, r4, #0
	bl	sub_80640F8
	b	.L86
.L57:
	ldr	r0, .L87
	add	r1, r2, #0
	bl	printf
.L86:
	pop	{r4, r5, r6}
	pop	{r0}
	bx	r0
.L88:
	.align	2, 0
.L87:
	.4byte	0x86fcf58
	thumb_func_end teletypeDefaultUserCodeHandler

.align 2, 0 @ Don't pad with nop.
