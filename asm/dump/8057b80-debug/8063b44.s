	.include "asm/common.inc"

	thumb_func_start sub_8063B44
sub_8063B44:
	push	{r4, r5, r6, r7, lr}
	add	r5, r0, #0
	add	r6, r5, #0
	add	r6, r6, #0xbf
	add	r0, r0, #0x1c
	ldrb	r1, [r6]
	add	r0, r1, r0
	ldrb	r1, [r0]
	mov	r7, #0x0
	cmp	r1, #0
	beq	.L1	@cond_branch
	ldr	r0, .L3
	add	r0, r1, r0
	ldrb	r4, [r0]
	add	r0, r5, #0
	add	r1, r4, #0
	bl	sub_8063AD8
	add	r2, r5, #0
	add	r2, r2, #0xac
	add	r1, r5, #0
	add	r1, r1, #0xc1
	ldr	r0, [r5, #0x8]
	add	r0, r0, r4
	ldrb	r1, [r1]
	ldrb	r0, [r0]
	sub	r1, r1, r0
	ldrb	r0, [r5, #0xd]
	add	r1, r0, r1
	lsl	r1, r1, #0x8
	ldr	r0, [r2]
	add	r0, r0, r1
	str	r0, [r2]
	ldrb	r0, [r6]
	add	r0, r0, #0x1
	strb	r0, [r6]
	add	r1, r5, #0
	add	r1, r1, #0xc0
	ldrb	r0, [r1]
	add	r0, r0, #0x1
	strb	r0, [r1]
	b	.L2
.L4:
	.align	2, 0
.L3:
	.4byte	0x807d980
.L1:
	mov	r7, #0x1
.L2:
	add	r0, r7, #0
	pop	{r4, r5, r6, r7}
	pop	{r1}
	bx	r1
	thumb_func_end sub_8063B44

.align 2, 0 @ Don't pad with nop.
