	.include "asm/common.inc"

	thumb_func_start allocateBeyBladeActorPalette
allocateBeyBladeActorPalette:
	push	{r4, r5, lr}
	add	r4, r0, #0
	add	r5, r1, #0
	bl	getBeybladeData0
	ldr	r0, .L1
	lsl	r4, r4, #0x2
	add	r4, r4, r0
	ldr	r0, [r4]
	ldr	r1, .L1 + 4
	lsl	r5, r5, #0x5
	ldr	r2, .L1 + 8
	add	r5, r5, r2
	ldr	r3, [r1]
	add	r1, r5, #0
	mov	r2, #0x20
	bl	_call_via_r3
	pop	{r4, r5}
	pop	{r0}
	bx	r0
.L2:
	.align	2, 0
.L1:
	.4byte	0x807ab38
	.4byte	0x807d974
	.4byte	0x5000200
	thumb_func_end allocateBeyBladeActorPalette

.align 2, 0 @ Don't pad with nop.
