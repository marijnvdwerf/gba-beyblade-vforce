	.include "asm/common.inc"

	thumb_func_start printTime
printTime:
	push	{r4, r5, r6, r7, lr}
	mov	r7, sl
	mov	r6, r9
	mov	r5, r8
	push	{r5, r6, r7}
	add	sp, sp, #0xfffffffc
	mov	r9, r0
	add	r5, r1, #0
	lsl	r2, r2, #0x18
	lsr	r2, r2, #0x18
	mov	r8, r2
	mov	r0, r8
	str	r0, [sp]
	mov	r7, #0x1
	mov	r4, #0xfa
	lsl	r4, r4, #0x2
	add	r0, r5, #0
	add	r1, r4, #0
	bl	Div
	add	r6, r0, #0
	add	r0, r5, #0
	add	r1, r4, #0
	bl	Mod
	mov	r1, #0xa
	bl	sub_8066084
	add	r5, r0, #0
	mov	sl, r5
	add	r0, r6, #0
	mov	r1, #0x3c
	bl	Mod
	add	r4, r0, #0
	add	r0, r6, #0
	mov	r1, #0x3c
	bl	Div
	add	r1, r0, #0
	mov	r0, r9
	mov	r2, r8
	bl	showNumber
	and	r7, r7, r0
	ldr	r1, .L3
	mov	r0, r9
	mov	r2, r8
	bl	showString
	and	r7, r7, r0
	lsl	r0, r7, #0x18
	lsr	r7, r0, #0x18
	cmp	r4, #0x9
	bhi	.L1	@cond_branch
	ldr	r1, .L3 + 4
	mov	r0, r9
	mov	r2, r8
	bl	showString
	and	r7, r7, r0
.L1:
	mov	r0, r9
	add	r1, r4, #0
	mov	r2, r8
	bl	showNumber
	and	r7, r7, r0
	ldr	r1, .L3 + 8
	mov	r0, r9
	mov	r2, r8
	bl	showString
	and	r7, r7, r0
	lsl	r0, r7, #0x18
	lsr	r7, r0, #0x18
	cmp	r5, #0x9
	bhi	.L2	@cond_branch
	ldr	r1, .L3 + 4
	mov	r0, r9
	mov	r2, r8
	bl	showString
	and	r7, r7, r0
.L2:
	mov	r0, r9
	mov	r1, sl
	ldr	r2, [sp]
	bl	showNumber
	and	r7, r7, r0
	add	r0, r7, #0
	add	sp, sp, #0x4
	pop	{r3, r4, r5}
	mov	r8, r3
	mov	r9, r4
	mov	sl, r5
	pop	{r4, r5, r6, r7}
	pop	{r1}
	bx	r1
.L4:
	.align	2, 0
.L3:
	.4byte	0x8755b84
	.4byte	0x8755b88
	.4byte	0x8755b8c
	thumb_func_end printTime

.align 2, 0 @ Don't pad with nop.
