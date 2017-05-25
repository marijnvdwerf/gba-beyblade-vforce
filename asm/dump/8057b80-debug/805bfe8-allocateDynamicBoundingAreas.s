	.include "asm/common.inc"

	thumb_func_start allocateDynamicBoundingAreas
allocateDynamicBoundingAreas:
	push	{r4, r5, r6, r7, lr}
	add	r6, r0, #0
	add	r0, r0, #0x44
	ldrh	r5, [r0]
	mov	r4, #0x0
	ldr	r0, [r1]
	ldr	r3, [r0, #0x8]
	mov	r2, #0x0
	ldr	r1, [r1, #0xc]
	ldr	r0, [r6, #0x4c]
	mov	ip, r0
	b	.L1
.L4:
	add	r2, r2, #0x1
	add	r1, r1, #0x20
.L1:
	add	r0, r3, #0
	sub	r3, r3, #0x1
	cmp	r0, #0
	beq	.L2	@cond_branch
	mov	r0, #0x8
	ldrb	r7, [r1, #0x11]
	and	r0, r0, r7
	cmp	r0, #0
	beq	.L4	@cond_branch
	mov	r0, ip
	add	r0, r0, #0x4
	mov	ip, r0
	sub	r0, r0, #0x4
	stmia	r0!, {r2}
	add	r4, r4, #0x1
	cmp	r4, r5
	ble	.L4	@cond_branch
	ldr	r0, .L5
	add	r1, r5, #0
	bl	printf
.L2:
	add	r0, r6, #0
	add	r0, r0, #0x48
	strh	r4, [r0]
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L6:
	.align	2, 0
.L5:
	.4byte	0x8755530
	thumb_func_end allocateDynamicBoundingAreas

.align 2, 0 @ Don't pad with nop.
