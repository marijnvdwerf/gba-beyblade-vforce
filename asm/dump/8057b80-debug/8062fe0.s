	.include "asm/common.inc"

	thumb_func_start sub_8062FE0
sub_8062FE0:
	push	{r4, r5, r6, r7, lr}
	add	sp, sp, #0xfffffffc
	add	r6, r0, #0
	ldr	r5, [r6, #0x8]
	ldr	r4, [r6, #0x4]
	ldr	r1, [r6, #0xc]
	ldr	r7, [r6, #0x10]
	add	r0, r4, #0
	sub	r4, r4, #0x1
	cmp	r0, #0
	beq	.L806300A	@cond_branch
.L8062FF6:
	add	r0, r5, #0
	str	r1, [sp]
	bl	sub_80588A8
	add	r5, r5, #0xc4
	add	r0, r4, #0
	sub	r4, r4, #0x1
	ldr	r1, [sp]
	cmp	r0, #0
	bne	.L8062FF6	@cond_branch
.L806300A:
	ldr	r2, .L8063024
	ldr	r0, [r2]
	cmp	r0, r6
	bne	.L8063016	@cond_branch
	ldr	r0, [r6, #0xc]
	str	r0, [r2]
.L8063016:
	cmp	r1, #0
	bne	.L8063034	@cond_branch
	cmp	r7, #0
	bne	.L8063028	@cond_branch
	bl	allocateActorHeaps
	b	.L8063048
.L8063024:
	.align	2, 0

	.4byte	_unk3005E58
.L8063028:
	ldr	r0, .L8063030
	str	r7, [r0]
	str	r1, [r7, #0xc]
	b	.L8063048
.L8063030:
	.align	2, 0

	.4byte	_unk3005E60
.L8063034:
	str	r7, [r1, #0x10]
	cmp	r7, #0
	beq	.L806303E	@cond_branch
	str	r1, [r7, #0xc]
	b	.L8063048
.L806303E:
	ldr	r0, .L8063054
	ldr	r1, [r0]
	ldr	r2, [r6, #0x4]
	sub	r1, r1, r2
	str	r1, [r0]
.L8063048:
	mov	r0, #0x0
	str	r0, [r6, #0x8]
	add	sp, sp, #0x4
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L8063054:
	.align	2, 0

	.4byte	_unk3005E64
	thumb_func_end sub_8062FE0

.align 2, 0 @ Don't pad with nop.
