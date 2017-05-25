	.include "asm/common.inc"

	thumb_func_start allocateBeybladeObjectPalettes
allocateBeybladeObjectPalettes:
	push	{r4, r5, lr}
	ldr	r0, .L3
	ldr	r0, [r0]
	ldr	r1, .L3 + 4
	add	r4, r0, r1
	mov	r5, #0x0
.L2:
	ldr	r0, [r4]
	cmp	r0, #0
	beq	.L1	@cond_branch
	ldrb	r1, [r4, #0x4]
	add	r0, r5, #0
	bl	allocateBeyBladeActorPalette
.L1:
	add	r4, r4, #0x8
	add	r5, r5, #0x1
	cmp	r5, #0x3b
	ble	.L2	@cond_branch
	pop	{r4, r5}
	pop	{r0}
	bx	r0
.L4:
	.align	2, 0
.L3:
	.4byte	0x3000fb0
	.4byte	0x1110
	thumb_func_end allocateBeybladeObjectPalettes

.align 2, 0 @ Don't pad with nop.
