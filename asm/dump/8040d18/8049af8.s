	.include "asm/common.inc"

	thumb_func_start sub_8049AF8
sub_8049AF8:
	push	{r4, r5, lr}
	add	sp, sp, #0xfffffffc
	ldr	r4, .L1
	ldr	r0, .L1 + 4
	add	r1, r4, r0
	ldr	r2, .L1 + 8
	add	r5, r4, r2
	add	r2, r2, #0xb4
	add	r0, r4, r2
	ldr	r0, [r0]
	ldr	r0, [r0]
	lsl	r2, r0, #0x5
	add	r2, r2, r0
	lsl	r2, r2, #0x2
	ldr	r0, .L1 + 12
	add	r2, r2, r0
	mov	r3, #0x82
	lsl	r3, r3, #0x5
	mov	r0, #0x0
	str	r0, [sp]
	add	r0, r4, #0
	bl	newLayerManagement
	add	r0, r4, #0
	bl	sub_8050894
	ldr	r0, .L1 + 16
	mov	r1, #0xa0
	lsl	r1, r1, #0x13
	mov	r2, #0x80
	lsl	r2, r2, #0x3
	ldr	r3, [r0]
	mov	r0, #0x0
	bl	_call_via_r3
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
	.4byte	0x3000be0
	.4byte	0xfffffb28
	.4byte	0xfffffa70
	.4byte	0x806a828
	.4byte	0x807d970
	thumb_func_end sub_8049AF8

.align 2, 0 @ Don't pad with nop.
