	.include "asm/common.inc"

	thumb_func_start sub_804D048
sub_804D048:
	push	{r4, r5, r6, lr}
	add	r4, r0, #0
	mov	r1, #0x80
	lsl	r1, r1, #0x2
	add	r0, r4, r1
	ldr	r1, [r0]
	ldr	r6, .L5
	ldr	r0, [r6]
	ldr	r2, .L5 + 4
	add	r3, r0, r2
	ldr	r2, [r4]
	cmp	r1, #0
	beq	.L7	@cond_branch
	ldr	r0, [r1]
	lsl	r0, r0, #0x4
	ldr	r1, [r3, #0x4]
	add	r1, r1, r0
	ldr	r0, [r1]
	lsl	r0, r0, #0x5
	str	r0, [r2, #0x4]
	ldr	r0, [r1, #0x4]
	lsl	r0, r0, #0x5
	str	r0, [r2, #0x8]
	ldr	r0, [r1, #0x8]
	lsl	r0, r0, #0x5
	mov	r1, #0x80
	lsl	r1, r1, #0x8
	add	r0, r0, r1
	str	r0, [r2, #0xc]
	mov	r5, #0x0
	str	r5, [r2, #0x40]
	str	r5, [r2, #0x44]
	str	r5, [r2, #0x48]
	str	r5, [r4, #0x40]
	str	r5, [r4, #0x44]
	mov	r2, #0x82
	lsl	r2, r2, #0x2
	add	r1, r4, r2
	mov	r0, #0xc0
	lsl	r0, r0, #0x4
	str	r0, [r1]
	mov	r1, #0xfe
	lsl	r1, r1, #0x1
	add	r0, r4, r1
	str	r5, [r0]
	add	r2, r2, #0x2c
	add	r0, r4, r2
	str	r5, [r0]
	add	r0, r4, #0
	mov	r1, #0x1
	bl	sub_804C888
	ldr	r0, [r6]
	ldr	r1, .L5 + 8
	add	r0, r0, r1
	ldrb	r0, [r0]
	cmp	r0, #0
	beq	.L2	@cond_branch
	ldr	r0, .L5 + 12
	ldr	r0, [r0]
	ldr	r2, .L5 + 16
	add	r0, r0, r2
	ldrb	r0, [r0]
	cmp	r0, #0x2
	bne	.L3	@cond_branch
	mov	r1, #0x80
	lsl	r1, r1, #0xa
	add	r0, r4, #0
	bl	SetRiderFlag
	ldr	r0, [r6]
	mov	r1, #0xcb
	lsl	r1, r1, #0x3
	add	r0, r0, r1
	str	r5, [r0]
	b	.L7
.L6:
	.align	2, 0
.L5:
	.4byte	0x3000fb0
	.4byte	0x65c
	.4byte	0x1618
	.4byte	0x3000f48
	.4byte	0x6a4
.L3:
	bl	initGameloop2
	b	.L7
.L2:
	bl	initGameloop2
.L7:
	pop	{r4, r5, r6}
	pop	{r0}
	bx	r0
	thumb_func_end sub_804D048

.align 2, 0 @ Don't pad with nop.
