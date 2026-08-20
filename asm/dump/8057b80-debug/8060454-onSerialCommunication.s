	.include "asm/common.inc"

	thumb_func_start onSerialCommunication
onSerialCommunication:
	push	{lr}
	mov	r1, #0x0
	ldr	r0, .L80604B0
	ldrh	r0, [r0]
	ldr	r2, .L80604B0 + 4
	cmp	r0, r2
	bne	.L8060464	@cond_branch
	mov	r1, #0x1
.L8060464:
	ldr	r0, .L80604B0 + 8
	ldrh	r0, [r0]
	cmp	r0, r2
	bne	.L8060472	@cond_branch
	add	r0, r1, #1
	lsl	r0, r0, #0x10
	lsr	r1, r0, #0x10
.L8060472:
	ldr	r0, .L80604B0 + 12
	ldrh	r0, [r0]
	cmp	r0, r2
	bne	.L8060480	@cond_branch
	add	r0, r1, #1
	lsl	r0, r0, #0x10
	lsr	r1, r0, #0x10
.L8060480:
	ldr	r0, .L80604B0 + 16
	ldrh	r0, [r0]
	cmp	r0, r2
	bne	.L806048E	@cond_branch
	add	r0, r1, #1
	lsl	r0, r0, #0x10
	lsr	r1, r0, #0x10
.L806048E:
	ldr	r0, .L80604B0 + 20
	ldr	r2, [r0]
	ldrb	r0, [r2, #0x4]
	cmp	r1, r0
	bcc	.L80604AC	@cond_branch
	ldr	r1, .L80604B0 + 24
	ldr	r0, .L80604B0 + 28
	ldr	r0, [r0]
	str	r0, [r1, #0x1c]
	ldr	r1, .L80604B0 + 32
	ldr	r0, [r2, #0x3c]
	ldrh	r0, [r0]
	strh	r0, [r1]
	bl	sub_8060404
.L80604AC:
	pop	{r0}
	bx	r0
.L80604B0:
	.align	2, 0

	.4byte	0x4000120
	.4byte	0xdeaf
	.4byte	0x4000122
	.4byte	0x4000124
	.4byte	0x4000126
	.4byte	_unk3005DC4
	.4byte	_unk3000DF0
	.4byte	__sub_8757FCC
	.4byte	0x400012a
	thumb_func_end onSerialCommunication

.align 2, 0 @ Don't pad with nop.
