	.include "asm/common.inc"

	thumb_func_start sub_8061BA0
sub_8061BA0:
	push	{r4, r5, r6, lr}
	mov	r6, sl
	mov	r5, r9
	mov	r4, r8
	push	{r4, r5, r6}
	mov	sl, r0
	add	r6, r1, #0
	lsl	r2, r2, #0x18
	mov	r8, r2
	mov	r0, r8
	lsr	r0, r0, #0x18
	mov	r8, r0
	mov	r4, #0x1
	mov	r5, #0xfa
	lsl	r5, r5, #0x2
	add	r0, r6, #0
	add	r1, r5, #0
	bl	Div
	mov	r9, r0
	add	r0, r6, #0
	add	r1, r5, #0
	bl	Mod
	mov	r1, #0x64
	bl	__divsi3
	add	r6, r0, #0
	mov	r0, r9
	mov	r1, #0x3c
	bl	Mod
	add	r5, r0, #0
	mov	r0, r9
	mov	r1, #0x3c
	bl	Div
	mov	r0, sl
	add	r1, r5, #0
	mov	r2, r8
	bl	showNumber
	and	r4, r4, r0
	ldr	r1, .L1
	mov	r0, sl
	mov	r2, r8
	bl	showString
	and	r4, r4, r0
	mov	r0, sl
	add	r1, r6, #0
	mov	r2, r8
	bl	showNumber
	and	r4, r4, r0
	add	r0, r4, #0
	pop	{r3, r4, r5}
	mov	r8, r3
	mov	r9, r4
	mov	sl, r5
	pop	{r4, r5, r6}
	pop	{r1}
	bx	r1
.L2:
	.align	2, 0
.L1:
	.4byte	0x8755b8c
	thumb_func_end sub_8061BA0

.align 2, 0 @ Don't pad with nop.
