	.include "asm/common.inc"

	thumb_func_start sub_8041078
sub_8041078:
	push	{r4, lr}
	mov	r4, #0x0
.L1:
	add	r0, r4, #0
	bl	sub_804A0E0
	lsl	r2, r4, #0x4
	ldr	r1, .L2
	add	r2, r2, r1
	ldr	r1, [r2, #0x8]
	strh	r1, [r0, #0xc]
	ldr	r1, [r2]
	lsl	r1, r1, #0x8
	str	r1, [r0]
	ldr	r1, [r2, #0x4]
	lsl	r1, r1, #0x8
	str	r1, [r0, #0x4]
	ldrh	r1, [r2, #0xc]
	strh	r1, [r0, #0x8]
	mov	r1, #0x1
	bl	sub_8061E58
	add	r4, r4, #0x1
	cmp	r4, #0x5
	ble	.L1	@cond_branch
	pop	{r4}
	pop	{r0}
	bx	r0
.L3:
	.align	2, 0
.L2:
	.4byte	0x8068710
	thumb_func_end sub_8041078

.align 2, 0 @ Don't pad with nop.
