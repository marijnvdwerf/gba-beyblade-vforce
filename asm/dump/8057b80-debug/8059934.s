	.include "asm/common.inc"

	thumb_func_start sub_8059934
sub_8059934:
	push	{r4, r5, lr}
	ldr	r0, .L2
	mov	r1, #0x0
	strb	r1, [r0]
	ldr	r0, .L2 + 4
	strb	r1, [r0]
	ldr	r1, .L2 + 8
	mov	r0, #0x20
	strb	r0, [r1]
	mov	r4, #0x0
	mov	r5, #0x0
.L1:
	add	r0, r4, #0
	bl	GetBGLayerHOffsetPtr
	strh	r5, [r0]
	add	r0, r4, #0
	bl	GetBGLayerVOffsetPtr
	strh	r5, [r0]
	add	r0, r4, #1
	lsl	r0, r0, #0x18
	lsr	r4, r0, #0x18
	cmp	r4, #0x3
	bls	.L1	@cond_branch
	mov	r4, #0x80
	lsl	r4, r4, #0x1
	mov	r0, #0x2
	mov	r1, #0x0
	add	r2, r4, #0
	add	r3, r4, #0
	bl	sub_8059B00
	mov	r0, #0x3
	mov	r1, #0x0
	add	r2, r4, #0
	add	r3, r4, #0
	bl	sub_8059B00
	pop	{r4, r5}
	pop	{r0}
	bx	r0
.L3:
	.align	2, 0
.L2:
	.4byte	0x3000de0
	.4byte	0x3000e40
	.4byte	0x3000e3c
	thumb_func_end sub_8059934

.align 2, 0 @ Don't pad with nop.
