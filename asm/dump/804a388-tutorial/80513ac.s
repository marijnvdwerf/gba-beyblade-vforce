	.include "asm/common.inc"

	thumb_func_start sub_80513AC
sub_80513AC:
	push	{r4, r5, r6, r7, lr}
	mov	r7, r9
	mov	r6, r8
	push	{r6, r7}
	ldr	r5, .L2
	ldr	r4, [r5]
	ldr	r0, .L2 + 4
	add	r7, r4, r0
	mov	r1, #0x0
	mov	r8, r1
	mov	r9, r7
	ldr	r0, .L2 + 8
	str	r0, [r7]
	ldrb	r0, [r4]
	strb	r0, [r7, #0x4]
	ldr	r0, [r5]
	ldrb	r0, [r0, #0x1]
	strb	r0, [r7, #0x5]
	ldr	r0, [r5]
	ldrb	r0, [r0, #0x2]
	strb	r0, [r7, #0x6]
	ldr	r0, [r5]
	ldrb	r0, [r0, #0x3]
	strb	r0, [r7, #0x7]
	ldr	r0, [r5]
	ldr	r2, .L2 + 12
	add	r1, r0, r2
	ldrh	r2, [r1]
	ldr	r3, .L2 + 16
	add	r1, r4, r3
	strh	r2, [r1]
	ldr	r2, .L2 + 20
	add	r1, r0, r2
	ldrh	r2, [r1]
	add	r3, r3, #0x2
	add	r1, r4, r3
	strh	r2, [r1]
	ldr	r1, .L2 + 24
	add	r2, r4, r1
	add	r3, r3, #0x12
	add	r1, r0, r3
	ldr	r1, [r1]
	str	r1, [r2]
	ldr	r6, .L2 + 28
	add	r0, r0, #0x4
	ldr	r2, .L2 + 32
	add	r1, r4, r2
	mov	r2, #0xa8
	lsl	r2, r2, #0x3
	ldr	r3, [r6]
	bl	call_via_r3
	ldr	r0, [r5]
	ldr	r3, .L2 + 36
	add	r0, r0, r3
	ldr	r1, .L2 + 40
	add	r4, r4, r1
	ldr	r3, [r6]
	add	r1, r4, #0
	mov	r2, #0x10
	bl	call_via_r3
	mov	r1, #0xa7
	lsl	r1, r1, #0x1
	mov	r2, #0x1
	NEG	r2, r2
.L1:
	mov	r3, r9
	add	r3, r3, #0x4
	mov	r9, r3
	sub	r3, r3, #0x4
	ldmia	r3!, {r0}
	mov	r3, r8
	EOR	r3, r0
	mov	r8, r3
	sub	r1, r1, #0x1
	cmp	r1, r2
	bne	.L1	@cond_branch
	mov	r1, #0xac
	lsl	r1, r1, #0x3
	add	r0, r7, r1
	str	r3, [r0]
	pop	{r3, r4}
	mov	r8, r3
	mov	r9, r4
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L3:
	.align	2, 0
.L2:
	.4byte	0x3000f48
	.4byte	0x6fc
	.4byte	0xdead
	.4byte	0x6e4
	.4byte	0xc54
	.4byte	0x6e6
	.4byte	0xc58
	.4byte	0x807d974
	.4byte	0x704
	.4byte	0x594
	.4byte	0xc44
	thumb_func_end sub_80513AC

.align 2, 0 @ Don't pad with nop.
