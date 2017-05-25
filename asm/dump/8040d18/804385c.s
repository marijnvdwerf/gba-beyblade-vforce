	.include "asm/common.inc"

	thumb_func_start sub_804385C
sub_804385C:
	push	{r4, r5, r6, lr}
	add	r5, r0, #0
	ldr	r6, .L3
	mov	r0, #0x80
	lsl	r0, r0, #0x2
	ldrh	r1, [r6]
	and	r0, r0, r1
	cmp	r0, #0
	beq	.L1	@cond_branch
	ldr	r4, [r5, #0x4]
	ldr	r0, .L3 + 4
	add	r4, r4, r0
	ldr	r1, [r5]
	lsl	r1, r1, #0x8
	asr	r1, r1, #0x10
	asr	r4, r4, #0x8
	lsl	r2, r4, #0x10
	asr	r2, r2, #0x10
	add	r0, r5, #0
	bl	sub_8061844
	ldr	r0, .L3 + 8
	add	r1, r4, #0
	bl	printf
.L1:
	mov	r1, #0x80
	lsl	r1, r1, #0x1
	add	r0, r1, #0
	ldrh	r6, [r6]
	and	r0, r0, r6
	cmp	r0, #0
	beq	.L2	@cond_branch
	ldr	r4, [r5, #0x4]
	add	r4, r4, r1
	ldr	r1, [r5]
	lsl	r1, r1, #0x8
	asr	r1, r1, #0x10
	asr	r4, r4, #0x8
	lsl	r2, r4, #0x10
	asr	r2, r2, #0x10
	add	r0, r5, #0
	bl	sub_8061844
	ldr	r0, .L3 + 8
	add	r1, r4, #0
	bl	printf
.L2:
	pop	{r4, r5, r6}
	pop	{r0}
	bx	r0
.L4:
	.align	2, 0
.L3:
	.4byte	0x3005da0
	.4byte	0xffffff00
	.4byte	0x86fd2c0
	thumb_func_end sub_804385C

.align 2, 0 @ Don't pad with nop.
