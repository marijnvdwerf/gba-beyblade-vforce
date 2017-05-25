	.include "asm/common.inc"

	thumb_func_start sub_8051488
sub_8051488:
	push	{r4, r5, r6, lr}
	ldr	r5, .L3
	ldr	r6, [r5]
	ldr	r0, .L3 + 4
	add	r4, r6, r0
	bl	sub_8051558
	lsl	r0, r0, #0x18
	cmp	r0, #0
	bne	.L1	@cond_branch
	ldr	r0, .L3 + 8
	bl	printf
	b	.L2
.L4:
	.align	2, 0
.L3:
	.4byte	0x3000f48
	.4byte	0x6fc
	.4byte	0x87293f0
.L1:
	ldr	r1, [r5]
	ldrb	r0, [r4, #0x4]
	strb	r0, [r1]
	ldr	r1, [r5]
	ldrb	r0, [r4, #0x5]
	strb	r0, [r1, #0x1]
	ldr	r1, [r5]
	ldrb	r0, [r4, #0x6]
	strb	r0, [r1, #0x2]
	ldr	r1, [r5]
	ldrb	r0, [r4, #0x7]
	strb	r0, [r1, #0x3]
	ldr	r1, [r5]
	ldr	r2, .L5
	add	r0, r6, r2
	ldrh	r2, [r0]
	ldr	r4, .L5 + 4
	add	r0, r1, r4
	strh	r2, [r0]
	ldr	r3, .L5 + 8
	add	r0, r6, r3
	ldrh	r0, [r0]
	ldr	r3, .L5 + 12
	add	r2, r1, r3
	strh	r0, [r2]
	ldr	r0, .L5 + 16
	add	r1, r1, r0
	ldr	r3, .L5 + 20
	add	r0, r6, r3
	ldr	r0, [r0]
	str	r0, [r1]
	ldrh	r0, [r2]
	bl	sub_804AFD4
	ldr	r0, [r5]
	add	r0, r0, r4
	ldrh	r0, [r0]
	bl	sub_804B00C
	ldr	r4, .L5 + 24
	ldr	r1, .L5 + 28
	add	r0, r6, r1
	ldr	r1, [r5]
	add	r1, r1, #0x4
	mov	r2, #0xa8
	lsl	r2, r2, #0x3
	ldr	r3, [r4]
	bl	call_via_r3
	ldr	r2, .L5 + 32
	add	r0, r6, r2
	ldr	r1, [r5]
	ldr	r3, .L5 + 36
	add	r1, r1, r3
	ldr	r3, [r4]
	mov	r2, #0x10
	bl	call_via_r3
	mov	r0, #0x1
	bl	sub_8051640
.L2:
	pop	{r4, r5, r6}
	pop	{r0}
	bx	r0
.L6:
	.align	2, 0
.L5:
	.4byte	0xc54
	.4byte	0x6e4
	.4byte	0xc56
	.4byte	0x6e6
	.4byte	0xc68
	.4byte	0xc58
	.4byte	0x807d974
	.4byte	0x704
	.4byte	0xc44
	.4byte	0x594
	thumb_func_end sub_8051488

.align 2, 0 @ Don't pad with nop.
