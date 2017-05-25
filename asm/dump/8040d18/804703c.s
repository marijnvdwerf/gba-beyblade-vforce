	.include "asm/common.inc"

	thumb_func_start sub_804703C
sub_804703C:
	push	{r4, r5, lr}
	add	r5, r0, #0
	mov	r4, #0x0
.L1:
	add	r0, r4, #0
	bl	sub_804A0E0
	add	r1, r5, #0
	add	r1, r1, #0x35
	mov	r3, #0x0
	ldsb	r3, [r1, r3]
	lsl	r3, r3, #0x7
	lsl	r1, r4, #0x4
	ldr	r2, .L2
	add	r1, r1, r2
	add	r3, r3, r1
	ldr	r1, [r3, #0x8]
	strh	r1, [r0, #0xc]
	ldr	r1, [r3]
	lsl	r1, r1, #0x8
	str	r1, [r0]
	ldr	r1, [r3, #0x4]
	lsl	r1, r1, #0x8
	str	r1, [r0, #0x4]
	ldrh	r1, [r3, #0xc]
	strh	r1, [r0, #0x8]
	add	r4, r4, #0x1
	cmp	r4, #0x7
	ble	.L1	@cond_branch
	pop	{r4, r5}
	pop	{r0}
	bx	r0
.L3:
	.align	2, 0
.L2:
	.4byte	0x80699dc
	thumb_func_end sub_804703C

.align 2, 0 @ Don't pad with nop.
