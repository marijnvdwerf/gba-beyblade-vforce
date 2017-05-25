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
	ldr	r0, .L3
	bl	nullsub_9
	ldr	r0, .L3 + 4
	mov	r2, #0x0
	ldsh	r1, [r4, r2]
	ldr	r2, .L3 + 8
	mov	r7, #0x2
	ldsh	r3, [r4, r7]
	bl	nullsub_10
	lsl	r0, r5, #0x10
	cmp	r0, #0
	blt	.L1	@cond_branch
.L2:
	lsl	r0, r5, #0x10
	asr	r0, r0, #0xd
	ldr	r4, [r6, #0x8]
	add	r4, r4, r0
	mov	r0, #0x4
	ldsh	r1, [r4, r0]
	mov	r2, #0x2
	ldsh	r3, [r4, r2]
	ldr	r0, .L3 + 12
	ldr	r2, .L3 + 16
	bl	nullsub_10
	ldrh	r5, [r4, #0x2]
	mov	r7, #0x2
	ldsh	r0, [r4, r7]
	cmp	r0, #0
	bge	.L2	@cond_branch
.L1:
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L4:
	.align	2, 0
.L3:
	.4byte	0x87557fc
	.4byte	0x8755810
	.4byte	0x875581c
	.4byte	0x8755828
	.4byte	0x875575c
	thumb_func_end sub_805FE68

.align 2, 0 @ Don't pad with nop.
