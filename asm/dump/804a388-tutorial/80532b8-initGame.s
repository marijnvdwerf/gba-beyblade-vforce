	.include "asm/common.inc"

	thumb_func_start initGame
initGame:
	push	{r4, r5, lr}
	ldr	r0, .L8053344
	bl	slowAllocate
	ldr	r1, .L8053344 + 4
	str	r0, [r1]
	ldr	r4, .L8053344 + 8
	ldr	r1, [r0]
	str	r1, [r4]
	ldr	r0, .L8053344 + 12
	mov	r2, #0xb1
	lsl	r2, r2, #0x5
	add	r1, r1, r2
	ldr	r3, [r0]
	mov	r0, #0x0
	mov	r2, #0x18
	bl	_call_via_r3
	ldr	r1, [r4]
	ldr	r3, .L8053344 + 16
	add	r2, r1, r3
	ldr	r5, .L8053344 + 20
	add	r3, r5, #0
	ldrh	r0, [r2]
	orr	r0, r0, r3
	strh	r0, [r2]
	ldr	r2, .L8053344 + 24
	add	r0, r1, r2
	mov	r2, #0x1
	NEG	r2, r2
	str	r2, [r0]
	ldr	r5, .L8053344 + 28
	add	r0, r1, r5
	str	r2, [r0]
	ldr	r2, .L8053344 + 32
	add	r0, r1, r2
	ldrh	r5, [r0]
	orr	r3, r3, r5
	strh	r3, [r0]
	mov	r2, #0xf4
	lsl	r2, r2, #0x3
	add	r0, r1, r2
	mov	r2, #0x0
	str	r2, [r0]
	ldr	r3, .L8053344 + 36
	add	r1, r1, r3
	strb	r2, [r1]
	ldr	r0, [r4]
	ldr	r5, .L8053344 + 40
	add	r1, r0, r5
	str	r2, [r1]
	ldr	r1, .L8053344 + 44
	add	r0, r0, r1
	strb	r2, [r0]
	ldr	r0, [r4]
	mov	r3, #0xb2
	lsl	r3, r3, #0x5
	add	r0, r0, r3
	strb	r2, [r0]
	ldr	r0, [r4]
	add	r5, r5, #0x24
	add	r0, r0, r5
	str	r2, [r0]
	mov	r0, #0x1
	bl	sub_8053F0C
	pop	{r4, r5}
	pop	{r0}
	bx	r0
.L8053342:
	.align	2, 0
.L8053344:
	.4byte	0x1644
	.4byte	_levelDataBlockPtr
	.4byte	_gameData
	.4byte	__fastMemoryClearARM
	.4byte	0xc24
	.4byte	0xffff
	.4byte	0xc28
	.4byte	0xc2c
	.4byte	0xc26
	.4byte	0xb56
	.4byte	0xb34
	.4byte	0x1638
	thumb_func_end initGame

.align 2, 0 @ Don't pad with nop.
