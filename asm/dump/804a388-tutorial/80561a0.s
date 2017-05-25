	.include "asm/common.inc"

	thumb_func_start sub_80561A0
sub_80561A0:
	push	{r4, r5, r6, r7, lr}
	mov	r7, r8
	push	{r7}
	add	r6, r0, #0
	add	r5, r1, #0
	mov	r4, #0x0
	ldr	r1, .L3
	ldr	r0, [r1]
	cmp	r4, r0
	bge	.L1	@cond_branch
	ldr	r0, .L3 + 4
	mov	r8, r0
	add	r7, r1, #0
.L2:
	mov	r0, r8
	add	r0, r0, #0x4
	mov	r8, r0
	sub	r0, r0, #0x4
	ldmia	r0!, {r2}
	add	r0, r6, #0
	add	r1, r5, #0
	bl	sub_80561EC
	add	r4, r4, #0x1
	ldr	r0, [r7]
	cmp	r4, r0
	blt	.L2	@cond_branch
.L1:
	ldr	r1, .L3
	mov	r0, #0x0
	str	r0, [r1]
	pop	{r3}
	mov	r8, r3
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L4:
	.align	2, 0
.L3:
	.4byte	0x3000c18
	.4byte	0x3000c20
	thumb_func_end sub_80561A0

.align 2, 0 @ Don't pad with nop.
