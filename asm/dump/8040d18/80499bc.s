	.include "asm/common.inc"

	thumb_func_start sub_80499BC
sub_80499BC:
	push	{r4, r5, lr}
	add	sp, sp, #0xfffffffc
	mov	r0, #0x0
	bl	sub_8049344
	ldr	r0, .L1
	mov	r1, #0x0
	strh	r1, [r0]
	sub	r0, r0, #0x54
	strh	r1, [r0]
	ldr	r0, .L1 + 4
	ldr	r2, .L1 + 8
	add	r1, r0, r2
	ldr	r3, .L1 + 12
	add	r5, r0, r3
	add	r3, r3, #0xb4
	add	r2, r0, r3
	ldr	r2, [r2]
	ldr	r3, [r2]
	lsl	r2, r3, #0x5
	add	r2, r2, r3
	lsl	r2, r2, #0x2
	ldr	r3, .L1 + 16
	add	r2, r2, r3
	mov	r3, #0x82
	lsl	r3, r3, #0x5
	mov	r4, #0x1
	str	r4, [sp]
	bl	newLayerManagement
	bl	VBlankIntrWait
	add	r0, r5, #0
	bl	sub_804A280
	bl	sub_80627F0
	add	sp, sp, #0x4
	pop	{r4, r5}
	pop	{r0}
	bx	r0
.L2:
	.align	2, 0
.L1:
	.4byte	0x4000054
	.4byte	0x3000be0
	.4byte	0xfffffb28
	.4byte	0xfffffa70
	.4byte	0x806a828
	thumb_func_end sub_80499BC

.align 2, 0 @ Don't pad with nop.
