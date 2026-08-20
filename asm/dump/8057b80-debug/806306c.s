	.include "asm/common.inc"

	thumb_func_start sub_806306C
sub_806306C:
	push	{r4, r5, r6, r7, lr}
	add	r5, r0, #0
	add	r6, r1, #0
	ldr	r0, .L8063084
	ldr	r3, [r0]
	mov	r7, #0x0
	ldr	r1, [r3]
	mov	ip, r0
	cmp	r1, r5
	blt	.L8063088	@cond_branch
	mov	r7, #0x1
	b	.L80630BA
.L8063084:
	.align	2, 0

	.4byte	_unk3005E60
.L8063088:
	ldr	r4, [r3, #0x10]
	cmp	r4, #0
	beq	.L806309A	@cond_branch
	ldr	r0, [r3, #0x4]
	add	r0, r1, r0
	ldr	r1, [r4]
	sub	r1, r1, r0
	cmp	r1, r5
	bge	.L80630BE	@cond_branch
.L806309A:
	add	r3, r4, #0
	cmp	r3, #0
	beq	.L80630BA	@cond_branch
	cmp	r1, r5
	bge	.L80630BE	@cond_branch
	ldr	r2, [r3, #0x10]
	add	r4, r2, #0
	cmp	r2, #0
	beq	.L806309A	@cond_branch
	ldr	r0, [r3]
	ldr	r1, [r3, #0x4]
	add	r0, r0, r1
	ldr	r1, [r2]
	sub	r1, r1, r0
	cmp	r1, r5
	blt	.L806309A	@cond_branch
.L80630BA:
	cmp	r1, r5
	blt	.L80630D6	@cond_branch
.L80630BE:
	cmp	r7, #0
	bne	.L80630D6	@cond_branch
	str	r3, [r6, #0xc]
	ldr	r0, [r3, #0x10]
	str	r0, [r6, #0x10]
	ldr	r0, [r3, #0x10]
	str	r6, [r0, #0xc]
	str	r6, [r3, #0x10]
	ldr	r0, [r3]
	ldr	r1, [r3, #0x4]
	add	r0, r0, r1
	b	.L80630EE
.L80630D6:
	cmp	r7, #0x1
	beq	.L80630E0	@cond_branch
	mov	r0, #0x1
	NEG	r0, r0
	b	.L80630EE
.L80630E0:
	str	r6, [r3, #0xc]
	str	r3, [r6, #0x10]
	mov	r0, #0x0
	str	r0, [r6, #0xc]
	mov	r0, ip
	str	r6, [r0]
	mov	r0, #0x0
.L80630EE:
	pop	{r4, r5, r6, r7}
	pop	{r1}
	bx	r1
	thumb_func_end sub_806306C

.align 2, 0 @ Don't pad with nop.
