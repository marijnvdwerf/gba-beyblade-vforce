	.include "asm/common.inc"

	thumb_func_start processMetadata_3
processMetadata_3:
	push	{r4, r5, lr}
	add	r4, r2, #0
	ldr	r5, [sp, #0xc]
	add	r0, r4, #0
	bl	GetStruct4
	add	r2, r0, #0
	ldrh	r1, [r5, #0x4]
	ldr	r0, .L80544E0
	cmp	r1, r0
	beq	.L80544E8	@cond_branch
	ldr	r0, .L80544E0 + 4
	cmp	r1, r0
	bne	.L8054504	@cond_branch
	ldr	r0, [r5, #0x8]
	strh	r0, [r2, #0x3e]
	b	.L8054504
.L80544DE:
	.align	2, 0
.L80544E0:
	.4byte	0x37ae
	.4byte	0x4ecb
.L80544E8:
	add	r0, r4, #0
	bl	sub_8056E2C
	mov	r0, #0x2
	mov	r1, #0x0
	mov	r2, #0x0
	bl	sub_8055734
	mov	r0, #0x1
	bl	sub_80558E8
	mov	r0, #0x10
	bl	sub_804ABFC
.L8054504:
	pop	{r4, r5}
	pop	{r0}
	bx	r0
	thumb_func_end processMetadata_3

.align 2, 0 @ Don't pad with nop.
