	.include "asm/common.inc"

	thumb_func_start s_rider_804C4B4
s_rider_804C4B4:
	push	{r4, r5, r6, r7, lr}
	mov	r7, sl
	mov	r6, r9
	mov	r5, r8
	push	{r5, r6, r7}
	add	r7, r0, #0
	add	r4, r1, #0
	ldr	r0, .L2
	mov	r2, #0x8e
	lsl	r2, r2, #0x2
	ldr	r3, [r0]
	mov	r0, #0x0
	add	r1, r7, #0
	bl	call_via_r3
	mov	r0, #0x1a
	NEG	r0, r0
	mov	sl, r0
	str	r0, [r4, #0x54]
	mov	r6, #0x0
	str	r6, [r4, #0x68]
	str	r4, [r7]
	str	r6, [r7, #0x4]
	str	r6, [r7, #0x78]
	str	r6, [r7, #0x7c]
	add	r0, r7, #0
	add	r0, r0, #0x80
	str	r6, [r0]
	add	r0, r0, #0x4
	str	r6, [r0]
	ldr	r2, .L2 + 4
	add	r1, r7, r2
	mov	r0, #0x10
	strb	r0, [r1]
	add	r0, r7, #0
	add	r0, r0, #0x88
	str	r6, [r0]
	str	r6, [r7, #0x10]
	str	r6, [r7, #0x14]
	str	r6, [r7, #0x18]
	str	r6, [r7, #0x1c]
	str	r6, [r7, #0x24]
	str	r6, [r7, #0x20]
	str	r6, [r7, #0x28]
	str	r6, [r7, #0x2c]
	str	r6, [r7, #0x30]
	str	r6, [r7, #0x34]
	str	r6, [r7, #0x38]
	str	r6, [r7, #0x3c]
	str	r6, [r7, #0x6c]
	str	r6, [r7, #0x70]
	str	r6, [r7, #0x74]
	add	r0, r0, #0xc
	str	r6, [r0]
	add	r0, r0, #0x14
	str	r6, [r0]
	add	r0, r0, #0x4
	str	r6, [r0]
	add	r0, r0, #0x4
	str	r6, [r0]
	add	r0, r0, #0x18
	str	r6, [r0]
	sub	r0, r0, #0x14
	str	r6, [r0]
	add	r0, r0, #0x4
	str	r6, [r0]
	add	r1, r7, #0
	add	r1, r1, #0xbc
	mov	r0, #0x1
	NEG	r0, r0
	str	r0, [r1]
	add	r0, r7, #0
	add	r0, r0, #0xd8
	str	r6, [r0]
	add	r0, r0, #0x4
	str	r6, [r0]
	sub	r0, r0, #0x44
	strh	r6, [r0]
	add	r0, r0, #0x4
	str	r6, [r0]
	add	r0, r0, #0x8
	str	r6, [r0]
	sub	r0, r0, #0x18
	str	r6, [r0]
	add	r0, r0, #0x4
	str	r6, [r0]
	mov	r3, #0x0
	strb	r3, [r7, #0x8]
	strb	r3, [r7, #0x9]
	add	r0, r0, #0x3c
	str	r6, [r0]
	add	r0, r0, #0x14
	str	r6, [r0]
	add	r0, r0, #0x4
	str	r6, [r0]
	add	r0, r0, #0x4
	str	r6, [r0]
	add	r0, r0, #0x4
	str	r6, [r0]
	mov	r5, #0x8e
	lsl	r5, r5, #0x1
	add	r0, r7, r5
	strh	r6, [r0]
	mov	r0, #0xce
	lsl	r0, r0, #0x1
	add	r1, r7, r0
	mov	r0, #0x40
	str	r0, [r1]
	add	r0, r7, #0
	add	r0, r0, #0xd3
	strb	r3, [r0]
	mov	r1, #0xa0
	lsl	r1, r1, #0x1
	add	r0, r7, r1
	strh	r6, [r0]
	sub	r2, r2, #0x7f
	add	r0, r7, r2
	strh	r6, [r0]
	mov	r3, #0xa4
	lsl	r3, r3, #0x1
	add	r0, r7, r3
	str	r6, [r0]
	add	r5, r5, #0x28
	add	r0, r7, r5
	strh	r6, [r0]
	add	r1, r1, #0x14
	add	r0, r7, r1
	str	r6, [r0]
	add	r2, r2, #0x16
	add	r0, r7, r2
	str	r6, [r0]
	add	r3, r3, #0x14
	add	r0, r7, r3
	str	r6, [r0]
	add	r5, r5, #0x1c
	add	r0, r7, r5
	str	r6, [r0]
	add	r1, r1, #0x10
	add	r0, r7, r1
	str	r6, [r0]
	add	r2, r2, #0x10
	add	r0, r7, r2
	str	r6, [r0]
	add	r3, r3, #0x10
	add	r0, r7, r3
	str	r6, [r0]
	add	r5, r5, #0x10
	add	r0, r7, r5
	str	r6, [r0]
	add	r1, r1, #0x10
	add	r0, r7, r1
	str	r6, [r0]
	add	r2, r2, #0x30
	add	r0, r7, r2
	str	r6, [r0]
	sub	r3, r3, #0x20
	add	r0, r7, r3
	strh	r6, [r0]
	sub	r5, r5, #0x22
	add	r0, r7, r5
	strh	r6, [r0]
	sub	r1, r1, #0x24
	add	r0, r7, r1
	strh	r6, [r0]
	add	r2, r2, #0x8
	add	r0, r7, r2
	str	r6, [r0]
	add	r3, r3, #0x58
	add	r0, r7, r3
	str	r6, [r0]
	add	r5, r5, #0x5a
	add	r2, r7, r5
	mov	r0, #0xd6
	lsl	r0, r0, #0x1
	add	r1, r7, r0
	add	r3, r3, #0xc
	add	r0, r7, r3
	str	r6, [r0]
	str	r6, [r1]
	str	r6, [r2]
	add	r5, r5, #0xc
	add	r0, r7, r5
	str	r6, [r0]
	mov	r1, #0xdc
	lsl	r1, r1, #0x1
	add	r0, r7, r1
	strh	r6, [r0]
	mov	r2, #0xde
	lsl	r2, r2, #0x1
	add	r0, r7, r2
	str	r6, [r0]
	add	r3, r3, #0x10
	add	r0, r7, r3
	mov	r5, #0x0
	strb	r5, [r0]
	mov	r0, #0xf4
	add	r0, r0, r7
	mov	r9, r0
	mov	r1, #0xf8
	add	r1, r1, r7
	mov	r8, r1
	mov	r2, #0xfc
	add	r2, r2, r7
	mov	ip, r2
	sub	r3, r3, #0xb8
	add	r4, r7, r3
	mov	r5, #0x86
	lsl	r5, r5, #0x1
	add	r3, r7, r5
	mov	r0, #0x88
	lsl	r0, r0, #0x1
	add	r2, r7, r0
	add	r5, r5, #0x8
	add	r1, r7, r5
	add	r5, r5, #0x4
	add	r0, r7, r5
	str	r6, [r0]
	str	r6, [r1]
	str	r6, [r2]
	str	r6, [r3]
	str	r6, [r4]
	mov	r1, #0x83
	lsl	r1, r1, #0x1
	add	r0, r7, r1
	strh	r6, [r0]
	mov	r2, #0x82
	lsl	r2, r2, #0x1
	add	r0, r7, r2
	strh	r6, [r0]
	ldr	r3, .L2 + 8
	add	r0, r7, r3
	mov	r5, #0x0
	strb	r5, [r0]
	mov	r4, #0x81
	lsl	r4, r4, #0x1
	add	r0, r7, r4
	strb	r5, [r0]
	sub	r1, r1, #0x5
	add	r0, r7, r1
	strb	r5, [r0]
	sub	r2, r2, #0x4
	add	r1, r7, r2
	mov	r0, #0x0
	strb	r0, [r1]
	mov	r3, ip
	str	r6, [r3]
	mov	r5, r8
	str	r6, [r5]
	mov	r0, r9
	str	r6, [r0]
	mov	r1, #0xe1
	lsl	r1, r1, #0x1
	add	r0, r7, r1
	mov	r3, #0x0
	strb	r3, [r0]
	ldr	r5, .L2 + 12
	add	r0, r7, r5
	strb	r3, [r0]
	add	r1, r1, #0x2
	add	r0, r7, r1
	strh	r6, [r0]
	mov	r3, #0xe3
	lsl	r3, r3, #0x1
	add	r0, r7, r3
	strh	r6, [r0]
	add	r5, r5, #0x5
	add	r0, r7, r5
	strh	r6, [r0]
	str	r6, [r7, #0x40]
	str	r6, [r7, #0x44]
	str	r6, [r7, #0x48]
	str	r6, [r7, #0x4c]
	add	r0, r7, #0
	add	r0, r0, #0x50
	mov	r1, #0x5
	strh	r1, [r0]
	add	r0, r0, #0x2
	strh	r1, [r0]
	add	r0, r0, #0x2
	strh	r6, [r0]
	add	r0, r0, #0x2
	strh	r6, [r0]
	add	r0, r0, #0x2
	strh	r6, [r0]
	add	r0, r0, #0x2
	strh	r6, [r0]
	str	r6, [r7, #0x68]
	add	r0, r0, #0x2
	strh	r6, [r0]
	add	r0, r0, #0x2
	strh	r6, [r0]
	add	r0, r0, #0x4
	strh	r6, [r0]
	sub	r0, r0, #0x2
	strh	r6, [r0]
	str	r6, [r7, #0x64]
	mov	r1, #0xe5
	lsl	r1, r1, #0x1
	add	r0, r7, r1
	strh	r2, [r0]
	add	r3, r3, #0x6
	add	r0, r7, r3
	strh	r2, [r0]
	add	r5, r5, #0x6
	add	r1, r7, r5
	mov	r0, #0x1
	strb	r0, [r1]
	ldr	r1, .L2 + 16
	add	r0, r7, r1
	mov	r3, #0x0
	strb	r3, [r0]
	add	r5, r5, #0x6
	add	r1, r7, r5
	ldr	r0, .L2 + 20
	ldr	r0, [r0]
	str	r0, [r1]
	mov	r1, #0xec
	lsl	r1, r1, #0x1
	add	r0, r7, r1
	str	r6, [r0]
	mov	r3, #0xee
	lsl	r3, r3, #0x1
	add	r0, r7, r3
	str	r6, [r0]
	add	r3, r3, #0x4
	add	r0, r7, r3
	str	r6, [r0]
	add	r5, r5, #0x10
	add	r0, r7, r5
	str	r6, [r0]
	add	r1, r1, #0x14
	add	r0, r7, r1
	strh	r6, [r0]
	add	r5, r5, #0xa
	add	r1, r7, r5
	mov	r0, #0x80
	lsl	r0, r0, #0x3
	strh	r0, [r1]
	mov	r1, #0xf9
	lsl	r1, r1, #0x1
	add	r0, r7, r1
	strh	r6, [r0]
	add	r5, r5, #0x6
	add	r0, r7, r5
	strh	r6, [r0]
	add	r1, r1, #0x4
	add	r0, r7, r1
	strh	r6, [r0]
	add	r5, r5, #0x4
	add	r0, r7, r5
	mov	r1, sl
	strh	r1, [r0]
	sub	r5, r5, #0x8
	add	r1, r7, r5
	mov	r0, #0x6
	strh	r0, [r1]
	mov	r1, #0xfe
	lsl	r1, r1, #0x1
	add	r0, r7, r1
	str	r6, [r0]
	add	r5, r5, #0x10
	add	r0, r7, r5
	str	r6, [r0]
	add	r1, r1, #0x8
	add	r0, r7, r1
	strh	r6, [r0]
	add	r5, r5, #0x6
	add	r0, r7, r5
	strh	r6, [r0]
	mov	r0, #0x82
	lsl	r0, r0, #0x2
	add	r1, r7, r0
	mov	r0, #0xc0
	lsl	r0, r0, #0x4
	str	r0, [r1]
	mov	r1, #0x83
	lsl	r1, r1, #0x2
	add	r0, r7, r1
	str	r6, [r0]
	add	r5, r5, #0xa
	add	r1, r7, r5
	mov	r0, #0x90
	lsl	r0, r0, #0x4
	str	r0, [r1]
	mov	r0, #0x87
	lsl	r0, r0, #0x2
	add	r1, r7, r0
	mov	r0, #0xf0
	strh	r0, [r1]
	ldr	r1, .L2 + 24
	add	r0, r7, r1
	strh	r6, [r0]
	add	r5, r5, #0x10
	add	r0, r7, r5
	strh	r6, [r0]
	sub	r1, r1, #0xa
	add	r0, r7, r1
	str	r6, [r0]
	sub	r5, r5, #0x8
	add	r1, r7, r5
	ldr	r0, .L2 + 28
	strh	r0, [r1]
	mov	r1, #0x89
	lsl	r1, r1, #0x2
	add	r0, r7, r1
	str	r6, [r0]
	add	r5, r5, #0x2
	add	r0, r7, r5
	strh	r2, [r0]
	sub	r1, r1, #0x2
	add	r0, r7, r1
	strh	r3, [r0]
	add	r3, r3, #0x4c
	add	r0, r7, r3
	mov	r1, #0x2
	strh	r1, [r0]
	add	r5, r5, #0xe
	add	r0, r7, r5
	strh	r2, [r0]
	ldr	r0, .L2 + 32
	ldr	r0, [r0]
	ldr	r2, .L2 + 36
	add	r0, r0, r2
	ldr	r0, [r0]
	and	r0, r0, r1
	mov	r1, #0x10
	cmp	r0, #0
	beq	.L1	@cond_branch
	mov	r1, #0x30
.L1:
	ldr	r3, .L2 + 40
	add	r0, r7, r3
	strh	r1, [r0]
	mov	r5, #0x8d
	lsl	r5, r5, #0x2
	add	r0, r7, r5
	str	r6, [r0]
	ldr	r1, .L2 + 44
	add	r0, r7, r1
	strh	r6, [r0]
	mov	r2, #0x8c
	lsl	r2, r2, #0x2
	add	r0, r7, r2
	strh	r6, [r0]
	add	r0, r7, #0
	add	r1, r4, #0
	bl	SetRiderFlag
	pop	{r3, r4, r5}
	mov	r8, r3
	mov	r9, r4
	mov	sl, r5
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L3:
	.align	2, 0
.L2:
	.4byte	0x807d970
	.4byte	0x1c1
	.4byte	0x103
	.4byte	0x1c3
	.4byte	0x1cf
	.4byte	0x3000e30
	.4byte	0x21e
	.4byte	0xffff
	.4byte	0x3000f48
	.4byte	0xc64
	.4byte	0x22a
	.4byte	0x22e
	thumb_func_end s_rider_804C4B4

.align 2, 0 @ Don't pad with nop.
