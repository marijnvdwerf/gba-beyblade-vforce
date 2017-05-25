	.include "asm/common.inc"

	thumb_func_start freeSpriteVramLocation
freeSpriteVramLocation:
	push	{r4, r5, r6, r7, lr}
	mov	r7, r9
	mov	r6, r8
	push	{r6, r7}
	add	r7, r0, #0
	add	r5, r1, #0
	ldr	r1, .L4
	ldr	r2, [r1]
	ldr	r0, .L4 + 4
	ldr	r4, [r0]
	mov	r6, #0x0
	add	r3, r7, r5
	mov	ip, r3
	mov	r8, r1
	mov	r9, r0
	cmp	r2, #0
	beq	.L15	@cond_branch
.L16:
	ldrh	r3, [r2]
	cmp	ip, r3
	bne	.L2	@cond_branch
	sub	r0, r3, r5
	strh	r0, [r2]
	ldrh	r1, [r2, #0x2]
	b	.L3
.L5:
	.align	2, 0
.L4:
	.4byte	0x3005dc8
	.4byte	0x3005dd8
.L2:
	ldrh	r1, [r2, #0x2]
	add	r0, r3, r1
	cmp	r7, r0
	bne	.L6	@cond_branch
.L3:
	add	r0, r1, r5
	strh	r0, [r2, #0x2]
	b	.L15
.L6:
	cmp	r3, r7
	ble	.L8	@cond_branch
	cmp	r4, #0
	bne	.L9	@cond_branch
	ldr	r0, .L11
	bl	printf
	b	.L17
.L12:
	.align	2, 0
.L11:
	.4byte	0x8755a08
.L9:
	ldr	r0, [r4, #0x4]
	mov	r3, r9
	str	r0, [r3]
	cmp	r6, #0
	beq	.L13	@cond_branch
	str	r4, [r6, #0x4]
	b	.L14
.L13:
	mov	r0, r8
	str	r4, [r0]
.L14:
	str	r2, [r4, #0x4]
	strh	r7, [r4]
	strh	r5, [r4, #0x2]
	b	.L15
.L8:
	add	r6, r2, #0
	ldr	r2, [r2, #0x4]
	cmp	r2, #0
	bne	.L16	@cond_branch
.L15:
	mov	r1, r8
	ldr	r0, [r1]
	ldr	r2, [r0, #0x4]
	add	r6, r0, #0
	cmp	r2, #0
	beq	.L17	@cond_branch
	ldr	r4, .L20
.L22:
	ldrh	r1, [r2]
	ldrh	r3, [r6, #0x2]
	ldrh	r5, [r6]
	add	r0, r5, r3
	cmp	r1, r0
	bne	.L18	@cond_branch
	ldr	r0, [r2, #0x4]
	ldrh	r5, [r2, #0x2]
	add	r1, r5, r3
	strh	r1, [r6, #0x2]
	str	r0, [r6, #0x4]
	ldr	r1, [r4]
	str	r1, [r2, #0x4]
	str	r2, [r4]
	add	r2, r0, #0
	b	.L19
.L21:
	.align	2, 0
.L20:
	.4byte	0x3005dd8
.L18:
	add	r6, r2, #0
	ldr	r2, [r2, #0x4]
.L19:
	cmp	r2, #0
	bne	.L22	@cond_branch
.L17:
	pop	{r3, r4}
	mov	r8, r3
	mov	r9, r4
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
	thumb_func_end freeSpriteVramLocation

.align 2, 0 @ Don't pad with nop.
