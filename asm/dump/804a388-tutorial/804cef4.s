	.include "asm/common.inc"

	thumb_func_start sub_804CEF4
sub_804CEF4:
	push	{r4, r5, lr}
	add	r5, r0, #0
	add	r4, r1, #0
	ldr	r0, .L3
	add	r1, r5, r0
	mov	r0, #0x3c
	strh	r0, [r1]
	add	r0, r5, #0
	mov	r1, #0x40
	bl	SetRiderFlag
	ldr	r1, [r5]
	mov	r0, #0xc0
	lsl	r0, r0, #0x2
	str	r0, [r1, #0x48]
	ldr	r0, [r1, #0xc]
	mov	r2, #0x80
	lsl	r2, r2, #0x3
	add	r0, r0, r2
	str	r0, [r1, #0xc]
	add	r0, r5, #0
	mov	r1, #0x2
	bl	SetRiderFlag
	cmp	r4, #0x4
	bls	.L1	@cond_branch
	b	.L19
.L1:
	lsl	r0, r4, #0x2
	ldr	r1, .L3 + 4
	add	r0, r0, r1
	ldr	r0, [r0]
	mov	pc, r0
.L4:
	.align	2, 0
.L3:
	.4byte	0x21e
	.4byte	.L5
.L5:
	.4byte	.L6
	.4byte	.L7
	.4byte	.L8
	.4byte	.L19
	.4byte	.L10
.L6:
	add	r0, r5, #0
	mov	r1, #0x8
	bl	RiderHasFlag
	lsl	r0, r0, #0x18
	cmp	r0, #0
	bne	.L11	@cond_branch
	mov	r0, #0x82
	lsl	r0, r0, #0x2
	add	r1, r5, r0
	sub	r0, r0, #0x8
	str	r0, [r1]
	b	.L19
.L11:
	mov	r2, #0x82
	lsl	r2, r2, #0x2
	add	r1, r5, r2
	ldr	r0, [r1]
	asr	r0, r0, #0x1
	str	r0, [r1]
	b	.L19
.L7:
	mov	r0, #0x82
	lsl	r0, r0, #0x2
	add	r2, r5, r0
	ldr	r0, [r2]
	ldr	r1, .L16
	add	r0, r0, r1
	str	r0, [r2]
	ldr	r1, .L16 + 4
	cmp	r0, r1
	bgt	.L14	@cond_branch
	mov	r0, #0x80
	lsl	r0, r0, #0x2
	str	r0, [r2]
.L14:
	bl	sub_8057C40
	ldr	r1, [r5]
	asr	r0, r0, #0x4
	mov	r4, #0xf
	and	r0, r0, r4
	sub	r0, r0, #0x8
	lsl	r0, r0, #0x6
	str	r0, [r1, #0x40]
	bl	sub_8057C40
	ldr	r1, [r5]
	asr	r0, r0, #0x4
	add	r0, r0, #0xc8
	and	r0, r0, r4
	sub	r0, r0, #0x8
	lsl	r0, r0, #0x6
	str	r0, [r1, #0x44]
	mov	r0, #0xa0
	lsl	r0, r0, #0x3
	str	r0, [r1, #0x48]
	ldr	r0, [r1, #0xc]
	mov	r2, #0x80
	lsl	r2, r2, #0x3
	add	r0, r0, r2
	str	r0, [r1, #0xc]
	add	r0, r5, #0
	mov	r1, #0x2
	bl	SetRiderFlag
	b	.L19
.L17:
	.align	2, 0
.L16:
	.4byte	0xfffffa00
	.4byte	0x1ff
.L8:
	mov	r0, #0x82
	lsl	r0, r0, #0x2
	add	r2, r5, r0
	ldr	r0, [r2]
	ldr	r1, .L20
	add	r0, r0, r1
	str	r0, [r2]
	ldr	r1, .L20 + 4
	cmp	r0, r1
	bgt	.L18	@cond_branch
	mov	r0, #0x80
	lsl	r0, r0, #0x2
	str	r0, [r2]
.L18:
	ldr	r2, .L20 + 8
	add	r1, r5, r2
	mov	r0, #0x96
	lsl	r0, r0, #0x2
	strh	r0, [r1]
	add	r0, r5, #0
	mov	r1, #0x40
	bl	SetRiderFlag
	b	.L19
.L21:
	.align	2, 0
.L20:
	.4byte	0xfffffa00
	.4byte	0x1ff
	.4byte	0x21e
.L10:
	mov	r0, #0x82
	lsl	r0, r0, #0x2
	add	r2, r5, r0
	ldr	r0, [r2]
	ldr	r1, .L23
	add	r0, r0, r1
	str	r0, [r2]
	ldr	r1, .L23 + 4
	cmp	r0, r1
	bgt	.L22	@cond_branch
	mov	r0, #0x80
	lsl	r0, r0, #0x2
	str	r0, [r2]
.L22:
	mov	r2, #0x8b
	lsl	r2, r2, #0x2
	add	r1, r5, r2
	mov	r0, #0x0
	strh	r0, [r1]
.L19:
	pop	{r4, r5}
	pop	{r0}
	bx	r0
.L24:
	.align	2, 0
.L23:
	.4byte	0xfffffa00
	.4byte	0x1ff
	thumb_func_end sub_804CEF4

.align 2, 0 @ Don't pad with nop.
