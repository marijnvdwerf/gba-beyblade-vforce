	.include "asm/common.inc"

	thumb_func_start closeGame
closeGame:
	push	{r4, lr}
	ldr	r4, .L2
	ldr	r0, [r4]
	ldr	r1, .L2 + 4
	add	r0, r0, r1
	bl	sub_8060CDC
	ldr	r0, [r4]
	mov	r1, #0x81
	lsl	r1, r1, #0x4
	add	r0, r0, r1
	bl	sub_8061204
	ldr	r0, [r4]
	mov	r1, #0x84
	lsl	r1, r1, #0x4
	add	r0, r0, r1
	bl	sub_8061204
	ldr	r0, [r4]
	ldr	r1, .L2 + 8
	add	r0, r0, r1
	bl	sub_8061204
	bl	deallocBeybladeActorData
	bl	sub_80538C0
	ldr	r0, [r4]
	mov	r1, #0x85
	lsl	r1, r1, #0x3
	add	r0, r0, r1
	ldr	r0, [r0]
	cmp	r0, #0
	beq	.L1	@cond_branch
	bl	deallocateBlock
	ldr	r0, [r4]
	mov	r1, #0x85
	lsl	r1, r1, #0x3
	add	r0, r0, r1
	mov	r1, #0x0
	str	r1, [r0]
.L1:
	bl	sub_8054FE0
	bl	deallocEventListeners
	bl	nullsub_7
	bl	sub_804A72C
	bl	nullsub_4
	bl	sub_804FEE8
	ldr	r0, [r4]
	ldr	r1, .L2 + 12
	add	r0, r0, r1
	bl	sub_805BA3C
	ldr	r0, [r4]
	ldr	r1, .L2 + 16
	add	r0, r0, r1
	bl	deallocateQuadTree
	mov	r0, #0x1
	bl	sub_8053F0C
	pop	{r4}
	pop	{r0}
	bx	r0
.L3:
	.align	2, 0
.L2:
	.4byte	0x3000fb0
	.4byte	0x92c
	.4byte	0x8a8
	.4byte	0x65c
	.4byte	0x7a4
	thumb_func_end closeGame

.align 2, 0 @ Don't pad with nop.
