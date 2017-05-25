	.include "asm/common.inc"

	thumb_func_start sub_80439A0
sub_80439A0:
	push	{r4, lr}
	mov	r1, #0x0
	str	r1, [r0, #0x24]
	ldr	r3, .L1
	ldr	r1, .L1 + 4
	ldr	r2, [r1]
	lsr	r2, r2, #0x6
	lsl	r2, r2, #0x18
	lsr	r2, r2, #0x18
	lsl	r1, r2, #0x1
	add	r1, r1, r3
	mov	r4, #0x0
	ldsh	r1, [r1, r4]
	lsl	r1, r1, #0x1
	ldr	r4, .L1 + 8
	add	r1, r1, r4
	str	r1, [r0, #0x14]
	add	r2, r2, #0x40
	lsl	r2, r2, #0x1
	add	r2, r2, r3
	mov	r3, #0x0
	ldsh	r1, [r2, r3]
	lsl	r1, r1, #0x1
	mov	r4, #0x80
	lsl	r4, r4, #0x2
	add	r1, r1, r4
	str	r1, [r0, #0x18]
	add	r0, r0, #0x7c
	mov	r1, #0x3
	ldrb	r2, [r0]
	orr	r1, r1, r2
	strb	r1, [r0]
	pop	{r4}
	pop	{r0}
	bx	r0
.L2:
	.align	2, 0
.L1:
	.4byte	0x874cc3c
	.4byte	0x3000e30
	.4byte	0xffffff00
	thumb_func_end sub_80439A0

.align 2, 0 @ Don't pad with nop.
