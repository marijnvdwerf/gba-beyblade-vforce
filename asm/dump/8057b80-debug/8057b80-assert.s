	.include "asm/common.inc"

	thumb_func_start assert
assert:
	push	{r4, r5, r6, r7, lr}
	mov	r7, r8
	push	{r7}
	add	r6, r1, #0
	add	r7, r2, #0
	mov	r8, r3
	lsl	r0, r0, #0x18
	cmp	r0, #0
	bne	.L1	@cond_branch
	ldr	r5, .L3
	add	r0, r5, #0
	bl	printf
	ldr	r0, .L3 + 4
	bl	printf
	ldr	r4, .L3 + 8
	add	r0, r4, #0
	bl	printf
	ldr	r0, .L3 + 12
	add	r1, r6, #0
	bl	printf
	add	r0, r4, #0
	bl	printf
	ldr	r0, .L3 + 16
	add	r1, r7, #0
	bl	printf
	add	r0, r4, #0
	bl	printf
	ldr	r0, .L3 + 20
	mov	r1, r8
	bl	printf
	ldr	r0, .L3 + 24
	ldr	r1, [sp, #0x18]
	bl	printf
	add	r0, r4, #0
	bl	printf
	add	r0, r5, #0
	bl	printf
	ldr	r4, .L3 + 28
	mov	r5, #0x1
.L2:
	bl	updateKeyState
	add	r0, r5, #0
	ldrh	r1, [r4]
	and	r0, r0, r1
	cmp	r0, #0
	beq	.L2	@cond_branch
.L1:
	pop	{r3}
	mov	r8, r3
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L4:
	.align	2, 0
.L3:
	.4byte	0x872cb38
	.4byte	0x872cb74
	.4byte	0x872cb88
	.4byte	0x872cb8c
	.4byte	0x872cb9c
	.4byte	0x872cbac
	.4byte	0x872cbbc
	.4byte	0x3005ca0
	thumb_func_end assert

.align 2, 0 @ Don't pad with nop.
