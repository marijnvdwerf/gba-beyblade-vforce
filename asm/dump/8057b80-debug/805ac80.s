	.include "asm/common.inc"

	thumb_func_start sub_805AC80
sub_805AC80:
	push	{r4, r5, r6, r7, lr}
	mov	ip, r0
	add	r4, r1, #0
	add	r0, r0, #0x2f
	ldrb	r5, [r0]
	ldr	r0, [r4, #0x40]
	cmp	r0, #0
	beq	.L1	@cond_branch
	ldr	r0, [r4, #0x30]
	ldr	r6, .L4
	add	r3, r6, #0
	cmp	r0, #0
	beq	.L2	@cond_branch
	b	.L3
.L5:
	.align	2, 0
.L4:
	.4byte	0x3000d30
.L6:
	strb	r1, [r3]
	add	r0, r0, #0x1
	add	r3, r3, #0x1
.L3:
	ldrb	r1, [r0]
	cmp	r1, #0
	bne	.L6	@cond_branch
.L2:
	ldr	r0, [r4, #0x3c]
	mov	r1, #0x5
	and	r0, r0, r1
	cmp	r0, #0
	bne	.L7	@cond_branch
	mov	r0, ip
	ldr	r1, [r0, #0x24]
	mov	r0, #0x4c
	mul	r1, r1, r0
	mov	r2, ip
	ldr	r0, [r2, #0xc]
	add	r0, r0, r1
	cmp	r0, r4
	bne	.L8	@cond_branch
	mov	r0, ip
	add	r0, r0, #0x2e
	ldrb	r5, [r0]
.L8:
	mov	r0, #0x3a
	strb	r0, [r3]
	add	r3, r3, #0x1
	mov	r0, #0x20
	strb	r0, [r3]
	add	r3, r3, #0x1
.L7:
	ldr	r1, [r4, #0x34]
	ldr	r2, [r4, #0x40]
	lsl	r0, r1, #0x2
	add	r0, r0, r1
	lsl	r0, r0, #0x2
	add	r0, r0, r2
	mov	r7, ip
	ldrb	r7, [r7, #0x8]
	lsl	r1, r7, #0x2
	add	r0, r0, r1
	ldr	r0, [r0]
	b	.L9
.L10:
	strb	r1, [r3]
	add	r0, r0, #0x1
	add	r3, r3, #0x1
.L9:
	ldrb	r1, [r0]
	cmp	r1, #0
	bne	.L10	@cond_branch
	mov	r0, #0x0
	strb	r0, [r3]
	add	r0, r4, #0
	add	r1, r6, #0
	add	r2, r5, #0
	bl	sub_8061660
	b	.L12
.L1:
	ldr	r1, [r4, #0x30]
	cmp	r1, #0
	beq	.L12	@cond_branch
	add	r0, r4, #0
	add	r2, r5, #0
	bl	sub_8061660
.L12:
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
	thumb_func_end sub_805AC80

.align 2, 0 @ Don't pad with nop.
