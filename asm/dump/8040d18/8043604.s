	.include "asm/common.inc"

	thumb_func_start sub_8043604
sub_8043604:
	push	{r4, r5, r6, r7, lr}
	mov	r7, r9
	mov	r6, r8
	push	{r6, r7}
	add	sp, sp, #0xfffffffc
	add	r6, r2, #0
	ldr	r7, .L2
	bl	sub_8048FCC
	add	r5, r0, #0
	mov	r0, #0xa5
	lsl	r0, r0, #0x3
	add	r0, r0, r5
	mov	r9, r0
	ldr	r1, .L2 + 4
	add	r4, r5, r1
	ldr	r0, .L2 + 8
	add	r0, r0, r5
	mov	r8, r0
	mov	r1, r9
	ldr	r0, [r1]
	cmp	r0, #0
	beq	.L1	@cond_branch
	add	r0, r4, #0
	bl	sub_8061204
	mov	r0, r8
	bl	sub_8050584
.L1:
	add	r0, r6, #0
	add	r1, r4, #0
	bl	sub_80622E8
	ldr	r0, [r6, #0x14]
	ldr	r2, [r0, #0xc]
	lsl	r2, r2, #0x8
	asr	r2, r2, #0x10
	add	r0, r4, #0
	mov	r1, #0x0
	bl	sub_8061844
	ldr	r1, [r6, #0x30]
	add	r0, r4, #0
	mov	r2, #0xf
	bl	sub_8061660
	mov	r0, #0xa8
	lsl	r0, r0, #0x3
	add	r1, r5, r0
	mov	r0, r8
	mov	r2, #0x0
	bl	newMotionGroup
	ldr	r1, [r7]
	ldr	r2, [r7, #0x4]
	ldr	r3, [r7, #0x8]
	ldr	r0, [r7, #0xc]
	str	r0, [sp]
	mov	r0, r8
	bl	sub_80504E4
	ldr	r1, [r7, #0x10]
	ldr	r2, [r7, #0x14]
	ldr	r3, [r7, #0x18]
	ldr	r0, [r7, #0x1c]
	str	r0, [sp]
	mov	r0, r8
	bl	sub_805052C
	mov	r0, #0x10
	mov	r1, r9
	str	r0, [r1]
	add	sp, sp, #0x4
	pop	{r3, r4}
	mov	r8, r3
	mov	r9, r4
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L3:
	.align	2, 0
.L2:
	.4byte	0x8068890
	.4byte	0x52c
	.4byte	0x55c
	thumb_func_end sub_8043604

.align 2, 0 @ Don't pad with nop.
