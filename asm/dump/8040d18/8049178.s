	.include "asm/common.inc"

	thumb_func_start sub_8049178
sub_8049178:
	push	{r4, r5, lr}
	ldr	r4, .L2
	add	r5, r4, #0
	add	r5, r5, #0x7c
	ldrb	r0, [r5]
	cmp	r0, #0
	beq	.L1	@cond_branch
	mov	r0, #0x3
	bl	sub_8049344
	mov	r0, #0x3
	mov	r1, #0x1
	bl	sub_80490CC
	ldr	r1, .L2 + 4
	mov	r0, #0x1
	strb	r0, [r1]
	ldrb	r0, [r5]
	sub	r0, r0, #0x1
	strb	r0, [r5]
	lsl	r0, r0, #0x18
	lsr	r0, r0, #0x16
	add	r1, r4, #0
	add	r1, r1, #0x14
	add	r0, r0, r1
	ldr	r0, [r0]
	str	r0, [r4, #0x4]
	ldr	r0, [r4]
	str	r0, [r4, #0x8]
.L1:
	bl	sub_80495C4
	pop	{r4, r5}
	pop	{r0}
	bx	r0
.L3:
	.align	2, 0
.L2:
	.4byte	0x3000650
	.4byte	0x3000bfc
	thumb_func_end sub_8049178

.align 2, 0 @ Don't pad with nop.
