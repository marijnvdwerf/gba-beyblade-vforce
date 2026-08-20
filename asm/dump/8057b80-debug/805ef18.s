	.include "asm/common.inc"

	thumb_func_start sub_805EF18
sub_805EF18:
	push	{r4, r5, r6, r7, lr}
	mov	r7, sl
	mov	r6, r9
	mov	r5, r8
	push	{r5, r6, r7}
	add	sp, sp, #0xfffffff4
	add	r4, r0, #0
	str	r1, [sp, #0x8]
	mov	r8, r2
	mov	sl, r3
	ldr	r5, [sp, #0x2c]
	ldr	r6, [sp, #0x34]
	mov	r1, #0xda
	lsl	r1, r1, #0x2
	add	r0, r4, r1
	ldr	r1, [r0]
	cmp	r1, #0
	beq	.L805EF86	@cond_branch
	mov	r2, #0xd9
	lsl	r2, r2, #0x2
	add	r0, r4, r2
	ldr	r2, [r0]
	cmp	r2, #0
	beq	.L805EF86	@cond_branch
	ldr	r0, [sp, #0x30]
	lsl	r0, r0, #0x2
	add	r1, r0, r1
	ldr	r1, [r1]
	mov	r9, r1
	add	r0, r0, r2
	ldr	r7, [r0]
	cmp	r1, #0
	beq	.L805EF86	@cond_branch
	cmp	r7, #0
	beq	.L805EF86	@cond_branch
	b	.L805EF7E
.L805EF60:
	str	r6, [sp]
	str	r7, [sp, #0x4]
	ldr	r0, .L805EF98
	ldr	r4, [r0]
	mov	r0, r9
	ldr	r1, [sp, #0x8]
	mov	r2, r8
	mov	r3, sl
	bl	_call_via_r4
	mov	r1, #0x1
	ADD r8, r1
	mov	r2, sl
	lsl	r0, r2, #0x5
	add	r6, r6, r0
.L805EF7E:
	add	r0, r5, #0
	sub	r5, r5, #0x1
	cmp	r0, #0
	bne	.L805EF60	@cond_branch
.L805EF86:
	add	sp, sp, #0xc
	pop	{r3, r4, r5}
	mov	r8, r3
	mov	r9, r4
	mov	sl, r5
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L805EF96:
	.align	2, 0
.L805EF98:
	.4byte	__sub_87576D8
	thumb_func_end sub_805EF18

.align 2, 0 @ Don't pad with nop.
