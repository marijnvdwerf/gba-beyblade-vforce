	.include "asm/common.inc"

	thumb_func_start sub_8059AB8
sub_8059AB8:
	push	{r4, lr}
	ldr	r4, [sp, #0x8]
	lsl	r0, r0, #0x18
	lsr	r0, r0, #0x18
	lsl	r1, r1, #0x10
	lsr	r1, r1, #0x10
	lsl	r2, r2, #0x10
	lsr	r2, r2, #0x10
	lsl	r3, r3, #0x10
	lsr	r3, r3, #0x10
	lsl	r4, r4, #0x10
	lsr	r4, r4, #0x10
	cmp	r0, #0x2
	beq	.L1	@cond_branch
	cmp	r0, #0x3
	beq	.L2	@cond_branch
	b	.L3
.L1:
	ldr	r0, .L5
	b	.L4
.L6:
	.align	2, 0
.L5:
	.4byte	0x4000020
.L2:
	ldr	r0, .L7
.L4:
	strh	r1, [r0]
	add	r0, r0, #0x2
	strh	r2, [r0]
	add	r0, r0, #0x2
	strh	r3, [r0]
	add	r0, r0, #0x2
	strh	r4, [r0]
.L3:
	pop	{r4}
	pop	{r0}
	bx	r0
.L8:
	.align	2, 0
.L7:
	.4byte	0x4000030
	thumb_func_end sub_8059AB8

.align 2, 0 @ Don't pad with nop.
