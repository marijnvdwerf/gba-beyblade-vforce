	.include "asm/common.inc"

	thumb_func_start sub_80510FC
sub_80510FC:
	push	{r4, r5, r6, r7, lr}
	ldr	r3, .L3
	ldr	r0, [r3]
	mov	r2, #0x0
	strb	r2, [r0]
	ldr	r0, [r3]
	mov	r4, #0xdd
	lsl	r4, r4, #0x3
	add	r1, r0, r4
	strh	r2, [r1]
	ldr	r1, .L3 + 4
	add	r0, r0, r1
	mov	r1, #0x1
	strb	r1, [r0]
	ldr	r1, [r3]
	mov	r3, #0xd8
	lsl	r3, r3, #0x3
	add	r0, r1, r3
	str	r2, [r0]
	sub	r4, r4, #0x2c
	add	r0, r1, r4
	str	r2, [r0]
	ldr	r0, .L3 + 8
	add	r1, r1, r0
	ldr	r0, .L3 + 12
	strh	r0, [r1]
	mov	r5, #0x0
	ldr	r6, .L3 + 16
.L5:
	add	r0, r5, #0
	bl	sub_8051720
	add	r4, r0, #0
	mov	r0, #0xd0
	add	r1, r5, #0
	mul	r1, r1, r0
	ldr	r0, .L3 + 20
	add	r1, r1, r0
	str	r1, [r4, #0xc]
	ldr	r0, [r1, #0x4]
	str	r0, [r4, #0x4]
	ldr	r0, [r1, #0x8]
	str	r0, [r4, #0x8]
	cmp	r5, #0
	bgt	.L1	@cond_branch
	mov	r0, #0x6
	b	.L2
.L4:
	.align	2, 0
.L3:
	.4byte	0x3000f48
	.4byte	0x6ab
	.4byte	0x6ea
	.4byte	0xffff
	.4byte	0x807d970
	.4byte	0x8075b4c
.L1:
	mov	r0, #0x4
.L2:
	strh	r0, [r4]
	add	r1, r4, #0
	add	r1, r1, #0x10
	ldr	r3, [r6]
	mov	r0, #0x0
	mov	r2, #0x4
	bl	call_via_r3
	add	r1, r4, #0
	add	r1, r1, #0x14
	ldr	r3, [r6]
	mov	r0, #0x0
	mov	r2, #0x4
	bl	call_via_r3
	add	r5, r5, #0x1
	cmp	r5, #0x37
	ble	.L5	@cond_branch
	mov	r5, #0x0
	mov	r6, #0x0
	mov	r4, #0x0
	ldr	r7, .L8
.L6:
	add	r0, r5, #0
	bl	sub_80516E0
	add	r1, r4, r7
	str	r1, [r0, #0x4]
	strb	r6, [r0]
	strh	r6, [r0, #0x2]
	add	r4, r4, #0x50
	add	r5, r5, #0x1
	cmp	r5, #0x9
	ble	.L6	@cond_branch
	ldr	r5, .L8 + 4
	ldr	r0, .L8 + 8
	ldr	r4, .L8 + 12
	ldr	r1, [r4]
	ldr	r2, .L8 + 16
	add	r1, r1, r2
	ldr	r3, [r5]
	mov	r2, #0x40
	bl	call_via_r3
	ldr	r0, .L8 + 20
	ldr	r1, [r4]
	ldr	r3, .L8 + 24
	add	r1, r1, r3
	ldr	r3, [r5]
	mov	r2, #0x40
	bl	call_via_r3
	ldr	r0, .L8 + 28
	ldr	r1, [r4]
	ldr	r2, .L8 + 32
	add	r1, r1, r2
	ldr	r3, [r5]
	mov	r2, #0x40
	bl	call_via_r3
	ldr	r0, .L8 + 36
	ldr	r1, [r4]
	ldr	r3, .L8 + 40
	add	r1, r1, r3
	ldr	r3, [r5]
	mov	r2, #0x40
	bl	call_via_r3
	ldr	r0, [r4]
	ldr	r4, .L8 + 44
	add	r1, r0, r4
	mov	r2, #0x0
	strb	r2, [r1]
	mov	r3, #0xd5
	lsl	r3, r3, #0x3
	add	r1, r0, r3
	strb	r2, [r1]
	sub	r4, r4, #0x2
	add	r1, r0, r4
	strb	r2, [r1]
	sub	r3, r3, #0x2
	add	r1, r0, r3
	strb	r2, [r1]
	sub	r4, r4, #0x2
	add	r1, r0, r4
	strb	r2, [r1]
	ldr	r1, .L8 + 48
	add	r0, r0, r1
	strb	r2, [r0]
	mov	r5, #0x0
	ldr	r6, .L8 + 52
.L13:
	mov	r1, #0x0
	mov	r2, #0x0
	ldr	r0, .L8 + 52
	ldr	r0, [r0]
	add	r4, r5, #1
	b	.L7
.L9:
	.align	2, 0
.L8:
	.4byte	0x807582c
	.4byte	0x807d974
	.4byte	0x807572c
	.4byte	0x3000f48
	.4byte	0x5a4
	.4byte	0x807576c
	.4byte	0x5e4
	.4byte	0x80757ac
	.4byte	0x624
	.4byte	0x80757ec
	.4byte	0x664
	.4byte	0x6a9
	.4byte	0x6a4
	.4byte	0x80788cc
.L11:
	add	r2, r2, #0x1
	lsl	r0, r2, #0x2
	add	r0, r0, r6
	ldr	r0, [r0]
.L7:
	cmp	r0, #0
	blt	.L10	@cond_branch
	cmp	r0, r5
	bne	.L11	@cond_branch
	mov	r1, #0x1
.L10:
	cmp	r5, #0
	bge	.L12	@cond_branch
	mov	r1, #0x1
.L12:
	add	r0, r5, #0
	bl	sub_8057104
	add	r5, r4, #0
	cmp	r5, #0x6c
	ble	.L13	@cond_branch
	ldr	r0, .L14
	ldr	r0, [r0]
	ldr	r2, .L14 + 4
	add	r0, r0, r2
	mov	r1, #0x0
	strb	r1, [r0]
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L15:
	.align	2, 0
.L14:
	.4byte	0x3000fb0
	.4byte	0x1638
	thumb_func_end sub_80510FC

.align 2, 0 @ Don't pad with nop.
