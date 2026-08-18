	.include "asm/common.inc"

	thumb_func_start sub_804C888
sub_804C888:
	push	{r4, lr}
	add	r4, r0, #0
	lsl	r1, r1, #0x18
	cmp	r1, #0
	beq	.L804C8AA	@cond_branch
	mov	r1, #0x81
	lsl	r1, r1, #0x1
	bl	SetRiderFlag
	ldr	r1, [r4]
	mov	r0, #0x0
	str	r0, [r1, #0x54]
	ldr	r0, [r4, #0x4]
	mov	r1, #0x1
	bl	sub_804C0EC
	b	.L804C8BA
.L804C8AA:
	ldr	r0, [r4]
	mov	r1, #0x1a
	NEG	r1, r1
	str	r1, [r0, #0x54]
	ldr	r0, [r4, #0x4]
	mov	r1, #0x0
	bl	sub_804C0EC
.L804C8BA:
	pop	{r4}
	pop	{r0}
	bx	r0
	thumb_func_end sub_804C888

.align 2, 0 @ Don't pad with nop.
