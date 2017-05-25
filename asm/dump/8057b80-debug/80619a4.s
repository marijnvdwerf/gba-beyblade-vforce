	.include "asm/common.inc"

	thumb_func_start sub_80619A4
sub_80619A4:
	push	{r4, r5, r6, r7, lr}
	mov	r7, r9
	mov	r6, r8
	push	{r6, r7}
	add	r7, r0, #0
	add	r4, r1, #0
	lsl	r2, r2, #0x18
	lsr	r6, r2, #0x18
	mov	r9, r6
	mov	r5, #0x1
	add	r0, r4, #0
	mov	r1, #0x3c
	bl	Mod
	mov	r8, r0
	add	r0, r4, #0
	mov	r1, #0x3c
	bl	Div
	add	r1, r0, #0
	add	r0, r7, #0
	add	r2, r6, #0
	bl	showNumber
	and	r5, r5, r0
	ldr	r1, .L2
	add	r0, r7, #0
	add	r2, r6, #0
	bl	showString
	and	r5, r5, r0
	lsl	r0, r5, #0x18
	lsr	r5, r0, #0x18
	mov	r0, r8
	cmp	r0, #0x9
	bhi	.L1	@cond_branch
	add	r0, r7, #0
	mov	r1, #0x0
	add	r2, r6, #0
	bl	showNumber
	and	r5, r5, r0
.L1:
	add	r0, r7, #0
	mov	r1, r8
	mov	r2, r9
	bl	showNumber
	and	r5, r5, r0
	add	r0, r5, #0
	pop	{r3, r4}
	mov	r8, r3
	mov	r9, r4
	pop	{r4, r5, r6, r7}
	pop	{r1}
	bx	r1
.L3:
	.align	2, 0
.L2:
	.4byte	0x8755b84
	thumb_func_end sub_80619A4

.align 2, 0 @ Don't pad with nop.
