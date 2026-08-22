	.include "asm/common.inc"

	thumb_func_start sub_80495C4
sub_80495C4:
	push	{r4, r5, r6, lr}
	add	sp, sp, #0xfffffffc
	ldr	r1, .L80495EC
	add	r0, r1, #0
	add	r0, r0, #0xb4
	ldr	r0, [r0]
	ldr	r2, [r0, #0x4]
	ldr	r1, [r1, #0x4]
	mov	r0, #0x1
	neg	r0, r0
	cmp	r1, r0
	beq	.L80495F4	@cond_branch
	lsl	r0, r1, #0x1
	add	r0, r0, r1
	lsl	r0, r0, #0x3
	ldr	r1, .L80495EC + 4
	add	r0, r0, r1
	ldr	r6, [r0, #0x4]
	b	.L80495F6
.L80495EA:
	.align	2, 0
.L80495EC:
	.4byte	_unk3000650
	.4byte	_8069FC8
.L80495F4:
	mov	r6, #0x0
.L80495F6:
	ldr	r4, .L8049674
	ldr	r1, .L8049674 + 4
	add	r0, r4, r1
	mov	r1, #0x0
	ldsh	r0, [r0, r1]
	cmp	r0, #0
	beq	.L804963E	@cond_branch
	ldr	r0, [r2, #0x10]
	ldr	r5, [r0, #0x28]
	cmp	r5, #0
	beq	.L804963E	@cond_branch
	mov	r0, #0x8b
	lsl	r0, r0, #0x3
	add	r4, r4, r0
	ldr	r1, [r5]
	ldr	r2, [r5, #0x4]
	ldr	r3, [r5, #0x8]
	ldr	r0, [r5, #0xc]
	str	r0, [sp]
	add	r0, r4, #0
	bl	sub_80504E4
	ldr	r1, [r5, #0x10]
	ldr	r2, [r5, #0x14]
	ldr	r3, [r5, #0x18]
	ldr	r0, [r5, #0x1c]
	str	r0, [sp]
	add	r0, r4, #0
	bl	sub_805052C
	ldr	r1, [r5, #0x20]
	mov	r0, #0x26
	ldsh	r2, [r5, r0]
	add	r0, r4, #0
	bl	sub_8050578
.L804963E:
	ldr	r4, .L8049674
	add	r0, r4, #0
	bl	sub_8043558
	cmp	r6, #0
	beq	.L804966A	@cond_branch
	ldr	r0, [r6, #0x24]
	cmp	r0, #0
	beq	.L804966A	@cond_branch
	bl	sub_8048FFC
	lsl	r0, r0, #0x18
	cmp	r0, #0
	beq	.L804966A	@cond_branch
	mov	r1, #0xa0
	lsl	r1, r1, #0x1
	add	r0, r4, r1
	ldr	r2, [r6, #0x24]
	ldr	r1, [r2]
	ldr	r2, [r2, #0x4]
	bl	sub_804903C
.L804966A:
	add	sp, sp, #0x4
	pop	{r4, r5, r6}
	pop	{r0}
	bx	r0
.L8049672:
	.align	2, 0
.L8049674:
	.4byte	_unk3000650
	.4byte	0x464
	thumb_func_end sub_80495C4

.align 2, 0 @ Don't pad with nop.
