	.include "asm/common.inc"

	thumb_func_start sub_8047080
sub_8047080:
	push	{r4, r5, r6, r7, lr}
	add	r7, r0, #0
	mov	r4, #0x0
	lsl	r5, r1, #0x18
	add	r6, r5, #0
.L804708A:
	add	r0, r4, #0
	bl	sub_804A0E0
	lsr	r1, r6, #0x18
	bl	sub_8061E58
	add	r4, r4, #0x1
	cmp	r4, #0x7
	ble	.L804708A	@cond_branch
	ldr	r0, [r7, #0x8]
	cmp	r0, #0
	beq	.L80470A8	@cond_branch
	lsr	r1, r5, #0x18
	bl	sub_8061130
.L80470A8:
	ldr	r0, [r7, #0xc]
	cmp	r0, #0
	beq	.L80470B4	@cond_branch
	lsr	r1, r5, #0x18
	bl	sub_8061130
.L80470B4:
	ldr	r0, [r7, #0x10]
	cmp	r0, #0
	beq	.L80470C0	@cond_branch
	lsr	r1, r5, #0x18
	bl	sub_8061130
.L80470C0:
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
	thumb_func_end sub_8047080

.align 2, 0 @ Don't pad with nop.
