	.include "asm/common.inc"

	thumb_func_start sub_80658A4
sub_80658A4:
	push	{r4, r5, r6, r7, lr}
	mov	r7, r9
	mov	r6, r8
	push	{r6, r7}
	ldr	r2, .L1
	ldr	r1, .L1 + 4
	mov	r9, r1
	ldrh	r1, [r1]
	strh	r1, [r2]
	mov	r6, #0x0
	mov	r2, r9
	strh	r6, [r2]
	ldr	r3, .L1 + 8
	mov	r8, r3
	ldr	r5, [r3]
	strh	r6, [r5, #0x2]
	ldr	r3, .L1 + 12
	ldr	r4, .L1 + 16
	ldrb	r1, [r4]
	mov	r2, #0x8
	add	r7, r2, #0
	LSL	r7, r1
	add	r1, r7, #0
	strh	r1, [r3]
	sub	r3, r3, #0x2
	ldrb	r1, [r4]
	LSL	r2, r1
	ldrh	r1, [r3]
	orr	r1, r1, r2
	strh	r1, [r3]
	ldr	r1, .L1 + 20
	strb	r6, [r1]
	ldr	r2, .L1 + 24
	ldrh	r1, [r0]
	strh	r1, [r2]
	add	r0, r0, #0x2
	ldrh	r1, [r0]
	strh	r1, [r5]
	add	r1, r5, #2
	mov	r2, r8
	str	r1, [r2]
	ldrh	r0, [r0, #0x2]
	strh	r0, [r5, #0x2]
	str	r5, [r2]
	mov	r0, #0x1
	mov	r3, r9
	strh	r0, [r3]
	pop	{r3, r4}
	mov	r8, r3
	mov	r9, r4
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L2:
	.align	2, 0
.L1:
	.4byte	0x3000db4
	.4byte	0x4000208
	.4byte	0x3000db0
	.4byte	0x4000202
	.4byte	0x3000da8
	.4byte	0x3000dac
	.4byte	0x3000daa
	thumb_func_end sub_80658A4

.align 2, 0 @ Don't pad with nop.
