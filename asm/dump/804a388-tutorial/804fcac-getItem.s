	.include "asm/common.inc"

	thumb_func_start getItem
getItem:
	push	{r4, r5, r6, lr}
	mov	r6, r8
	push	{r6}
	add	sp, sp, #0xfffffffc
	mov	r8, r0
	ldr	r0, .L1
	ldr	r4, [r0]
	mov	r0, #0xf5
	lsl	r0, r0, #0x4
	add	r6, r4, r0
	bl	getLevelDescription2
	bl	sub_804FD64
	ldr	r2, .L1 + 4
	add	r1, r4, r2
	mov	r0, #0x22
	ldrh	r2, [r1]
	orr	r0, r0, r2
	strh	r0, [r1]
	ldr	r5, .L1 + 8
	bl	getLanguage
	lsl	r0, r0, #0x2
	add	r0, r0, r5
	ldr	r1, [r0]
	add	r0, r6, #0
	mov	r2, #0xd
	bl	sub_8061660
	mov	r0, #0xf8
	lsl	r0, r0, #0x4
	add	r5, r4, r0
	mov	r0, r8
	bl	sub_8057048
	add	r1, r0, #0
	add	r0, r5, #0
	mov	r2, #0xc
	bl	sub_8061660
	ldr	r2, .L1 + 12
	add	r5, r4, r2
	ldr	r0, .L1 + 16
	add	r1, r4, r0
	add	r0, r5, #0
	mov	r2, #0x2
	bl	newMotionGroup
	mov	r1, #0xdc
	lsl	r1, r1, #0x7
	mov	r2, #0x80
	lsl	r2, r2, #0x1
	add	r0, r5, #0
	bl	sub_8050578
	mov	r0, #0x14
	str	r0, [sp]
	add	r0, r5, #0
	mov	r1, #0x0
	mov	r2, #0x34
	mov	r3, #0x0
	bl	sub_80504E4
	mov	r2, #0x82
	lsl	r2, r2, #0x5
	add	r1, r4, r2
	mov	r0, #0x80
	str	r0, [r1]
	ldr	r0, .L1 + 20
	add	r4, r4, r0
	mov	r0, #0x6
	strh	r0, [r4]
	add	sp, sp, #0x4
	pop	{r3}
	mov	r8, r3
	pop	{r4, r5, r6}
	pop	{r0}
	bx	r0
.L2:
	.align	2, 0
.L1:
	.4byte	0x3000fb0
	.4byte	0x105e
	.4byte	0x806e774
	.4byte	0x1010
	.4byte	0xf64
	.4byte	0x105a
	thumb_func_end getItem

.align 2, 0 @ Don't pad with nop.
