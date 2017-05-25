	.include "asm/common.inc"

	thumb_func_start sub_8062EFC
sub_8062EFC:
	push	{r4, r5, r6, lr}
	add	r6, r0, #0
	mov	r5, #0x0
	ldr	r2, .L6
	ldr	r0, [r2]
	ldr	r1, .L6 + 4
	cmp	r0, #0
	bne	.L1	@cond_branch
	ldr	r0, .L6 + 8
	ldr	r0, [r0]
	str	r0, [r2]
	ldr	r0, .L6 + 12
	str	r5, [r0]
	str	r5, [r1]
.L1:
	ldr	r0, [r1]
	cmp	r0, #0xff
	bgt	.L2	@cond_branch
	bl	sub_8062FA8
	add	r4, r0, #0
	ldr	r0, .L6 + 12
	ldr	r2, [r0]
	add	r1, r2, r6
	mov	r0, #0x80
	lsl	r0, r0, #0x1
	cmp	r1, r0
	ble	.L3	@cond_branch
	mov	r5, #0x1
	add	r0, r6, #0
	add	r1, r4, #0
	bl	sub_806306C
	add	r3, r0, #0
	cmp	r3, #0
	bge	.L4	@cond_branch
.L2:
	mov	r0, #0x0
	b	.L5
.L7:
	.align	2, 0
.L6:
	.4byte	0x3005e60
	.4byte	0x3005e5c
	.4byte	0x3005e54
	.4byte	0x3005e64
.L3:
	add	r3, r2, #0
	ldr	r0, .L10
	ldr	r0, [r0]
	cmp	r0, #0
	beq	.L8	@cond_branch
	str	r4, [r0, #0x10]
	str	r0, [r4, #0xc]
	b	.L9
.L11:
	.align	2, 0
.L10:
	.4byte	0x3005e58
.L8:
	str	r5, [r4, #0xc]
.L9:
	str	r5, [r4, #0x10]
.L4:
	ldr	r2, .L13
	mov	r0, #0xc4
	add	r1, r3, #0
	mul	r1, r1, r0
	ldr	r0, [r2]
	add	r0, r0, r1
	str	r0, [r4, #0x8]
	str	r6, [r4, #0x4]
	str	r3, [r4]
	ldr	r0, .L13 + 4
	str	r4, [r0]
	cmp	r5, #0
	bne	.L12	@cond_branch
	ldr	r1, .L13 + 8
	ldr	r0, [r1]
	add	r0, r0, r6
	str	r0, [r1]
.L12:
	add	r0, r4, #0
.L5:
	pop	{r4, r5, r6}
	pop	{r1}
	bx	r1
.L14:
	.align	2, 0
.L13:
	.4byte	0x3005e68
	.4byte	0x3005e58
	.4byte	0x3005e64
	thumb_func_end sub_8062EFC

.align 2, 0 @ Don't pad with nop.
