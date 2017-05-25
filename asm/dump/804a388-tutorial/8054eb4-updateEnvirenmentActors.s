	.include "asm/common.inc"

	thumb_func_start updateEnvirenmentActors
updateEnvirenmentActors:
	push	{r4, r5, r6, r7, lr}
	mov	r7, r9
	mov	r6, r8
	push	{r6, r7}
	add	sp, sp, #0xfffffffc
	ldr	r0, .L9
	ldr	r1, [r0]
	ldr	r2, .L9 + 4
	add	r0, r1, r2
	ldr	r0, [r0]
	mov	r8, r0
	sub	r2, r2, #0x8
	add	r0, r1, r2
	ldr	r3, [r0]
	ldr	r0, .L9 + 8
	add	r0, r0, r1
	mov	r9, r0
	mov	r1, r8
	cmp	r1, #0
	beq	.L1	@cond_branch
	mov	r2, #0x1
	NEG	r2, r2
	ADD r8, r2
.L8:
	add	r0, r3, #0
	add	r0, r0, #0xb4
	ldr	r4, [r0]
	add	r0, r4, #0
	str	r3, [sp]
	bl	GetStruct4
	add	r7, r0, #0
	lsl	r4, r4, #0x5
	mov	r1, r9
	ldr	r0, [r1, #0xc]
	add	r4, r0, r4
	ldr	r3, [sp]
	cmp	r7, #0
	beq	.L3	@cond_branch
	mov	r0, #0x1
	ldrh	r2, [r7, #0x10]
	and	r0, r0, r2
	cmp	r0, #0
	beq	.L3	@cond_branch
	ldr	r2, [r4]
	lsl	r2, r2, #0x4
	ldr	r1, [r1, #0x4]
	add	r2, r1, r2
	ldr	r0, [r4, #0x4]
	lsl	r0, r0, #0x4
	add	r4, r1, r0
	ldr	r0, [r3, #0x4]
	asr	r0, r0, #0x5
	ldr	r1, [r7, #0x14]
	add	r0, r0, r1
	str	r0, [r2]
	ldr	r0, [r3, #0x8]
	asr	r0, r0, #0x5
	ldr	r1, [r7, #0x18]
	add	r0, r0, r1
	str	r0, [r2, #0x4]
	ldr	r0, [r3, #0xc]
	asr	r0, r0, #0x5
	ldr	r1, [r7, #0x1c]
	add	r0, r0, r1
	str	r0, [r2, #0x8]
	ldr	r0, [r3, #0x4]
	asr	r0, r0, #0x5
	ldr	r1, [r7, #0x20]
	add	r0, r0, r1
	str	r0, [r4]
	ldr	r0, [r3, #0x8]
	asr	r0, r0, #0x5
	ldr	r1, [r7, #0x24]
	add	r0, r0, r1
	str	r0, [r4, #0x4]
	ldr	r0, [r3, #0xc]
	asr	r0, r0, #0x5
	ldr	r1, [r7, #0x28]
	add	r0, r0, r1
	str	r0, [r4, #0x8]
.L3:
	ldrh	r1, [r7, #0x38]
	mov	r2, #0x38
	ldsh	r0, [r7, r2]
	cmp	r0, #0
	beq	.L5	@cond_branch
	sub	r0, r1, #1
	strh	r0, [r7, #0x38]
	lsl	r0, r0, #0x10
	cmp	r0, #0
	bne	.L5	@cond_branch
	ldr	r0, [r7, #0x2c]
	str	r0, [r3, #0x40]
	ldr	r0, [r7, #0x30]
	str	r0, [r3, #0x44]
	ldr	r0, [r7, #0x34]
	str	r0, [r3, #0x48]
.L5:
	ldrh	r1, [r7, #0x3c]
	mov	r2, #0x3c
	ldsh	r0, [r7, r2]
	cmp	r0, #0
	beq	.L7	@cond_branch
	sub	r0, r1, #1
	strh	r0, [r7, #0x3c]
	lsl	r0, r0, #0x10
	cmp	r0, #0
	bne	.L7	@cond_branch
	ldrh	r1, [r7, #0x3e]
	mov	r0, r9
	str	r3, [sp]
	bl	sub_8054278
	ldr	r3, [sp]
.L7:
	ldr	r4, [r3, #0x4]
	ldr	r5, [r3, #0x8]
	ldr	r6, [r3, #0xc]
	add	r0, r3, #0
	str	r3, [sp]
	bl	sub_80584B8
	ldr	r3, [sp]
	ldr	r0, [r3, #0x4]
	sub	r0, r0, r4
	str	r0, [r7, #0x40]
	ldr	r0, [r3, #0x8]
	sub	r0, r0, r5
	str	r0, [r7, #0x44]
	ldr	r0, [r3, #0xc]
	sub	r0, r0, r6
	str	r0, [r7, #0x48]
	add	r3, r3, #0xc4
	mov	r0, r8
	mov	r1, #0x1
	NEG	r1, r1
	ADD r8, r1
	cmp	r0, #0
	bne	.L8	@cond_branch
.L1:
	add	sp, sp, #0x4
	pop	{r3, r4}
	mov	r8, r3
	mov	r9, r4
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L10:
	.align	2, 0
.L9:
	.4byte	0x3000fb0
	.4byte	0xc84
	.4byte	0x65c
	thumb_func_end updateEnvirenmentActors

.align 2, 0 @ Don't pad with nop.
