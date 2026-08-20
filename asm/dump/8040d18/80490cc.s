	.include "asm/common.inc"

	thumb_func_start sub_80490CC
sub_80490CC:
	push	{r4, lr}
	add	r2, r0, #0
	add	r4, r1, #0
	ldr	r1, .L80490F4
	add	r0, r1, #0
	add	r0, r0, #0xb4
	ldr	r0, [r0]
	cmp	r0, #0
	beq	.L80490EE	@cond_branch
	ldr	r3, [r0, #0x8]
	cmp	r3, #0
	beq	.L80490EE	@cond_branch
	add	r0, r1, #0
	add	r1, r2, #0
	add	r2, r4, #0
	bl	_call_via_r3
.L80490EE:
	pop	{r4}
	pop	{r0}
	bx	r0
.L80490F4:
	.align	2, 0

	.4byte	_unk3000650
	thumb_func_end sub_80490CC

.align 2, 0 @ Don't pad with nop.
