	.include "asm/common.inc"

	thumb_func_start sub_8059C18
sub_8059C18:
	push	{r4, r5, r6, lr}
	mov	r6, sl
	mov	r5, r9
	mov	r4, r8
	push	{r4, r5, r6}
	add	r4, r0, #0
	add	r6, r1, #0
	mov	r8, r2
	mov	r9, r3
	lsl	r4, r4, #0x18
	lsr	r4, r4, #0x18
	lsl	r6, r6, #0x18
	lsr	r6, r6, #0x18
	mov	r0, r8
	lsl	r0, r0, #0x18
	lsr	r0, r0, #0x18
	mov	r8, r0
	mov	r1, r9
	lsl	r1, r1, #0x18
	lsr	r1, r1, #0x18
	mov	r9, r1
	mov	r0, #0x0
	bl	GetBGLayerCntPtr
	mov	r2, #0x3
	mov	sl, r2
	mov	r1, sl
	and	r4, r4, r1
	mov	r5, #0x4
	NEG	r5, r5
	add	r1, r5, #0
	ldrb	r2, [r0]
	and	r1, r1, r2
	orr	r1, r1, r4
	strb	r1, [r0]
	mov	r0, #0x1
	bl	GetBGLayerCntPtr
	mov	r1, sl
	and	r6, r6, r1
	add	r1, r5, #0
	ldrb	r2, [r0]
	and	r1, r1, r2
	orr	r1, r1, r6
	strb	r1, [r0]
	mov	r0, #0x2
	bl	GetBGLayerCntPtr
	mov	r1, r8
	mov	r2, sl
	and	r1, r1, r2
	mov	r8, r1
	add	r1, r5, #0
	ldrb	r2, [r0]
	and	r1, r1, r2
	mov	r2, r8
	orr	r1, r1, r2
	strb	r1, [r0]
	mov	r0, #0x3
	bl	GetBGLayerCntPtr
	mov	r1, r9
	mov	r2, sl
	and	r1, r1, r2
	mov	r9, r1
	ldrb	r1, [r0]
	and	r5, r5, r1
	mov	r2, r9
	orr	r5, r5, r2
	strb	r5, [r0]
	pop	{r3, r4, r5}
	mov	r8, r3
	mov	r9, r4
	mov	sl, r5
	pop	{r4, r5, r6}
	pop	{r0}
	bx	r0
	thumb_func_end sub_8059C18

.align 2, 0 @ Don't pad with nop.
