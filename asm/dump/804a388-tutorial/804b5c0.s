	.include "asm/common.inc"

	thumb_func_start sub_804B5C0
sub_804B5C0:
	push	{r4, r5, lr}
	mov	r4, #0x0
	ldr	r1, .L4
	ldr	r0, [r1]
	mov	r2, #0x86
	lsl	r2, r2, #0x3
	add	r0, r0, r2
	ldr	r0, [r0]
	add	r0, r0, #0x1
	cmp	r4, r0
	bge	.L1	@cond_branch
	ldr	r5, .L4 + 4
.L6:
	cmp	r4, #0
	beq	.L2	@cond_branch
	ldr	r0, [r1]
	ldr	r1, .L4 + 8
	add	r0, r0, r1
	ldr	r0, [r0]
	add	r0, r0, r5
	b	.L3
.L5:
	.align	2, 0
.L4:
	.4byte	0x3000fb0
	.4byte	0xfffffbd8
	.4byte	0x42c
.L2:
	ldr	r0, .L7
	ldr	r0, [r0]
.L3:
	bl	sub_804C098
	mov	r2, #0x85
	lsl	r2, r2, #0x3
	add	r5, r5, r2
	add	r4, r4, #0x1
	ldr	r1, .L7
	ldr	r0, [r1]
	add	r2, r2, #0x8
	add	r0, r0, r2
	ldr	r0, [r0]
	add	r0, r0, #0x1
	cmp	r4, r0
	blt	.L6	@cond_branch
.L1:
	pop	{r4, r5}
	pop	{r0}
	bx	r0
.L8:
	.align	2, 0
.L7:
	.4byte	0x3000fb0
	thumb_func_end sub_804B5C0

.align 2, 0 @ Don't pad with nop.
