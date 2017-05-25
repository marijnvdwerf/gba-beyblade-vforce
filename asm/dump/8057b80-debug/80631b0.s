	.include "asm/common.inc"

	thumb_func_start sub_80631B0
sub_80631B0:
	push	{r4, r5, r6, r7, lr}
	mov	r7, r8
	push	{r7}
	add	r5, r0, #0
	mov	r8, r1
	add	r6, r2, #0
	add	r4, r3, #0
	ldr	r7, [sp, #0x18]
	mov	r0, #0x2
	NEG	r0, r0
	and	r6, r6, r0
	and	r4, r4, r0
	lsl	r0, r4, #0x1
	mul	r0, r0, r7
	bl	slowAllocate
	str	r0, [r5, #0x10]
	strh	r6, [r5, #0x4]
	strh	r4, [r5, #0x6]
	strh	r7, [r5, #0x8]
	mov	r1, r8
	str	r1, [r5]
	ldr	r0, [r0]
	str	r0, [r5, #0xc]
	pop	{r3}
	mov	r8, r3
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
	thumb_func_end sub_80631B0

.align 2, 0 @ Don't pad with nop.
