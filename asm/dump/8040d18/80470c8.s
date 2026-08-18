	.include "asm/common.inc"

	thumb_func_start sub_80470C8
sub_80470C8:
	push	{r4, r5, lr}
	add	r5, r0, #0
	mov	r4, #0x0
.L80470CE:
	add	r0, r4, #0
	bl	sub_804A0E0
	bl	sub_8061228
	add	r4, r4, #0x1
	cmp	r4, #0x7
	ble	.L80470CE	@cond_branch
	ldr	r0, [r5]
	cmp	r0, #0
	beq	.L80470EC	@cond_branch
	bl	sub_8060A94
	mov	r0, #0x0
	str	r0, [r5]
.L80470EC:
	ldr	r0, [r5, #0x4]
	cmp	r0, #0
	beq	.L80470FA	@cond_branch
	bl	sub_8060A94
	mov	r0, #0x0
	str	r0, [r5, #0x4]
.L80470FA:
	ldr	r0, [r5, #0x8]
	cmp	r0, #0
	beq	.L8047108	@cond_branch
	bl	sub_8060A94
	mov	r0, #0x0
	str	r0, [r5, #0x8]
.L8047108:
	ldr	r0, [r5, #0xc]
	cmp	r0, #0
	beq	.L8047116	@cond_branch
	bl	sub_8060A94
	mov	r0, #0x0
	str	r0, [r5, #0xc]
.L8047116:
	ldr	r0, [r5, #0x10]
	cmp	r0, #0
	beq	.L8047124	@cond_branch
	bl	sub_8060A94
	mov	r0, #0x0
	str	r0, [r5, #0x10]
.L8047124:
	pop	{r4, r5}
	pop	{r0}
	bx	r0
	thumb_func_end sub_80470C8

.align 2, 0 @ Don't pad with nop.
