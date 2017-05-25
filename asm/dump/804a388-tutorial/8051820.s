	.include "asm/common.inc"

	thumb_func_start sub_8051820
sub_8051820:
	push	{lr}
	mov	r0, #0x4
	bl	sub_8051780
	cmp	r0, #0
	bne	.L1	@cond_branch
	ldr	r0, .L4
	ldr	r0, [r0]
	ldr	r1, .L4 + 4
	add	r0, r0, r1
	ldr	r0, [r0]
	mov	r1, #0x4
	and	r0, r0, r1
	cmp	r0, #0
	beq	.L2	@cond_branch
.L1:
	ldr	r0, .L4
	ldr	r0, [r0]
	ldrb	r0, [r0, #0x2]
	b	.L3
.L5:
	.align	2, 0
.L4:
	.4byte	0x3000f48
	.4byte	0xc64
.L2:
	bl	getLevelDescription2
	add	r0, r0, #0x90
	ldr	r0, [r0]
.L3:
	pop	{r1}
	bx	r1
	thumb_func_end sub_8051820

.align 2, 0 @ Don't pad with nop.
