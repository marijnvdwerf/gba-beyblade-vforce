	.include "asm/common.inc"

	thumb_func_start sub_804D110
sub_804D110:
	push	{r4, r5, r6, r7, lr}
	mov	r7, sl
	mov	r6, r9
	mov	r5, r8
	push	{r5, r6, r7}
	add	sp, sp, #0xfffffff8
	add	r7, r0, #0
	mov	r8, r1
	ldrb	r0, [r7, #0x8]
	mov	r9, r0
	ldr	r1, .L9
	add	r0, r7, #0
	bl	UnsetRiderFlag
	mov	r1, #0xe0
	lsl	r1, r1, #0x1
	add	r0, r7, r1
	mov	r5, #0x0
	strb	r5, [r0]
	ldr	r2, [r7, #0x20]
	ldr	r1, [r7, #0x24]
	sub	r1, r2, r1
	ldr	r0, [r7, #0x1c]
	add	r0, r0, r1
	str	r0, [r7, #0x1c]
	asr	r1, r1, #0x4
	ldr	r0, [r7, #0xc]
	add	r0, r0, r1
	mov	r1, #0xff
	and	r0, r0, r1
	str	r0, [r7, #0xc]
	str	r2, [r7, #0x24]
	mov	r3, #0xde
	lsl	r3, r3, #0x1
	add	r2, r7, r3
	mov	r4, r8
	ldr	r1, [r4, #0xc]
	ldr	r0, [r2]
	cmp	r1, r0
	ble	.L1	@cond_branch
	str	r1, [r2]
.L1:
	ldr	r0, [r7, #0x1c]
	ldr	r4, .L9 + 4
	and	r0, r0, r4
	str	r0, [r7, #0x1c]
	ldr	r0, [r7, #0x74]
	and	r0, r0, r4
	str	r0, [r7, #0x74]
	add	r0, r7, #0
	mov	r1, #0x12
	bl	RiderHasFlag
	lsl	r0, r0, #0x18
	cmp	r0, #0
	bne	.L2	@cond_branch
	ldr	r0, [r7, #0x10]
	ldr	r1, [r7, #0x1c]
	mov	r2, #0x10
	str	r2, [sp]
	mov	r2, #0x50
	str	r2, [sp, #0x4]
	add	r2, r4, #0
	mov	r3, #0x40
	bl	sub_804E258
	str	r0, [r7, #0x14]
.L2:
	add	r0, r7, #0
	add	r0, r0, #0x98
	strh	r5, [r0]
	ldr	r1, .L9 + 8
	add	r2, r7, r1
	ldrh	r1, [r2]
	add	r6, r0, #0
	cmp	r1, #0
	beq	.L3	@cond_branch
	sub	r0, r1, #1
	strh	r0, [r2]
.L3:
	mov	r4, #0x80
	lsl	r4, r4, #0x13
	add	r0, r7, #0
	add	r1, r4, #0
	bl	RiderHasFlag
	lsl	r0, r0, #0x18
	cmp	r0, #0
	bne	.L4	@cond_branch
	ldr	r0, .L9 + 12
	ldr	r0, [r0]
	ldr	r2, .L9 + 16
	add	r0, r0, r2
	ldr	r0, [r0]
	mov	r1, #0x1
	and	r0, r0, r1
	cmp	r0, #0
	bne	.L5	@cond_branch
	mov	r1, #0x80
	lsl	r1, r1, #0xc
	add	r0, r7, #0
	bl	RiderHasFlag
	lsl	r0, r0, #0x18
	cmp	r0, #0
	beq	.L7	@cond_branch
	add	r0, r7, #0
	mov	r1, #0x2
	bl	RiderHasFlag
	lsl	r0, r0, #0x18
	cmp	r0, #0
	bne	.L7	@cond_branch
	mov	r3, #0x82
	lsl	r3, r3, #0x2
	add	r1, r7, r3
	ldr	r0, [r1]
	sub	r0, r0, #0x8
	b	.L8
.L10:
	.align	2, 0
.L9:
	.4byte	0x1000004
	.4byte	0xfff
	.4byte	0x22e
	.4byte	0x3000f48
	.4byte	0xc64
.L7:
	mov	r4, #0x82
	lsl	r4, r4, #0x2
	add	r1, r7, r4
	ldr	r0, [r1]
	sub	r0, r0, #0x1
.L8:
	str	r0, [r1]
.L5:
	mov	r0, #0x82
	lsl	r0, r0, #0x2
	add	r5, r7, r0
	ldr	r1, [r5]
	mov	r0, #0x80
	lsl	r0, r0, #0x1
	cmp	r1, r0
	bgt	.L11	@cond_branch
	ldr	r4, [r7, #0x4]
	bl	sub_8057C40
	add	r1, r0, #0
	asr	r1, r1, #0x6
	mov	r0, #0x1
	and	r1, r1, r0
	add	r0, r4, #0
	bl	sub_804C0EC
.L11:
	ldr	r1, [r5]
	lsl	r0, r1, #0x2
	add	r0, r0, r1
	lsl	r0, r0, #0x2
	add	r0, r0, r1
	bl	sub_804F824
	ldr	r0, [r5]
	cmp	r0, #0xff
	bgt	.L13	@cond_branch
	bl	sub_804AD60
	cmp	r0, #0
	bne	.L13	@cond_branch
	mov	r0, #0xf
	bl	sub_804ABFC
.L13:
	mov	r1, #0x80
	lsl	r1, r1, #0xa
	add	r0, r7, #0
	bl	RiderHasFlag
	lsl	r0, r0, #0x18
	cmp	r0, #0
	beq	.L14	@cond_branch
	b	.L31
.L14:
	mov	r1, #0x82
	lsl	r1, r1, #0x2
	add	r0, r7, r1
	ldr	r0, [r0]
	cmp	r0, #0
	ble	.L17	@cond_branch
	mov	r2, r8
	ldr	r1, [r2, #0xc]
	ldr	r0, .L20
	cmp	r1, r0
	blt	.L17	@cond_branch
	b	.L31
.L17:
	bl	sub_804FAD4
	bl	sub_80556C4
	mov	r1, #0x80
	lsl	r1, r1, #0x14
	add	r0, r7, #0
	bl	SetRiderFlag
	add	r0, r7, #0
	bl	sub_804D048
	b	.L31
.L21:
	.align	2, 0
.L20:
	.4byte	0xffff0000
.L4:
	add	r0, r7, #0
	add	r1, r4, #0
	bl	RiderHasFlag
	lsl	r0, r0, #0x18
	cmp	r0, #0
	beq	.L31	@cond_branch
	mov	r3, #0x82
	lsl	r3, r3, #0x2
	add	r4, r7, r3
	ldr	r2, [r4]
	ldr	r0, .L52
	add	r1, r2, r0
	ldr	r0, .L52 + 4
	cmp	r1, r0
	bhi	.L23	@cond_branch
	mov	r1, #0x8b
	lsl	r1, r1, #0x2
	add	r0, r7, r1
	ldrh	r0, [r0]
	add	r0, r0, r2
	str	r0, [r4]
.L23:
	ldr	r1, [r4]
	mov	r0, #0x80
	lsl	r0, r0, #0x2
	cmp	r1, r0
	bgt	.L25	@cond_branch
	sub	r0, r1, #3
	str	r0, [r4]
	mov	r1, #0x80
	lsl	r1, r1, #0x6
	add	r0, r7, #0
	bl	SetRiderFlag
	ldr	r1, [r4]
	mov	r0, #0x80
	lsl	r0, r0, #0x1
	cmp	r1, r0
	bgt	.L25	@cond_branch
	ldr	r4, [r7, #0x4]
	bl	sub_8057C40
	add	r1, r0, #0
	asr	r1, r1, #0x6
	mov	r0, #0x1
	and	r1, r1, r0
	add	r0, r4, #0
	bl	sub_804C0EC
.L25:
	mov	r2, #0x82
	lsl	r2, r2, #0x2
	add	r4, r7, r2
	ldr	r0, [r4]
	cmp	r0, #0
	bge	.L26	@cond_branch
	mov	r0, #0x0
	str	r0, [r4]
.L26:
	ldr	r0, [r4]
	cmp	r0, #0
	bne	.L27	@cond_branch
	ldr	r0, [r7, #0x4]
	bl	sub_804C0C0
.L27:
	mov	r3, r8
	ldr	r1, [r3, #0xc]
	ldr	r0, .L52 + 8
	cmp	r1, r0
	blt	.L28	@cond_branch
	ldr	r0, [r4]
	cmp	r0, #0
	bne	.L31	@cond_branch
.L28:
	add	r0, r7, #0
	mov	r1, #0x8
	bl	RiderHasFlag
	lsl	r0, r0, #0x18
	cmp	r0, #0
	beq	.L30	@cond_branch
	ldr	r0, .L52 + 12
	ldr	r0, [r0]
	mov	r1, #0x80
	lsl	r1, r1, #0xa
	bl	SetRiderFlag
	bl	sub_8056EC0
	mov	r0, #0x0
	bl	sub_8053E18
	add	r0, r7, #0
	mov	r1, #0x8
	bl	UnsetRiderFlag
.L30:
	mov	r4, #0x80
	lsl	r4, r4, #0x5
	add	r0, r7, #0
	add	r1, r4, #0
	bl	RiderHasFlag
	lsl	r0, r0, #0x18
	cmp	r0, #0
	bne	.L31	@cond_branch
	add	r0, r7, #0
	add	r1, r4, #0
	bl	SetRiderFlag
	ldr	r0, [r7, #0x4]
	bl	sub_804C118
	bl	sub_8053920
	ldr	r0, [r7, #0x4]
	bl	sub_804C0C0
.L31:
	mov	r1, #0x80
	lsl	r1, r1, #0xa
	add	r0, r7, #0
	bl	RiderHasFlag
	lsl	r0, r0, #0x18
	cmp	r0, #0
	bne	.L32	@cond_branch
	mov	r1, #0x80
	lsl	r1, r1, #0x6
	add	r0, r7, #0
	bl	RiderHasFlag
	lsl	r0, r0, #0x18
	cmp	r0, #0
	beq	.L33	@cond_branch
.L32:
	add	r0, r7, #0
	add	r0, r0, #0x52
	mov	r1, #0x28
	strh	r1, [r0]
	sub	r0, r0, #0x2
	strh	r1, [r0]
.L33:
	mov	r4, #0x80
	lsl	r4, r4, #0x1
	add	r0, r7, #0
	add	r1, r4, #0
	bl	RiderHasFlag
	lsl	r0, r0, #0x18
	cmp	r0, #0
	beq	.L35	@cond_branch
	add	r0, r7, #0
	mov	r1, #0x2
	bl	RiderHasFlag
	lsl	r0, r0, #0x18
	cmp	r0, #0
	bne	.L35	@cond_branch
	add	r0, r7, #0
	add	r1, r4, #0
	bl	UnsetRiderFlag
.L35:
	mov	r1, #0x80
	lsl	r1, r1, #0x1
	add	r0, r7, #0
	bl	RiderHasFlag
	lsl	r0, r0, #0x18
	cmp	r0, #0
	bne	.L37	@cond_branch
	mov	r1, #0x80
	lsl	r1, r1, #0x3
	add	r0, r7, #0
	bl	RiderHasFlag
	lsl	r0, r0, #0x18
	cmp	r0, #0
	bne	.L37	@cond_branch
	mov	r4, #0x8d
	lsl	r4, r4, #0x2
	add	r1, r7, r4
	ldr	r0, [r1]
	add	r0, r0, #0x1
	str	r0, [r1]
.L37:
	ldr	r0, [r7, #0x14]
	ldr	r1, [r7, #0x18]
	add	r0, r0, r1
	str	r0, [r7, #0x14]
	ldr	r2, [r7, #0x10]
	add	r2, r2, r0
	ldr	r0, [r7, #0x6c]
	ldr	r1, [r7, #0x70]
	add	r0, r0, r1
	ldr	r4, .L52 + 16
	and	r0, r0, r4
	str	r0, [r7, #0x6c]
	and	r2, r2, r4
	str	r2, [r7, #0x10]
	ldr	r0, [r7, #0x28]
	ldr	r1, [r7, #0x30]
	mov	r5, #0x80
	lsl	r5, r5, #0x3
	mov	r2, #0xdc
	add	r3, r5, #0
	bl	sub_804E224
	str	r0, [r7, #0x2c]
	ldr	r1, [r7, #0x28]
	add	r1, r1, r0
	str	r1, [r7, #0x28]
	ldr	r0, [r7, #0x34]
	ldr	r1, [r7, #0x3c]
	mov	r2, #0xdc
	add	r3, r5, #0
	bl	sub_804E224
	str	r0, [r7, #0x38]
	ldr	r1, [r7, #0x34]
	add	r1, r1, r0
	str	r1, [r7, #0x34]
	ldr	r1, [r7, #0x10]
	add	r1, r1, #0x7f
	and	r1, r1, r4
	asr	r1, r1, #0x8
	strb	r1, [r7, #0x8]
	mov	r2, r9
	lsl	r0, r2, #0x18
	asr	r0, r0, #0x18
	cmp	r1, r0
	beq	.L38	@cond_branch
	mov	r0, #0x1
	ldrh	r3, [r6]
	orr	r0, r0, r3
	strh	r0, [r6]
.L38:
	mov	r1, #0x80
	lsl	r1, r1, #0x13
	add	r0, r7, #0
	bl	RiderHasFlag
	lsl	r0, r0, #0x18
	cmp	r0, #0
	beq	.L40	@cond_branch
	mov	r4, #0x88
	lsl	r4, r4, #0x2
	add	r1, r7, r4
	ldrh	r2, [r1]
	mov	r3, #0x0
	ldsh	r0, [r1, r3]
	cmp	r0, #0
	beq	.L40	@cond_branch
	sub	r0, r2, #1
	strh	r0, [r1]
.L40:
	mov	r4, #0x86
	lsl	r4, r4, #0x2
	add	r3, r7, r4
	mov	r1, #0x0
	ldsh	r0, [r3, r1]
	cmp	r0, #0
	blt	.L42	@cond_branch
	sub	r4, r4, #0x4
	add	r2, r7, r4
	ldr	r0, [r2]
	cmp	r0, #0
	bne	.L42	@cond_branch
	ldr	r0, .L52 + 12
	ldr	r1, [r0]
	mov	r4, #0x0
	ldsh	r0, [r3, r4]
	lsl	r0, r0, #0x2
	mov	r3, #0xce
	lsl	r3, r3, #0x3
	add	r1, r1, r3
	add	r1, r1, r0
	ldr	r0, [r1]
	str	r0, [r2]
.L42:
	mov	r1, #0x80
	lsl	r1, r1, #0x13
	add	r0, r7, #0
	bl	RiderHasFlag
	lsl	r0, r0, #0x18
	cmp	r0, #0
	beq	.L45	@cond_branch
	mov	r4, #0x85
	lsl	r4, r4, #0x2
	add	r5, r7, r4
	ldr	r1, [r5]
	cmp	r1, #0
	beq	.L45	@cond_branch
	ldr	r0, .L52 + 12
	ldr	r0, [r0]
	ldr	r2, .L52 + 20
	add	r0, r0, r2
	mov	r3, #0x89
	lsl	r3, r3, #0x2
	add	r4, r7, r3
	ldr	r2, [r4]
	asr	r2, r2, #0x12
	bl	sub_805DCFC
	ldr	r2, .L52 + 24
	add	r1, r7, r2
	mov	r3, #0x0
	ldsh	r1, [r1, r3]
	ldr	r0, [r0, #0xc]
	asr	r0, r0, #0x2
	mul	r0, r0, r1
	asr	r0, r0, #0x8
	ldr	r1, [r4]
	add	r1, r1, r0
	str	r1, [r4]
	asr	r1, r1, #0x12
	ldr	r0, [r5]
	ldr	r0, [r0]
	sub	r0, r0, #0x1
	cmp	r1, r0
	blt	.L45	@cond_branch
	mov	r0, #0x0
	str	r0, [r4]
.L45:
	add	r0, r7, #0
	mov	r1, #0x2
	bl	RiderHasFlag
	lsl	r0, r0, #0x18
	cmp	r0, #0
	bne	.L46	@cond_branch
	add	r0, r7, #0
	bl	sub_804D8D8
.L46:
	mov	r4, #0xfe
	lsl	r4, r4, #0x1
	add	r1, r7, r4
	ldr	r0, [r1]
	add	r0, r0, #0x1
	str	r0, [r1]
	mov	r1, #0x80
	lsl	r1, r1, #0x13
	add	r0, r7, #0
	bl	RiderHasFlag
	lsl	r0, r0, #0x18
	cmp	r0, #0
	bne	.L47	@cond_branch
	add	r0, r7, #0
	bl	sub_804D710
.L47:
	mov	r4, #0x80
	lsl	r4, r4, #0xe
	add	r0, r7, #0
	add	r1, r4, #0
	bl	RiderHasFlag
	lsl	r0, r0, #0x18
	cmp	r0, #0
	beq	.L48	@cond_branch
	mov	r0, #0xdc
	lsl	r0, r0, #0x1
	add	r1, r7, r0
	ldrh	r0, [r1]
	sub	r0, r0, #0x1
	strh	r0, [r1]
.L48:
	mov	r1, #0xdc
	lsl	r1, r1, #0x1
	add	r0, r7, r1
	ldrh	r0, [r0]
	cmp	r0, #0
	bne	.L49	@cond_branch
	add	r0, r7, #0
	add	r1, r4, #0
	bl	UnsetRiderFlag
.L49:
	add	r0, r7, #0
	mov	r1, #0x2
	bl	RiderHasFlag
	lsl	r0, r0, #0x18
	cmp	r0, #0
	beq	.L50	@cond_branch
	mov	r2, #0xcc
	lsl	r2, r2, #0x1
	add	r1, r7, r2
	b	.L51
.L53:
	.align	2, 0
.L52:
	.4byte	0xfffffdff
	.4byte	0x9fe
	.4byte	0xffff0000
	.4byte	0x3000fb0
	.4byte	0xfff
	.4byte	0x65c
	.4byte	0x21a
.L50:
	mov	r3, #0xce
	lsl	r3, r3, #0x1
	add	r1, r7, r3
.L51:
	ldr	r0, [r1]
	add	r0, r0, #0x1
	str	r0, [r1]
	add	r0, r7, #0
	mov	r1, #0x2
	bl	RiderHasFlag
	lsl	r0, r0, #0x18
	cmp	r0, #0
	bne	.L55	@cond_branch
	add	r0, r7, #0
	mov	r1, #0x2
	bl	sub_804E454
	lsl	r0, r0, #0x18
	cmp	r0, #0
	beq	.L55	@cond_branch
	mov	r0, #0x8
	ldrh	r4, [r6]
	orr	r0, r0, r4
	strh	r0, [r6]
	add	r0, r7, #0
	bl	sub_804DFF4
.L55:
	add	r0, r7, #0
	mov	r1, #0x2
	bl	RiderHasFlag
	lsl	r0, r0, #0x18
	cmp	r0, #0
	bne	.L56	@cond_branch
	add	r0, r7, #0
	add	r0, r0, #0xec
	add	r1, r7, #0
	add	r1, r1, #0xe4
	ldr	r1, [r1]
	str	r1, [r0]
.L56:
	add	r0, r7, #0
	mov	r1, #0x2
	bl	RiderHasFlag
	lsl	r0, r0, #0x18
	cmp	r0, #0
	bne	.L57	@cond_branch
	ldrb	r0, [r7, #0x8]
	strb	r0, [r7, #0x9]
.L57:
	add	r0, r7, #0
	mov	r1, #0x2
	bl	RiderHasFlag
	lsl	r0, r0, #0x18
	cmp	r0, #0
	beq	.L59	@cond_branch
	add	r0, r7, #0
	mov	r1, #0x2
	bl	sub_804E454
	lsl	r0, r0, #0x18
	cmp	r0, #0
	bne	.L59	@cond_branch
	mov	r0, #0x10
	ldrh	r1, [r6]
	orr	r0, r0, r1
	strh	r0, [r6]
	add	r0, r7, #0
	bl	sub_804E090
.L59:
	mov	r1, #0x80
	lsl	r1, r1, #0x2
	add	r0, r7, #0
	bl	RiderHasFlag
	lsl	r0, r0, #0x18
	cmp	r0, #0
	beq	.L61	@cond_branch
	add	r0, r7, #0
	add	r0, r0, #0xcc
	ldr	r0, [r0]
	cmp	r0, #0
	bne	.L61	@cond_branch
	add	r0, r7, #0
	bl	sub_804E1DC
.L61:
	add	r0, r7, #0
	mov	r1, r8
	bl	sub_804DDF8
	add	r0, r7, #0
	bl	sub_804D754
	mov	r2, #0xd0
	lsl	r2, r2, #0x1
	add	r1, r7, r2
	mov	r3, r8
	ldr	r0, [r3, #0x40]
	str	r0, [r1]
	mov	r4, #0xd2
	lsl	r4, r4, #0x1
	add	r1, r7, r4
	ldr	r0, [r3, #0x44]
	str	r0, [r1]
	add	r3, r7, #0
	add	r3, r3, #0xa4
	mov	r0, #0x9c
	add	r0, r0, r7
	mov	r9, r0
	mov	r1, #0xa0
	add	r1, r1, r7
	mov	sl, r1
	ldr	r1, [r0]
	mov	r4, sl
	ldr	r2, [r4]
	add	r0, r1, #0
	EOR	r0, r2
	orr	r1, r1, r2
	and	r0, r0, r1
	str	r0, [r3]
	add	r3, r3, #0xc
	add	r6, r7, #0
	add	r6, r6, #0xa8
	mov	r0, #0xac
	add	r0, r0, r7
	mov	r8, r0
	ldr	r1, [r6]
	ldr	r2, [r0]
	add	r0, r1, #0
	EOR	r0, r2
	orr	r1, r1, r2
	and	r0, r0, r1
	str	r0, [r3]
	mov	r1, #0xae
	lsl	r1, r1, #0x1
	add	r5, r7, r1
	mov	r2, #0xaa
	lsl	r2, r2, #0x1
	add	r3, r7, r2
	mov	r0, #0xac
	lsl	r0, r0, #0x1
	add	r4, r7, r0
	ldr	r1, [r3]
	ldr	r2, [r4]
	add	r0, r1, #0
	EOR	r0, r2
	orr	r1, r1, r2
	and	r0, r0, r1
	str	r0, [r5]
	mov	r1, r9
	ldr	r0, [r1]
	mov	r2, sl
	str	r0, [r2]
	ldr	r0, [r6]
	mov	r1, r8
	str	r0, [r1]
	ldr	r0, [r3]
	str	r0, [r4]
	add	r0, r7, #0
	mov	r1, #0x2
	bl	SetRiderFlag
	add	r1, r7, #0
	add	r1, r1, #0x88
	mov	r0, #0x0
	str	r0, [r1]
	add	sp, sp, #0x8
	pop	{r3, r4, r5}
	mov	r8, r3
	mov	r9, r4
	mov	sl, r5
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
	thumb_func_end sub_804D110

.align 2, 0 @ Don't pad with nop.
