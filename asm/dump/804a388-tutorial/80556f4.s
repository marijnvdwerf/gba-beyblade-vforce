	.include "asm/common.inc"

	thumb_func_start sub_80556F4
sub_80556F4:
	push	{r4, lr}
	ldr	r0, .L1
	ldr	r4, [r0]
	ldr	r1, .L1 + 4
	add	r0, r4, r1
	bl	sub_804C484
	ldr	r1, .L1 + 8
	add	r0, r4, r1
	bl	deallocate_80637CC
	ldr	r1, .L1 + 12
	add	r0, r4, r1
	bl	deallocate_80637CC
	mov	r0, #0x87
	lsl	r0, r0, #0x5
	add	r4, r4, r0
	add	r0, r4, #0
	bl	deallocate_80637CC
	pop	{r4}
	pop	{r0}
	bx	r0
.L2:
	.align	2, 0
.L1:
	.4byte	0x3000fb0
	.4byte	0x1084
	.4byte	0x10b8
	.4byte	0x10cc
	thumb_func_end sub_80556F4

.align 2, 0 @ Don't pad with nop.
