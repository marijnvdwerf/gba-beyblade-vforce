	.include "asm/common.inc"

	thumb_func_start sub_804FF88
sub_804FF88:
	push	{r4, r5, lr}
	lsl	r0, r0, #0x10
	lsr	r5, r0, #0x10
	ldr	r4, .L804FFC4
	mov	r1, #0x0
	ldsh	r0, [r4, r1]
	cmp	r0, #0xf
	ble	.L804FF9E	@cond_branch
	ldr	r0, .L804FFC4 + 4
	bl	printf
.L804FF9E:
	ldr	r0, .L804FFC4 + 8
	mov	r2, #0x0
	ldsh	r1, [r0, r2]
	mov	r2, #0x0
	ldsh	r0, [r4, r2]
	add	r1, r1, r0
	cmp	r1, #0xf
	ble	.L804FFB0	@cond_branch
	sub	r1, r1, #0x10
.L804FFB0:
	ldr	r0, .L804FFC4 + 12
	lsl	r1, r1, #0x1
	add	r1, r1, r0
	strh	r5, [r1]
	ldrh	r0, [r4]
	add	r0, r0, #0x1
	strh	r0, [r4]
	pop	{r4, r5}
	pop	{r0}
	bx	r0
.L804FFC4:
	.align	2, 0

	.4byte	0x3000f40
	.4byte	0x872704c
	.4byte	0x3000f44
	.4byte	0x3000f20
	thumb_func_end sub_804FF88

.align 2, 0 @ Don't pad with nop.
