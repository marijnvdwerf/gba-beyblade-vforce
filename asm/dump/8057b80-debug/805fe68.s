	.include "asm/common.inc"

	thumb_func_start sub_805FE68
sub_805FE68:
	push	{r4, r5, r6, r7, lr}
	add	r6, r0, #0
	lsl	r1, r1, #0x10
	lsr	r1, r1, #0x10
	lsl	r0, r1, #0x2
	ldr	r4, [r6, #0xc]
	add	r4, r4, r0
	ldrh	r5, [r4]
	ldr	r0, .L805FEBC
	bl	nullsub_9
	ldr	r0, .L805FEBC + 4
	mov	r2, #0x0
	ldsh	r1, [r4, r2]
	ldr	r2, .L805FEBC + 8
	mov	r7, #0x2
	ldsh	r3, [r4, r7]
	bl	nullsub_10
	lsl	r0, r5, #0x10
	cmp	r0, #0
	blt	.L805FEB6	@cond_branch
.L805FE94:
	lsl	r0, r5, #0x10
	asr	r0, r0, #0xd
	ldr	r4, [r6, #0x8]
	add	r4, r4, r0
	mov	r0, #0x4
	ldsh	r1, [r4, r0]
	mov	r2, #0x2
	ldsh	r3, [r4, r2]
	ldr	r0, .L805FEBC + 12
	ldr	r2, .L805FEBC + 16
	bl	nullsub_10
	ldrh	r5, [r4, #0x2]
	mov	r7, #0x2
	ldsh	r0, [r4, r7]
	cmp	r0, #0
	bge	.L805FE94	@cond_branch
.L805FEB6:
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L805FEBC:
	.align	2, 0

	.4byte	Str_87557FC
	.4byte	Str_8755810
	.4byte	Str_875581C
	.4byte	Str_8755828
	.4byte	Str_875575C
	thumb_func_end sub_805FE68

.align 2, 0 @ Don't pad with nop.
