	.include "asm/common.inc"

	thumb_func_start InitCurrentGameState
InitCurrentGameState:
	push	{r4, r5, lr}
	ldr	r5, .L2
	add	r0, r5, #0
	bl	slowAllocate
	add	r4, r0, #0
	cmp	r4, #0
	bne	.L1	@cond_branch
	ldr	r0, .L2 + 4
	add	r1, r5, #0
	bl	printf
.L1:
	ldr	r3, .L2 + 8
	ldr	r1, [r4]
	str	r1, [r3]
	mov	r2, #0xd6
	lsl	r2, r2, #0x3
	add	r0, r1, r2
	str	r4, [r0]
	mov	r4, #0x0
	strb	r4, [r1]
	ldr	r2, [r3]
	ldr	r0, .L2 + 12
	add	r1, r2, r0
	mov	r0, #0x1
	str	r0, [r1]
	strb	r4, [r2, #0x2]
	ldr	r1, [r3]
	ldr	r0, .L2 + 16
	add	r2, r1, r0
	mov	r0, #0x80
	strh	r0, [r2]
	ldr	r0, .L2 + 20
	add	r2, r1, r0
	mov	r0, #0xff
	strh	r0, [r2]
	ldr	r2, .L2 + 24
	add	r0, r1, r2
	strh	r4, [r0]
	add	r2, r2, #0x2
	add	r0, r1, r2
	strh	r4, [r0]
	ldr	r2, .L2 + 28
	add	r0, r1, r2
	str	r4, [r0]
	ldr	r0, .L2 + 32
	add	r1, r1, r0
	str	r4, [r1]
	bl	sub_80510FC
	pop	{r4, r5}
	pop	{r0}
	bx	r0
.L3:
	.align	2, 0
.L2:
	.4byte	0xc6c
	.4byte	0x87293c0
	.4byte	0x3000f48
	.4byte	0x6b4
	.4byte	0x6e6
	.4byte	0x6e4
	.4byte	0x6ac
	.4byte	0xc64
	.4byte	0xc68
	thumb_func_end InitCurrentGameState

.align 2, 0 @ Don't pad with nop.
