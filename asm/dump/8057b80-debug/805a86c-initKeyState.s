	.include "asm/common.inc"

	thumb_func_start initKeyState
initKeyState:
	push	{r4, r5, r6, r7, lr}
	mov	r7, r9
	mov	r6, r8
	push	{r6, r7}
	ldr	r2, .L2
	ldr	r0, .L2 + 4
	ldrh	r1, [r0]
	MVN	r1, r1
	strh	r1, [r2]
	ldr	r0, .L2 + 8
	strh	r1, [r0]
	ldr	r2, .L2 + 12
	mov	r0, #0x0
	strh	r0, [r2]
	ldr	r0, .L2 + 16
	strh	r1, [r0]
	ldr	r0, .L2 + 20
	mov	r1, #0x0
	str	r1, [r0]
	ldr	r0, .L2 + 24
	str	r1, [r0]
	mov	r5, #0x0
	ldr	r0, .L2 + 28
	mov	r9, r0
	ldr	r1, .L2 + 32
	mov	ip, r1
	mov	r4, #0x0
	mov	r0, #0x8
	ADD r0, ip
	mov	r8, r0
	mov	r7, ip
	add	r7, r7, #0x4
	mov	r6, ip
	add	r6, r6, #0x14
.L1:
	lsl	r2, r5, #0x1
	add	r2, r2, r5
	lsl	r2, r2, #0x3
	mov	r1, ip
	add	r3, r2, r1
	str	r4, [r3]
	add	r0, r2, r7
	str	r4, [r0]
	add	r0, r2, r6
	str	r4, [r0]
	mov	r0, ip
	add	r0, r0, #0xc
	add	r0, r2, r0
	mov	r1, #0x64
	str	r1, [r0]
	ADD r2, r8
	str	r4, [r2]
	strh	r4, [r3, #0x10]
	add	r0, r5, #1
	lsl	r0, r0, #0x18
	lsr	r5, r0, #0x18
	cmp	r5, #0x9
	bls	.L1	@cond_branch
	mov	r0, #0x0
	mov	r1, r9
	strh	r0, [r1]
	pop	{r3, r4}
	mov	r8, r3
	mov	r9, r4
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L3:
	.align	2, 0
.L2:
	.4byte	0x3005ca0
	.4byte	0x4000130
	.4byte	0x3005da0
	.4byte	0x3005dac
	.4byte	0x3005da4
	.4byte	0x3005dbc
	.4byte	0x3005db0
	.4byte	0x3005ca4
	.4byte	0x3005cb0
	thumb_func_end initKeyState

.align 2, 0 @ Don't pad with nop.
