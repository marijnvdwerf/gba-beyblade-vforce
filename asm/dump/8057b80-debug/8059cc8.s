	.include "asm/common.inc"

	thumb_func_start sub_8059CC8
sub_8059CC8:
	push	{r4, lr}
	add	r4, r1, #0
	lsl	r0, r0, #0x18
	lsr	r0, r0, #0x18
	lsl	r4, r4, #0x18
	lsr	r4, r4, #0x18
	bl	GetBGLayerCntPtr
	mov	r1, #0x3
	and	r4, r4, r1
	mov	r1, #0x4
	NEG	r1, r1
	ldrb	r2, [r0]
	and	r1, r1, r2
	orr	r1, r1, r4
	strb	r1, [r0]
	pop	{r4}
	pop	{r0}
	bx	r0
	thumb_func_end sub_8059CC8

.align 2, 0 @ Don't pad with nop.
