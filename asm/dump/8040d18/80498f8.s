	.include "asm/common.inc"

	thumb_func_start sub_80498F8
sub_80498F8:
	push	{r4, r5, lr}
	ldr	r4, .L3
	add	r0, r4, #0
	bl	sub_80508A4
	ldr	r5, .L3 + 4
	ldr	r0, .L3 + 8
	add	r4, r4, r0
	ldr	r0, [r4]
	ldr	r1, [r0]
	lsl	r0, r1, #0x5
	add	r0, r0, r1
	lsl	r0, r0, #0x2
	add	r1, r5, #0
	add	r1, r1, #0x78
	add	r0, r0, r1
	ldr	r0, [r0]
	cmp	r0, #0
	beq	.L1	@cond_branch
	bl	loadPalette
.L1:
	ldr	r0, [r4]
	ldr	r1, [r0]
	lsl	r0, r1, #0x5
	add	r0, r0, r1
	lsl	r0, r0, #0x2
	add	r1, r5, #0
	add	r1, r1, #0x7c
	add	r0, r0, r1
	ldr	r0, [r0]
	cmp	r0, #0
	beq	.L2	@cond_branch
	bl	loadPalette2
.L2:
	pop	{r4, r5}
	pop	{r0}
	bx	r0
.L4:
	.align	2, 0
.L3:
	.4byte	0x3000be0
	.4byte	0x806a828
	.4byte	0xfffffb24
	thumb_func_end sub_80498F8

.align 2, 0 @ Don't pad with nop.
