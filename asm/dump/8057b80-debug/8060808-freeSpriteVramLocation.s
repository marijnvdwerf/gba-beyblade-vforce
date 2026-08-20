	.include "asm/common.inc"

	thumb_func_start freeSpriteVramLocation
freeSpriteVramLocation:
	push	{r4, r5, r6, r7, lr}
	mov	r7, r9
	mov	r6, r8
	push	{r6, r7}
	add	r7, r0, #0
	add	r5, r1, #0
	ldr	r1, .L8060838
	ldr	r2, [r1]
	ldr	r0, .L8060838 + 4
	ldr	r4, [r0]
	mov	r6, #0x0
	add	r3, r7, r5
	mov	ip, r3
	mov	r8, r1
	mov	r9, r0
	cmp	r2, #0
	beq	.L8060886	@cond_branch
.L806082A:
	ldrh	r3, [r2]
	cmp	ip, r3
	bne	.L8060840	@cond_branch
	sub	r0, r3, r5
	strh	r0, [r2]
	ldrh	r1, [r2, #0x2]
	b	.L8060848
.L8060838:
	.align	2, 0

	.4byte	_unk3005DC8
	.4byte	_unk3005DD8
.L8060840:
	ldrh	r1, [r2, #0x2]
	add	r0, r3, r1
	cmp	r7, r0
	bne	.L806084E	@cond_branch
.L8060848:
	add	r0, r1, r5
	strh	r0, [r2, #0x2]
	b	.L8060886
.L806084E:
	cmp	r3, r7
	ble	.L806087E	@cond_branch
	cmp	r4, #0
	bne	.L8060864	@cond_branch
	ldr	r0, .L8060860
	bl	printf
	b	.L80608C0
.L806085E:
	.align	2, 0
.L8060860:
	.4byte	Str_8755A08
.L8060864:
	ldr	r0, [r4, #0x4]
	mov	r3, r9
	str	r0, [r3]
	cmp	r6, #0
	beq	.L8060872	@cond_branch
	str	r4, [r6, #0x4]
	b	.L8060876
.L8060872:
	mov	r0, r8
	str	r4, [r0]
.L8060876:
	str	r2, [r4, #0x4]
	strh	r7, [r4]
	strh	r5, [r4, #0x2]
	b	.L8060886
.L806087E:
	add	r6, r2, #0
	ldr	r2, [r2, #0x4]
	cmp	r2, #0
	bne	.L806082A	@cond_branch
.L8060886:
	mov	r1, r8
	ldr	r0, [r1]
	ldr	r2, [r0, #0x4]
	add	r6, r0, #0
	cmp	r2, #0
	beq	.L80608C0	@cond_branch
	ldr	r4, .L80608B4
.L8060894:
	ldrh	r1, [r2]
	ldrh	r3, [r6, #0x2]
	ldrh	r5, [r6]
	add	r0, r5, r3
	cmp	r1, r0
	bne	.L80608B8	@cond_branch
	ldr	r0, [r2, #0x4]
	ldrh	r5, [r2, #0x2]
	add	r1, r5, r3
	strh	r1, [r6, #0x2]
	str	r0, [r6, #0x4]
	ldr	r1, [r4]
	str	r1, [r2, #0x4]
	str	r2, [r4]
	add	r2, r0, #0
	b	.L80608BC
.L80608B4:
	.align	2, 0

	.4byte	_unk3005DD8
.L80608B8:
	add	r6, r2, #0
	ldr	r2, [r2, #0x4]
.L80608BC:
	cmp	r2, #0
	bne	.L8060894	@cond_branch
.L80608C0:
	pop	{r3, r4}
	mov	r8, r3
	mov	r9, r4
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
	thumb_func_end freeSpriteVramLocation

.align 2, 0 @ Don't pad with nop.
