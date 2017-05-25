	.include "asm/common.inc"

	thumb_func_start sub_8049C70
sub_8049C70:
	push	{r4, r5, lr}
	mov	r0, #0x0
	bl	sub_8049344
	ldr	r1, .L1
	mov	r0, #0x0
	strh	r0, [r1]
	ldr	r4, .L1 + 4
	add	r0, r4, #0
	bl	sub_80508A4
	ldr	r0, .L1 + 8
	add	r5, r4, r0
	ldr	r1, .L1 + 12
	add	r0, r4, r1
	ldr	r0, [r0]
	ldr	r0, [r0]
	lsl	r1, r0, #0x5
	add	r1, r1, r0
	lsl	r1, r1, #0x2
	ldr	r0, .L1 + 16
	add	r1, r1, r0
	add	r0, r4, #0
	mov	r2, #0x1
	bl	sub_80508CC
	ldr	r0, .L1 + 20
	add	r4, r4, r0
	ldr	r1, .L1 + 24
	add	r0, r4, #0
	mov	r2, #0x0
	bl	sub_80596AC
	bl	sub_80498D8
	bl	VBlankIntrWait
	add	r0, r5, #0
	bl	sub_804A280
	bl	sub_80627F0
	pop	{r4, r5}
	pop	{r0}
	bx	r0
.L2:
	.align	2, 0
.L1:
	.4byte	0x4000054
	.4byte	0x3000be0
	.4byte	0xfffffa70
	.4byte	0xfffffb24
	.4byte	0x806a828
	.4byte	0xfffffc38
	.4byte	0xffff0000
	thumb_func_end sub_8049C70

.align 2, 0 @ Don't pad with nop.
