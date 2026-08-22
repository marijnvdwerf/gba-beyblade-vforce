	.include "asm/common.inc"

	thumb_func_start sub_8060934
sub_8060934:
	push	{r4, r5, r6, lr}
	lsl	r0, r0, #0x10
	lsr	r6, r0, #0x10
	ldr	r0, .L80609B0
	ldr	r4, [r0]
	cmp	r4, #0
	beq	.L806096E	@cond_branch
	mov	r5, #0x1
.L8060944:
	add	r0, r5, #0
	ldrh	r1, [r4, #0x20]
	and	r0, r0, r1
	cmp	r0, #0
	bne	.L8060968	@cond_branch
	ldr	r2, [r4, #0x24]
	cmp	r2, #0
	blt	.L8060962	@cond_branch
	ldrh	r0, [r4, #0x16]
	sub	r0, r0, #0x5
	add	r1, r5, #0
	lsl	r1, r0
	add	r0, r2, #0
	bl	freeSpriteVramLocation
.L8060962:
	mov	r0, #0x1
	neg	r0, r0
	str	r0, [r4, #0x24]
.L8060968:
	ldr	r4, [r4, #0x4]
	cmp	r4, #0
	bne	.L8060944	@cond_branch
.L806096E:
	ldr	r0, .L80609B0 + 4
	str	r6, [r0]
	ldr	r0, .L80609B0 + 8
	ldr	r3, [r0]
	cmp	r3, #0
	beq	.L80609AA	@cond_branch
	ldr	r0, .L80609B0 + 12
	str	r3, [r0]
	ldr	r0, .L80609B0 + 16
	add	r2, r3, #0
	add	r2, r2, #0x8
	str	r2, [r0]
	mov	r1, #0x0
	strh	r6, [r3]
	mov	r4, #0x80
	lsl	r4, r4, #0x3
	add	r0, r4, #0
	sub	r0, r0, r6
	strh	r0, [r3, #0x2]
	str	r1, [r3, #0x4]
	mov	r3, #0x1d
.L8060998:
	add	r1, r2, #0
	add	r1, r1, #0x8
	str	r1, [r2, #0x4]
	add	r2, r1, #0
	add	r0, r3, #0
	sub	r3, r3, #0x1
	cmp	r0, #0
	bne	.L8060998	@cond_branch
	str	r0, [r1, #0x4]
.L80609AA:
	pop	{r4, r5, r6}
	pop	{r0}
	bx	r0
.L80609B0:
	.align	2, 0

	.4byte	_unk3005DE4
	.4byte	_unk3005E6C
	.4byte	_SpriteVramFreeList
	.4byte	_unk3005DC8
	.4byte	_unk3005DD8
	thumb_func_end sub_8060934

.align 2, 0 @ Don't pad with nop.
