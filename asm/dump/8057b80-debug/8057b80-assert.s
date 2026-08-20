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
	bne	.L8057BF2	@cond_branch
	ldr	r5, .L8057BFC
	add	r0, r5, #0
	bl	printf
	ldr	r0, .L8057BFC + 4
	bl	printf
	ldr	r4, .L8057BFC + 8
	add	r0, r4, #0
	bl	printf
	ldr	r0, .L8057BFC + 12
	add	r1, r6, #0
	bl	printf
	add	r0, r4, #0
	bl	printf
	ldr	r0, .L8057BFC + 16
	add	r1, r7, #0
	bl	printf
	add	r0, r4, #0
	bl	printf
	ldr	r0, .L8057BFC + 20
	mov	r1, r8
	bl	printf
	ldr	r0, .L8057BFC + 24
	ldr	r1, [sp, #0x18]
	bl	printf
	add	r0, r4, #0
	bl	printf
	add	r0, r5, #0
	bl	printf
	ldr	r4, .L8057BFC + 28
	mov	r5, #0x1
.L8057BE4:
	bl	updateKeyState
	add	r0, r5, #0
	ldrh	r1, [r4]
	and	r0, r0, r1
	cmp	r0, #0
	beq	.L8057BE4	@cond_branch
.L8057BF2:
	pop	{r3}
	mov	r8, r3
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L8057BFC:
	.align	2, 0

	.4byte	Str_872CB38
	.4byte	Str_872CB74
	.4byte	Str_872CB88
	.4byte	Str_872CB8C
	.4byte	Str_872CB9C
	.4byte	Str_872CBAC
	.4byte	Str_872CBBC
	.4byte	_keyInput
	thumb_func_end assert

.align 2, 0 @ Don't pad with nop.
