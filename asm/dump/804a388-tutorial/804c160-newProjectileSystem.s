	.include "asm/common.inc"

	thumb_func_start newProjectileSystem
newProjectileSystem:
	push	{r4, r5, r6, r7, lr}
	mov	r7, sl
	mov	r6, r9
	mov	r5, r8
	push	{r5, r6, r7}
	add	sp, sp, #0xfffffff4
	add	r5, r0, #0
	add	r7, r1, #0
	mov	sl, r2
	mov	r9, r3
	mov	r0, #0x64
	mul	r0, r0, r7
	bl	slowAllocate
	add	r1, r0, #0
	cmp	r1, #0
	bne	.L1	@cond_branch
	ldr	r0, .L3
	bl	printf
	b	.L5
.L4:
	.align	2, 0
.L3:
	.4byte	0x8726fe4
.L1:
	ldr	r4, [r1]
	mov	r0, #0x34
	mul	r0, r0, r7
	add	r6, r4, r0
	str	r1, [r5]
	mov	r0, #0x0
	strh	r7, [r5, #0x4]
	str	r4, [r5, #0x8]
	str	r6, [r5, #0xc]
	str	r0, [r5, #0x24]
	str	r0, [r5, #0x20]
	str	r0, [r5, #0x1c]
	str	r0, [r5, #0x18]
	str	r0, [r5, #0x14]
	str	r0, [r5, #0x10]
	cmp	r7, #0
	ble	.L5	@cond_branch
	mov	r8, r0
	add	r5, r7, #0
.L6:
	mov	r1, #0x2a
	ldsh	r0, [r4, r1]
	str	r0, [r4, #0x20]
	str	r0, [r4, #0x1c]
	str	r0, [r4, #0x18]
	str	r0, [r4, #0x14]
	str	r0, [r4, #0x10]
	str	r0, [r4, #0xc]
	str	r0, [r4, #0x8]
	str	r0, [r4, #0x4]
	str	r0, [r4]
	mov	r0, r8
	strh	r0, [r4, #0x2c]
	mov	r0, #0x3
	strh	r0, [r4, #0x28]
	str	r6, [r4, #0x30]
	mov	r0, #0x28
	str	r0, [sp]
	mov	r0, #0xf
	str	r0, [sp, #0x4]
	mov	r1, r8
	str	r1, [sp, #0x8]
	add	r0, r6, #0
	mov	r1, sl
	ldr	r2, [sp, #0x2c]
	mov	r3, r9
	bl	newSpriteTrail
	add	r6, r6, #0x30
	add	r4, r4, #0x34
	sub	r5, r5, #0x1
	cmp	r5, #0
	bne	.L6	@cond_branch
.L5:
	add	sp, sp, #0xc
	pop	{r3, r4, r5}
	mov	r8, r3
	mov	r9, r4
	mov	sl, r5
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
	thumb_func_end newProjectileSystem

.align 2, 0 @ Don't pad with nop.
