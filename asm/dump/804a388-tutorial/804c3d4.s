	.include "asm/common.inc"

	thumb_func_start sub_804C3D4
sub_804C3D4:
	push	{r4, r5, r6, r7, lr}
	mov	r7, sl
	mov	r6, r9
	mov	r5, r8
	push	{r5, r6, r7}
	add	sp, sp, #0xfffffffc
	mov	sl, r1
	mov	r9, r2
	mov	r8, r3
	ldr	r7, [sp, #0x24]
	mov	r1, #0x4
	ldsh	r3, [r0, r1]
	ldr	r6, [r0, #0x8]
	b	.L1
.L2:
	ldr	r4, [r7]
	ADD r4, sl
	str	r4, [r6]
	ldr	r1, [r7, #0x4]
	ADD r1, r9
	str	r1, [r6, #0x4]
	ldr	r2, [r7, #0x8]
	ADD r2, r8
	str	r2, [r6, #0x8]
	ldr	r0, [r7, #0xc]
	str	r0, [r6, #0xc]
	ldr	r0, [r7, #0x10]
	str	r0, [r6, #0x10]
	ldr	r0, [r7, #0x14]
	str	r0, [r6, #0x14]
	ldr	r0, [r7, #0x18]
	str	r0, [r6, #0x18]
	ldr	r0, [r7, #0x1c]
	str	r0, [r6, #0x1c]
	ldr	r0, [r7, #0x20]
	str	r0, [r6, #0x20]
	ldr	r0, [r7, #0x24]
	str	r0, [r6, #0x24]
	ldrh	r0, [r7, #0x28]
	strh	r0, [r6, #0x28]
	ldrh	r0, [r7, #0x2c]
	strh	r0, [r6, #0x2a]
	ldrh	r0, [r7, #0x2e]
	strh	r0, [r6, #0x2c]
	sub	r5, r4, r1
	add	r4, r4, r1
	asr	r4, r4, #0x1
	sub	r4, r4, r2
	ldr	r0, [r6, #0x30]
	ldrh	r1, [r7, #0x2a]
	str	r3, [sp]
	bl	sub_804AB50
	ldr	r0, [r6, #0x30]
	add	r1, r5, #0
	add	r2, r4, #0
	bl	sub_804ABD8
	add	r7, r7, #0x30
	add	r6, r6, #0x34
	ldr	r3, [sp]
.L1:
	add	r0, r3, #0
	sub	r3, r3, #0x1
	cmp	r0, #0
	bne	.L2	@cond_branch
	add	sp, sp, #0x4
	pop	{r3, r4, r5}
	mov	r8, r3
	mov	r9, r4
	mov	sl, r5
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
	thumb_func_end sub_804C3D4

.align 2, 0 @ Don't pad with nop.
