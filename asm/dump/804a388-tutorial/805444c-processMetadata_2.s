	.include "asm/common.inc"

	thumb_func_start processMetadata_2
processMetadata_2:
	push	{r4, r5, r6, r7, lr}
	add	sp, sp, #0xfffffff4
	ldr	r6, [sp, #0x20]
	ldr	r0, .L4
	ldrh	r1, [r6, #0x4]
	cmp	r1, r0
	bne	.L2	@cond_branch
	add	r0, r2, #0
	bl	GetStruct4
	ldr	r4, [r0]
	cmp	r4, #0
	beq	.L2	@cond_branch
	add	r5, r4, #0
	add	r5, r5, #0xb4
	ldr	r7, [r5]
	add	r0, r4, #0
	add	r0, r0, #0xb8
	ldr	r0, [r0]
	cmp	r0, #0
	beq	.L3	@cond_branch
	bl	sub_8060A94
.L3:
	ldr	r1, [r6, #0x8]
	ldr	r2, [r4, #0x3c]
	ldr	r3, [r4, #0x4]
	asr	r3, r3, #0x8
	ldr	r0, [r4, #0x8]
	asr	r0, r0, #0x8
	str	r0, [sp]
	ldr	r0, [r4, #0xc]
	asr	r0, r0, #0x8
	str	r0, [sp, #0x4]
	ldr	r0, [r4, #0x70]
	str	r0, [sp, #0x8]
	add	r0, r4, #0
	bl	actor_8057C58
	add	r1, r4, #0
	add	r1, r1, #0xb0
	ldr	r0, .L4 + 4
	str	r0, [r1]
	mov	r0, #0x0
	str	r0, [r4, #0x68]
	add	r1, r1, #0xc
	mov	r0, #0x10
	strh	r0, [r1]
	str	r7, [r5]
.L2:
	add	sp, sp, #0xc
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L5:
	.align	2, 0
.L4:
	.4byte	0x524d
	.4byte	convert3DCoordsto2DCoords + 1
	thumb_func_end processMetadata_2

.align 2, 0 @ Don't pad with nop.
