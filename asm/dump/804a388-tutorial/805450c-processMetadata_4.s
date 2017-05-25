	.include "asm/common.inc"

	thumb_func_start processMetadata_4
processMetadata_4:
	push	{r4, r5, r6, lr}
	add	sp, sp, #0xfffffffc
	add	r0, r2, #0
	ldr	r4, [sp, #0x14]
	bl	GetStruct4
	ldr	r0, .L5
	ldr	r3, [r0]
	cmp	r3, #0
	beq	.L4	@cond_branch
	ldr	r2, [r3]
	ldr	r0, [r3, #0x40]
	ldr	r1, [r4, #0x8]
	add	r0, r0, r1
	str	r0, [r3, #0x40]
	ldr	r0, [r3, #0x44]
	ldr	r1, [r4, #0xc]
	add	r0, r0, r1
	str	r0, [r3, #0x44]
	ldr	r0, [r2, #0x48]
	ldr	r1, [r4, #0x10]
	add	r0, r0, r1
	str	r0, [r2, #0x48]
	mov	r1, #0x80
	lsl	r1, r1, #0x13
	add	r0, r3, #0
	bl	RiderHasFlag
	lsl	r0, r0, #0x18
	cmp	r0, #0
	bne	.L4	@cond_branch
	ldr	r0, [r4, #0x10]
	cmp	r0, #0
	beq	.L3	@cond_branch
	mov	r0, #0xd
	bl	sub_804ABFC
	mov	r0, #0x3
	mov	r1, #0x0
	mov	r2, #0x0
	bl	sub_8055734
	b	.L4
.L6:
	.align	2, 0
.L5:
	.4byte	0x3000c10
.L3:
	mov	r5, #0x0
	mov	r6, #0x0
	ldr	r0, [r4, #0x8]
	cmp	r0, #0
	beq	.L8	@cond_branch
	ldr	r5, .L11
	cmp	r0, #0
	ble	.L8	@cond_branch
	mov	r5, #0xe6
	lsl	r5, r5, #0x1
.L8:
	ldr	r4, [r4, #0xc]
	cmp	r4, #0
	beq	.L10	@cond_branch
	ldr	r6, .L11
	cmp	r4, #0
	ble	.L10	@cond_branch
	mov	r6, #0xe6
	lsl	r6, r6, #0x1
.L10:
	mov	r0, #0xe
	bl	sub_804ABFC
	lsl	r2, r5, #0x2
	NEG	r3, r6
	lsl	r3, r3, #0x2
	mov	r0, #0x0
	str	r0, [sp]
	mov	r1, #0x0
	bl	sub_805582C
.L4:
	add	sp, sp, #0x4
	pop	{r4, r5, r6}
	pop	{r0}
	bx	r0
.L12:
	.align	2, 0
.L11:
	.4byte	0xfffffe34
	thumb_func_end processMetadata_4

.align 2, 0 @ Don't pad with nop.
