	.include "asm/common.inc"

	thumb_func_start sub_8062990
sub_8062990:
	push	{r4, r5, lr}
	add	r3, r0, #0
	add	r2, r1, #0
	ldr	r0, .L4
	ldr	r4, [r0]
	ldr	r0, .L4 + 4
	ldrb	r1, [r0]
	sub	r1, r1, #0x1
	mov	r0, #0x1
	NEG	r0, r0
	cmp	r1, r0
	beq	.L1	@cond_branch
	ldr	r5, .L4 + 8
.L6:
	ldrb	r0, [r4, #0x16]
	cmp	r0, #0
	bne	.L2	@cond_branch
	add	r0, r4, #0
	add	r1, r3, #0
	bl	sub_8062950
	ldr	r0, [r5]
	str	r0, [r4, #0x18]
	add	r0, r0, #0x1
	str	r0, [r5]
	ldr	r0, [r4, #0x18]
	b	.L3
.L5:
	.align	2, 0
.L4:
	.4byte	0x3005e24
	.4byte	0x3005e04
	.4byte	0x3000d9c
.L2:
	add	r4, r4, #0x28
	sub	r1, r1, #0x1
	mov	r0, #0x1
	NEG	r0, r0
	cmp	r1, r0
	bne	.L6	@cond_branch
.L1:
	ldr	r0, .L7
	bl	printf
	mov	r0, #0x1
	NEG	r0, r0
.L3:
	pop	{r4, r5}
	pop	{r1}
	bx	r1
.L8:
	.align	2, 0
.L7:
	.4byte	0x8755dfc
	thumb_func_end sub_8062990

.align 2, 0 @ Don't pad with nop.
