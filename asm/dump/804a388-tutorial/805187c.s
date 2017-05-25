	.include "asm/common.inc"

	thumb_func_start sub_805187C
sub_805187C:
	push	{r4, lr}
	ldr	r1, .L1
	ldr	r2, [r1]
	mov	r1, #0xd8
	lsl	r1, r1, #0x3
	add	r3, r2, r1
	ldr	r1, [r0, #0x4]
	str	r1, [r3]
	ldr	r4, .L1 + 4
	add	r3, r2, r4
	ldr	r1, [r0]
	str	r1, [r3]
	ldrh	r3, [r0, #0x8]
	add	r4, r4, #0x8
	add	r1, r2, r4
	strh	r3, [r1]
	ldrh	r3, [r0, #0xa]
	add	r4, r4, #0x2
	add	r1, r2, r4
	strh	r3, [r1]
	ldrh	r3, [r0, #0xc]
	add	r4, r4, #0x2
	add	r1, r2, r4
	strh	r3, [r1]
	ldrh	r0, [r0, #0xe]
	ldr	r1, .L1 + 8
	add	r2, r2, r1
	strh	r0, [r2]
	pop	{r4}
	pop	{r0}
	bx	r0
.L2:
	.align	2, 0
.L1:
	.4byte	0x3000f48
	.4byte	0x6bc
	.4byte	0x6ca
	thumb_func_end sub_805187C

.align 2, 0 @ Don't pad with nop.
