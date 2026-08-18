	.include "asm/common.inc"

	thumb_func_start def_94_8_collision_8055F2C
def_94_8_collision_8055F2C:
	push	{r4, r5, r6, r7, lr}
	mov	r7, sl
	mov	r6, r9
	mov	r5, r8
	push	{r5, r6, r7}
	add	sp, sp, #0xffffffd0
	add	r5, r0, #0
	mov	r8, r1
	add	r7, r2, #0
	lsl	r3, r3, #0x10
	lsr	r6, r3, #0x10
	add	r0, r0, #0xb4
	ldr	r0, [r0]
	str	r0, [sp, #0x2c]
	ldr	r0, [r7]
	lsl	r0, r0, #0x4
	ldr	r1, [r1, #0x4]
	add	r3, r1, r0
	ldr	r0, [r7, #0x4]
	lsl	r0, r0, #0x4
	add	r4, r1, r0
	ldr	r1, [r3, #0x8]
	ldr	r0, [r4, #0x8]
	mov	sl, r4
	cmp	r1, r0
	bge	.L8055F62	@cond_branch
	mov	sl, r3
.L8055F62:
	mov	r9, r4
	cmp	r1, r0
	ble	.L8055F6A	@cond_branch
	mov	r9, r3
.L8055F6A:
	ldr	r0, [sp, #0x2c]
	cmp	r0, #0
	bne	.L8055F72	@cond_branch
	b	.L8056138
.L8055F72:
	ldrb	r1, [r7, #0x10]
	add	r0, r6, #0
	and	r0, r0, r1
	add	r2, r1, #0
	cmp	r0, #0
	bne	.L8055F80	@cond_branch
	b	.L8056138
.L8055F80:
	ldrb	r0, [r7, #0xf]
	sub	r0, r0, #0x8c
	cmp	r0, #0xe
	bls	.L8055F8A	@cond_branch
	b	.L80560CE
.L8055F8A:
	lsl	r0, r0, #0x2
	ldr	r1, .L8055F94
	add	r0, r0, r1
	ldr	r0, [r0]
	mov	pc, r0
.L8055F94:
	.align	2, 0

	.4byte	.L8055F98
.L8055F98:
	.4byte	.L8055FD4
	.4byte	.L80560BC
	.4byte	.L8056140
	.4byte	.L80560CE
	.4byte	.L8056140
	.4byte	.L80560CE
	.4byte	.L80560CE
	.4byte	.L80560CE
	.4byte	.L80560CE
	.4byte	.L80560CE
	.4byte	.L80560CE
	.4byte	.L80560CE
	.4byte	.L80560CE
	.4byte	.L80560CE
	.4byte	.L805608E
.L8055FD4:
	ldrh	r4, [r7, #0x16]
	mov	r1, #0x80
	lsl	r1, r1, #0x13
	ldr	r0, [sp, #0x2c]
	bl	RiderHasFlag
	lsl	r0, r0, #0x18
	cmp	r0, #0
	beq	.L8055FE8	@cond_branch
	b	.L8056140
.L8055FE8:
	add	r0, r6, #0
	ldrb	r1, [r7, #0x10]
	and	r0, r0, r1
	cmp	r0, #0
	bne	.L8055FF4	@cond_branch
	b	.L8056140
.L8055FF4:
	lsl	r0, r4, #0x10
	add	r4, r0, #0
	cmp	r4, #0
	bne	.L805600E	@cond_branch
	mov	r2, r9
	ldr	r1, [r2, #0x8]
	cmp	r1, #0
	beq	.L805600E	@cond_branch
	lsl	r1, r1, #0x5
	ldr	r0, [r5, #0xc]
	cmp	r0, r1
	ble	.L805600E	@cond_branch
	b	.L8056140
.L805600E:
	asr	r0, r4, #0x10
	cmp	r0, #0
	ble	.L8056030	@cond_branch
	lsl	r3, r0, #0x3
	mov	r0, sl
	ldr	r2, [r0, #0x8]
.L805601A:
	sub	r0, r2, r3
	lsl	r0, r0, #0x5
	ldr	r1, [r5, #0xc]
	cmp	r1, r0
	bge	.L8056026	@cond_branch
	b	.L8056140
.L8056026:
	add	r0, r2, r3
	lsl	r0, r0, #0x5
	cmp	r1, r0
	ble	.L8056030	@cond_branch
	b	.L8056140
.L8056030:
	asr	r0, r4, #0x10
	cmp	r0, #0
	bge	.L8056048	@cond_branch
	lsl	r0, r0, #0x3
	mov	r2, sl
	ldr	r1, [r2, #0x8]
	sub	r1, r1, r0
	lsl	r1, r1, #0x5
	ldr	r0, [r5, #0xc]
	cmp	r0, r1
	ble	.L8056048	@cond_branch
	b	.L8056140
.L8056048:
	mov	r0, r8
	add	r1, r7, #0
	bl	sub_805BAC0
	add	r6, r0, #0
	mov	r0, #0x1
	NEG	r0, r0
	cmp	r6, r0
	beq	.L8056140	@cond_branch
	mov	r0, r8
	add	r1, r6, #0
	bl	GetLineMetaData
	add	r5, r0, #0
	cmp	r5, #0
	beq	.L8056140	@cond_branch
	mov	r0, r8
	add	r1, r5, #0
	mov	r2, #0x6
	bl	getLineMetaObjectBytype
	add	r4, r0, #0
	cmp	r4, #0
	beq	.L8056140	@cond_branch
	ldr	r0, [sp, #0x2c]
	bl	SetRiderGlobal
	str	r4, [sp]
	mov	r0, r8
	add	r1, r7, #0
	add	r2, r6, #0
	add	r3, r5, #0
	bl	processMetadata_6
	b	.L8056140
.L805608E:
	ldrh	r0, [r7, #0x16]
	and	r2, r2, r6
	cmp	r2, #0
	beq	.L8056140	@cond_branch
	lsl	r0, r0, #0x10
	add	r4, r0, #0
	cmp	r4, #0
	bne	.L80560AE	@cond_branch
	mov	r0, r9
	ldr	r1, [r0, #0x8]
	cmp	r1, #0
	beq	.L80560AE	@cond_branch
	lsl	r1, r1, #0x5
	ldr	r0, [r5, #0xc]
	cmp	r0, r1
	bgt	.L8056140	@cond_branch
.L80560AE:
	asr	r0, r4, #0x10
	cmp	r0, #0
	ble	.L8056030	@cond_branch
	lsl	r3, r0, #0x3
	mov	r1, sl
	ldr	r2, [r1, #0x8]
	b	.L805601A
.L80560BC:
	ldrh	r1, [r7, #0x16]
	lsl	r0, r1, #0x3
	mov	r2, sl
	ldr	r1, [r2, #0x8]
	sub	r1, r1, r0
	lsl	r1, r1, #0x5
	ldr	r0, [r5, #0xc]
	cmp	r0, r1
	blt	.L8056140	@cond_branch
.L80560CE:
	mov	r0, #0x66
	and	r0, r0, r6
	cmp	r0, #0
	beq	.L80560FC	@cond_branch
	mov	r1, r9
	ldr	r0, [r1, #0x8]
	lsl	r0, r0, #0x5
	ldr	r1, [r5, #0xc]
	sub	r0, r0, r1
	ldr	r1, .L80560F8
	cmp	r0, r1
	ble	.L8056140	@cond_branch
	ldr	r1, [sp, #0x2c]
	add	r1, r1, #0x88
	mov	r0, #0xdc
	str	r0, [r1]
	mov	r2, r9
	ldr	r0, [r2, #0x8]
	lsl	r0, r0, #0x5
	str	r0, [r5, #0xc]
	b	.L8056140
.L80560F8:
	.align	2, 0

	.4byte	0xfffffd00
.L80560FC:
	ldr	r0, [r3, #0x8]
	cmp	r0, #0
	bne	.L8056108	@cond_branch
	ldr	r0, [r4, #0x8]
	cmp	r0, #0
	beq	.L8056138	@cond_branch
.L8056108:
	mov	r0, #0x4
	ldrb	r1, [r7, #0x11]
	and	r0, r0, r1
	cmp	r0, #0
	bne	.L8056120	@cond_branch
	mov	r0, r8
	add	r1, r7, #0
	add	r2, r5, #0
	add	r3, sp, #0x4
	bl	sub_80567E4
	b	.L805612C
.L8056120:
	mov	r0, r8
	add	r1, r7, #0
	add	r2, r5, #0
	add	r3, sp, #0x4
	bl	sub_8056910
.L805612C:
	ldr	r0, [sp, #0xc]
	ldr	r2, .L805613C
	add	r0, r0, r2
	ldr	r1, [r5, #0xc]
	cmp	r0, r1
	blt	.L8056140	@cond_branch
.L8056138:
	mov	r0, #0x1
	b	.L8056142
.L805613C:
	.align	2, 0

	.4byte	0xfffff400
.L8056140:
	mov	r0, #0x0
.L8056142:
	add	sp, sp, #0x30
	pop	{r3, r4, r5}
	mov	r8, r3
	mov	r9, r4
	mov	sl, r5
	pop	{r4, r5, r6, r7}
	pop	{r1}
	bx	r1
	thumb_func_end def_94_8_collision_8055F2C

.align 2, 0 @ Don't pad with nop.
