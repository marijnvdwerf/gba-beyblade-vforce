	.include "asm/common.inc"

	thumb_func_start sub_805FD80
sub_805FD80:
	push	{r4, r5, r6, lr}
	add	r5, r0, #0
	lsl	r2, r2, #0x10
	lsl	r1, r1, #0x10
	asr	r1, r1, #0xd
	ldr	r4, [r5, #0x8]
	add	r3, r4, r1
	lsr	r6, r2, #0x10
	asr	r2, r2, #0xe
	ldr	r0, [r5, #0xc]
	add	r2, r0, r2
	mov	r1, #0x4
	ldsh	r0, [r3, r1]
	cmp	r0, #0
	bge	.L805FDA4	@cond_branch
	ldrh	r0, [r3, #0x2]
	strh	r0, [r2]
	b	.L805FDB0
.L805FDA4:
	mov	r1, #0x4
	ldsh	r0, [r3, r1]
	lsl	r0, r0, #0x3
	add	r0, r4, r0
	ldrh	r1, [r3, #0x2]
	strh	r1, [r0, #0x2]
.L805FDB0:
	mov	r1, #0x2
	ldsh	r0, [r3, r1]
	cmp	r0, #0
	bge	.L805FDBE	@cond_branch
	ldrh	r0, [r3, #0x4]
	strh	r0, [r2, #0x2]
	b	.L805FDCC
.L805FDBE:
	mov	r1, #0x2
	ldsh	r0, [r3, r1]
	lsl	r0, r0, #0x3
	ldr	r1, [r5, #0x8]
	add	r1, r1, r0
	ldrh	r0, [r3, #0x4]
	strh	r0, [r1, #0x4]
.L805FDCC:
	mov	r1, #0x2
	ldsh	r0, [r2, r1]
	cmp	r0, #0
	bge	.L805FDF8	@cond_branch
	mov	r1, #0x0
	ldsh	r0, [r2, r1]
	cmp	r0, #0
	bge	.L805FDF8	@cond_branch
	lsl	r1, r6, #0x10
	asr	r2, r1, #0x15
	ldr	r0, [r5, #0x10]
	lsl	r2, r2, #0x2
	add	r2, r2, r0
	mov	r0, #0xf8
	lsl	r0, r0, #0xd
	and	r0, r0, r1
	asr	r0, r0, #0x10
	mov	r1, #0x1
	lsl	r1, r0
	ldr	r0, [r2]
	bic	r0, r1
	str	r0, [r2]
.L805FDF8:
	ldrh	r0, [r5]
	sub	r0, r0, #0x1
	strh	r0, [r5]
	pop	{r4, r5, r6}
	pop	{r0}
	bx	r0
	thumb_func_end sub_805FD80

.align 2, 0 @ Don't pad with nop.
