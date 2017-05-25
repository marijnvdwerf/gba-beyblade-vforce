	.include "asm/common.inc"

	thumb_func_start sub_8049950
sub_8049950:
	push	{r4, r5, lr}
	add	sp, sp, #0xfffffffc
	mov	r0, #0x0
	bl	sub_8049344
	ldr	r1, .L1
	mov	r0, #0x0
	strh	r0, [r1]
	ldr	r4, .L1 + 4
	ldr	r0, .L1 + 8
	add	r1, r4, r0
	ldr	r2, .L1 + 12
	add	r5, r4, r2
	add	r2, r2, #0xb4
	add	r0, r4, r2
	ldr	r0, [r0]
	ldr	r0, [r0]
	lsl	r2, r0, #0x5
	add	r2, r2, r0
	lsl	r2, r2, #0x2
	ldr	r0, .L1 + 16
	add	r2, r2, r0
	mov	r3, #0x82
	lsl	r3, r3, #0x5
	mov	r0, #0x1
	str	r0, [sp]
	add	r0, r4, #0
	bl	newLayerManagement
	add	r0, r4, #0
	bl	sub_8050894
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
	thumb_func_end sub_8049950

.align 2, 0 @ Don't pad with nop.
