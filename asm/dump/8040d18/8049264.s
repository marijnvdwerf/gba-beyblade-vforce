	.include "asm/common.inc"

	thumb_func_start sub_8049264
sub_8049264:
	push	{r4, r5, r6, lr}
	ldr	r0, .L1
	ldr	r0, [r0]
	ldr	r1, .L1 + 4
	add	r0, r0, r1
	ldr	r1, .L1 + 8
	strh	r1, [r0]
	ldr	r4, .L1 + 12
	mov	r5, #0x0
	str	r5, [r4, #0x4]
	str	r5, [r4, #0xc]
	mov	r0, #0x7
	bl	sub_804924C
	mov	r0, #0x1
	NEG	r0, r0
	str	r0, [r4]
	str	r0, [r4, #0x8]
	add	r0, r4, #0
	add	r0, r0, #0x7c
	strb	r5, [r0]
	mov	r2, #0x8b
	lsl	r2, r2, #0x3
	add	r0, r4, r2
	bl	sub_8050384
	ldr	r6, .L1 + 16
	add	r0, r4, r6
	str	r5, [r0]
	mov	r1, #0x8e
	lsl	r1, r1, #0x3
	add	r0, r4, r1
	str	r5, [r0]
	ldr	r2, .L1 + 20
	add	r0, r4, r2
	mov	r1, #0x0
	strh	r5, [r0]
	add	r6, r6, #0x5d
	add	r0, r4, r6
	strb	r1, [r0]
	mov	r0, #0xaf
	lsl	r0, r0, #0x3
	add	r3, r4, r0
	add	r6, r6, #0xfb
	add	r2, r4, r6
	add	r6, r6, #0x4
	add	r0, r4, r6
	str	r5, [r0]
	str	r5, [r2]
	str	r5, [r3]
	add	r0, r4, #0
	add	r0, r0, #0x80
	strb	r1, [r0]
	sub	r0, r0, #0x1
	strb	r1, [r0]
	ldr	r2, .L1 + 24
	add	r0, r4, r2
	strb	r1, [r0]
	add	r6, r6, #0x5
	add	r0, r4, r6
	strb	r1, [r0]
	add	r2, r2, #0x2
	add	r0, r4, r2
	strb	r1, [r0]
	add	r6, r6, #0x3
	add	r0, r4, r6
	str	r5, [r0]
	add	r2, r2, #0x6
	add	r0, r4, r2
	str	r5, [r0]
	add	r0, r4, #0
	add	r0, r0, #0x81
	strb	r1, [r0]
	add	r6, r6, #0x20
	add	r4, r4, r6
	str	r5, [r4]
	pop	{r4, r5, r6}
	pop	{r0}
	bx	r0
.L2:
	.align	2, 0
.L1:
	.4byte	0x3000fb0
	.4byte	0xc26
	.4byte	0xffff
	.4byte	0x3000650
	.4byte	0x424
	.4byte	0x474
	.4byte	0x584
	thumb_func_end sub_8049264

.align 2, 0 @ Don't pad with nop.
