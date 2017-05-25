	.include "asm/common.inc"

	thumb_func_start initGameloop2
initGameloop2:
	push	{r4, lr}
	bl	getSomeLevelID
	add	r4, r0, #0
	bl	sub_804AE8C
	mov	r0, #0x0
	bl	sub_804AFD4
	bl	sub_8054FE0
	bl	deallocEventListeners
	lsl	r0, r4, #0x10
	lsr	r0, r0, #0x10
	bl	initLevelEnvironmentActors
	add	r0, r4, #0
	bl	initEventListeners
	ldr	r4, .L2
	ldr	r0, [r4]
	mov	r1, #0xcb
	lsl	r1, r1, #0x3
	add	r2, r0, r1
	mov	r3, #0x8e
	lsl	r3, r3, #0x2
	add	r1, r0, r3
	str	r1, [r2]
	ldr	r1, .L2 + 4
	add	r0, r0, r1
	mov	r1, #0x1
	strb	r1, [r0]
	ldr	r2, [r4]
	ldr	r3, .L2 + 8
	add	r1, r2, r3
	mov	r0, #0x3c
	strh	r0, [r1]
	ldr	r0, .L2 + 12
	add	r1, r2, r0
	ldr	r0, [r1]
	add	r0, r0, #0x1
	str	r0, [r1]
	ldr	r1, .L2 + 16
	add	r2, r2, r1
	ldrb	r0, [r2]
	cmp	r0, #0
	beq	.L1	@cond_branch
	sub	r0, r0, #0x1
	strb	r0, [r2]
.L1:
	ldr	r0, [r4]
	add	r0, r0, r1
	ldrb	r0, [r0]
	bl	sub_804F800
	bl	sub_804FE9C
	bl	sub_80538C0
	bl	initRiders
	bl	sub_8056F7C
	ldr	r0, [r4]
	ldr	r1, .L2 + 20
	add	r0, r0, r1
	bl	sub_805BA3C
	ldr	r0, [r4]
	ldr	r3, .L2 + 24
	add	r0, r0, r3
	bl	deallocateQuadTree
	bl	initCollisionData
	bl	sub_8056FAC
	bl	sub_804AD44
	pop	{r4}
	pop	{r0}
	bx	r0
.L3:
	.align	2, 0
.L2:
	.4byte	0x3000fb0
	.4byte	0xb53
	.4byte	0xc6e
	.4byte	0x163c
	.4byte	0x1638
	.4byte	0x65c
	.4byte	0x7a4
	thumb_func_end initGameloop2

.align 2, 0 @ Don't pad with nop.
