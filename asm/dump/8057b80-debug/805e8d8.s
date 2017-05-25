	.include "asm/common.inc"

	thumb_func_start sub_805E8D8
sub_805E8D8:
	push	{r4, r5, r6, r7, lr}
	mov	r7, sl
	mov	r6, r9
	mov	r5, r8
	push	{r5, r6, r7}
	add	sp, sp, #0xffffffd8
	add	r5, r0, #0
	mov	r8, r1
	str	r3, [sp, #0x10]
	lsl	r2, r2, #0x10
	lsr	r2, r2, #0x10
	str	r2, [sp, #0xc]
	mov	r0, #0x0
	str	r0, [sp, #0x14]
	mov	r1, #0x88
	lsl	r1, r1, #0x2
	add	r0, r5, r1
	mov	r2, r8
	str	r2, [r0]
	mov	r3, #0x89
	lsl	r3, r3, #0x2
	add	r0, r5, r3
	ldr	r4, [sp, #0x14]
	str	r4, [r0]
	mov	r7, #0xd5
	lsl	r7, r7, #0x2
	add	r1, r5, r7
	mov	r0, #0x2
	NEG	r0, r0
	ldrb	r2, [r1]
	and	r0, r0, r2
	strb	r0, [r1]
	mov	r3, #0xd1
	lsl	r3, r3, #0x2
	add	r0, r5, r3
	str	r4, [r0]
	mov	r4, #0xd2
	lsl	r4, r4, #0x2
	add	r0, r5, r4
	ldr	r7, [sp, #0x14]
	str	r7, [r0]
	ldr	r0, .L6
	add	r1, r5, r0
	mov	r0, #0xf
	strb	r0, [r1]
	ldr	r2, .L6 + 4
	add	r1, r5, r2
	mov	r0, #0xff
	strb	r0, [r1]
	add	r3, r3, #0x18
	add	r0, r5, r3
	strh	r7, [r0]
	ldr	r7, .L6 + 8
	add	r0, r5, r7
	mov	r1, sp
	ldrh	r1, [r1, #0x14]
	strh	r1, [r0]
	add	r2, r2, #0xa
	add	r1, r5, r2
	mov	r0, #0xf0
	strh	r0, [r1]
	add	r3, r3, #0x6
	add	r1, r5, r3
	mov	r0, #0xa0
	strh	r0, [r1]
	add	r4, r4, #0x1c
	add	r0, r5, r4
	ldr	r7, [sp, #0x14]
	str	r7, [r0]
	mov	r1, #0xda
	lsl	r1, r1, #0x2
	add	r0, r5, r1
	str	r7, [r0]
	ldr	r1, .L6 + 12
	ldr	r2, .L6 + 16
	add	r0, r2, #0
	strh	r0, [r1]
	bl	sub_8059934
	str	r5, [sp, #0x18]
	mov	r3, r8
	add	r3, r3, #0x14
	str	r3, [sp, #0x1c]
	mov	r2, #0x0
	str	r3, [sp, #0x20]
.L8:
	lsl	r2, r2, #0x18
	asr	r3, r2, #0x18
	lsl	r1, r3, #0x3
	ldr	r4, [sp, #0x10]
	add	r0, r4, r1
	ldr	r0, [r0]
	mov	sl, r0
	add	r0, r4, #0
	add	r0, r0, #0x4
	add	r0, r0, r1
	ldr	r0, [r0]
	mov	r9, r0
	lsl	r0, r3, #0x1
	add	r0, r0, r3
	lsl	r4, r0, #0x3
	ldr	r7, [sp, #0x20]
	add	r0, r7, r4
	ldr	r0, [r0]
	mov	ip, r0
	add	r6, r2, #0
	cmp	r0, #0
	beq	.L5	@cond_branch
	mov	r0, #0x1
	LSL	r0, r3
	ldr	r1, [sp, #0x14]
	orr	r0, r0, r1
	lsl	r0, r0, #0x18
	lsr	r0, r0, #0x18
	str	r0, [sp, #0x14]
	lsl	r0, r3, #0x4
	add	r0, r0, r3
	lsl	r0, r0, #0x3
	add	r0, r5, r0
	str	r0, [sp, #0x24]
	ldr	r2, [sp, #0x18]
	cmp	r0, r2
	beq	.L4	@cond_branch
	mov	r0, r8
	add	r0, r0, #0x18
	add	r0, r0, r4
	ldr	r3, [r0]
	mov	r2, r8
	add	r2, r2, #0x1c
	cmp	r3, #0
	bne	.L3	@cond_branch
	add	r0, r2, r4
	ldr	r0, [r0]
	cmp	r0, #0
	beq	.L4	@cond_branch
.L3:
	lsr	r1, r6, #0x18
	mov	r0, r8
	add	r0, r0, #0x20
	add	r0, r0, r4
	ldr	r0, [r0]
	mov	r7, #0x1
	orr	r0, r0, r7
	lsl	r0, r0, #0x10
	lsr	r0, r0, #0x10
	str	r0, [sp]
	ldr	r7, [sp, #0x1c]
	ldr	r0, [r7, #0x4]
	sub	r0, r0, r3
	asr	r0, r0, #0x8
	str	r0, [sp, #0x4]
	add	r2, r2, r4
	ldr	r0, [r7, #0x8]
	ldr	r2, [r2]
	sub	r0, r0, r2
	asr	r0, r0, #0x8
	str	r0, [sp, #0x8]
	ldr	r0, [sp, #0x24]
	mov	r2, ip
	mov	r3, #0x40
	bl	sub_8058968
	b	.L5
.L7:
	.align	2, 0
.L6:
	.4byte	0x355
	.4byte	0x356
	.4byte	0x35e
	.4byte	0x4000050
	.4byte	0x3fff
.L4:
	asr	r2, r6, #0x18
	lsl	r0, r2, #0x4
	add	r0, r0, r2
	lsl	r0, r0, #0x3
	add	r0, r5, r0
	lsr	r1, r6, #0x18
	lsl	r4, r2, #0x1
	add	r4, r4, r2
	lsl	r4, r4, #0x3
	ldr	r3, [sp, #0x20]
	add	r2, r3, r4
	ldr	r2, [r2]
	mov	r3, r8
	add	r3, r3, #0x20
	add	r3, r3, r4
	ldr	r3, [r3]
	mov	r4, #0x1
	orr	r3, r3, r4
	lsl	r3, r3, #0x10
	lsr	r3, r3, #0x10
	str	r3, [sp]
	mov	r7, sl
	str	r7, [sp, #0x4]
	mov	r3, r9
	str	r3, [sp, #0x8]
	mov	r3, #0x40
	bl	sub_8058968
.L5:
	mov	r4, #0x80
	lsl	r4, r4, #0x11
	add	r0, r6, r4
	lsr	r2, r0, #0x18
	asr	r0, r0, #0x18
	cmp	r0, #0x3
	ble	.L8	@cond_branch
	mov	r0, r8
	add	r0, r0, #0x74
	ldrb	r3, [r0]
	lsl	r0, r3, #0x1e
	lsr	r0, r0, #0x1e
	lsl	r1, r3, #0x1c
	lsr	r1, r1, #0x1e
	lsl	r2, r3, #0x1a
	lsr	r2, r2, #0x1e
	lsr	r3, r3, #0x6
	bl	sub_8059C18
	mov	r7, r8
	ldr	r0, [r7, #0x78]
	cmp	r0, #0
	beq	.L9	@cond_branch
	bl	loadPalette
.L9:
	mov	r1, r8
	ldr	r0, [r1, #0x7c]
	cmp	r0, #0
	beq	.L10	@cond_branch
	bl	loadPalette2
.L10:
	mov	r0, r8
	add	r0, r0, #0x80
	ldr	r1, [r0]
	cmp	r1, #0
	beq	.L11	@cond_branch
	mov	r2, #0x8a
	lsl	r2, r2, #0x2
	add	r0, r5, r2
	bl	getLevelGeometryAddresses
.L11:
	ldr	r3, [sp, #0x14]
	lsl	r0, r3, #0x18
	asr	r0, r0, #0x10
	ldr	r4, [sp, #0xc]
	orr	r0, r0, r4
	mov	r7, #0xd6
	lsl	r7, r7, #0x2
	add	r1, r5, r7
	strh	r0, [r1]
	add	sp, sp, #0x28
	pop	{r3, r4, r5}
	mov	r8, r3
	mov	r9, r4
	mov	sl, r5
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
	thumb_func_end sub_805E8D8

.align 2, 0 @ Don't pad with nop.
