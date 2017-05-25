	.include "asm/common.inc"

	thumb_func_start allocFXSprite
allocFXSprite:
	push	{r4, r5, r6, r7, lr}
	add	sp, sp, #0xfffffff0
	add	r6, r0, #0
	mov	r0, #0xf0
	lsl	r0, r0, #0x2
	add	r7, r6, r0
	ldr	r4, [r7]
	cmp	r4, #0
	bne	.L1	@cond_branch
	mov	r0, #0xff
	bl	allocSprite
	add	r5, r0, #0
	cmp	r5, #0
	beq	.L2	@cond_branch
	ldr	r1, .L3
	mov	r0, #0x2
	str	r0, [sp]
	str	r4, [sp, #0x4]
	str	r4, [sp, #0x8]
	str	r4, [sp, #0xc]
	add	r0, r5, #0
	mov	r2, #0x0
	mov	r3, #0x0
	bl	LoadSpriteSheet
	mov	r0, #0x1
	ldrh	r1, [r5, #0x20]
	orr	r0, r0, r1
	strh	r0, [r5, #0x20]
	ldr	r1, .L3 + 4
	add	r0, r6, r1
	ldrb	r0, [r0]
	lsl	r0, r0, #0x4
	mov	r1, #0x80
	lsl	r1, r1, #0x1
	add	r0, r0, r1
	str	r0, [r5, #0x24]
.L2:
	str	r5, [r7]
.L1:
	add	sp, sp, #0x10
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L4:
	.align	2, 0
.L3:
	.4byte	0x86fba14
	.4byte	0x3ce
	thumb_func_end allocFXSprite

.align 2, 0 @ Don't pad with nop.
