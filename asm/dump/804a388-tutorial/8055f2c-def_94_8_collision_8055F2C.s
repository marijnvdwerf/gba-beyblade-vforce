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
	bge	.L1	@cond_branch
	mov	sl, r3
.L1:
	mov	r9, r4
	cmp	r1, r0
	ble	.L2	@cond_branch
	mov	r9, r3
.L2:
	ldr	r0, [sp, #0x2c]
	cmp	r0, #0
	bne	.L3	@cond_branch
	b	.L60
.L3:
	ldrb	r1, [r7, #0x10]
	add	r0, r6, #0
	and	r0, r0, r1
	add	r2, r1, #0
	cmp	r0, #0
	bne	.L5	@cond_branch
	b	.L60
.L5:
	ldrb	r0, [r7, #0xf]
	sub	r0, r0, #0x8c
	cmp	r0, #0xe
	bls	.L7	@cond_branch
	b	.L25
.L7:
	lsl	r0, r0, #0x2
	ldr	r1, .L10
	add	r0, r0, r1
	ldr	r0, [r0]
	mov	pc, r0
.L11:
	.align	2, 0
.L10:
	.4byte	.L9
.L9:
	.4byte	.L12
	.4byte	.L13
	.4byte	.L63
	.4byte	.L25
	.4byte	.L63
	.4byte	.L25
	.4byte	.L25
	.4byte	.L25
	.4byte	.L25
	.4byte	.L25
	.4byte	.L25
	.4byte	.L25
	.4byte	.L25
	.4byte	.L25
	.4byte	.L26
.L12:
	ldrh	r4, [r7, #0x16]
	mov	r1, #0x80
	lsl	r1, r1, #0x13
	ldr	r0, [sp, #0x2c]
	bl	RiderHasFlag
	lsl	r0, r0, #0x18
	cmp	r0, #0
	beq	.L27	@cond_branch
	b	.L63
.L27:
	add	r0, r6, #0
	ldrb	r1, [r7, #0x10]
	and	r0, r0, r1
	cmp	r0, #0
	bne	.L29	@cond_branch
	b	.L63
.L29:
	lsl	r0, r4, #0x10
	add	r4, r0, #0
	cmp	r4, #0
	bne	.L33	@cond_branch
	mov	r2, r9
	ldr	r1, [r2, #0x8]
	cmp	r1, #0
	beq	.L33	@cond_branch
	lsl	r1, r1, #0x5
	ldr	r0, [r5, #0xc]
	cmp	r0, r1
	ble	.L33	@cond_branch
	b	.L63
.L33:
	asr	r0, r4, #0x10
	cmp	r0, #0
	ble	.L51	@cond_branch
	lsl	r3, r0, #0x3
	mov	r0, sl
	ldr	r2, [r0, #0x8]
.L52:
	sub	r0, r2, r3
	lsl	r0, r0, #0x5
	ldr	r1, [r5, #0xc]
	cmp	r1, r0
	bge	.L36	@cond_branch
	b	.L63
.L36:
	add	r0, r2, r3
	lsl	r0, r0, #0x5
	cmp	r1, r0
	ble	.L51	@cond_branch
	b	.L63
.L51:
	asr	r0, r4, #0x10
	cmp	r0, #0
	bge	.L41	@cond_branch
	lsl	r0, r0, #0x3
	mov	r2, sl
	ldr	r1, [r2, #0x8]
	sub	r1, r1, r0
	lsl	r1, r1, #0x5
	ldr	r0, [r5, #0xc]
	cmp	r0, r1
	ble	.L41	@cond_branch
	b	.L63
.L41:
	mov	r0, r8
	add	r1, r7, #0
	bl	sub_805BAC0
	add	r6, r0, #0
	mov	r0, #0x1
	NEG	r0, r0
	cmp	r6, r0
	beq	.L63	@cond_branch
	mov	r0, r8
	add	r1, r6, #0
	bl	GetLineMetaData
	add	r5, r0, #0
	cmp	r5, #0
	beq	.L63	@cond_branch
	mov	r0, r8
	add	r1, r5, #0
	mov	r2, #0x6
	bl	getLineMetaObjectBytype
	add	r4, r0, #0
	cmp	r4, #0
	beq	.L63	@cond_branch
	ldr	r0, [sp, #0x2c]
	bl	SetRiderGlobal
	str	r4, [sp]
	mov	r0, r8
	add	r1, r7, #0
	add	r2, r6, #0
	add	r3, r5, #0
	bl	processMetadata_6
	b	.L63
.L26:
	ldrh	r0, [r7, #0x16]
	and	r2, r2, r6
	cmp	r2, #0
	beq	.L63	@cond_branch
	lsl	r0, r0, #0x10
	add	r4, r0, #0
	cmp	r4, #0
	bne	.L49	@cond_branch
	mov	r0, r9
	ldr	r1, [r0, #0x8]
	cmp	r1, #0
	beq	.L49	@cond_branch
	lsl	r1, r1, #0x5
	ldr	r0, [r5, #0xc]
	cmp	r0, r1
	bgt	.L63	@cond_branch
.L49:
	asr	r0, r4, #0x10
	cmp	r0, #0
	ble	.L51	@cond_branch
	lsl	r3, r0, #0x3
	mov	r1, sl
	ldr	r2, [r1, #0x8]
	b	.L52
.L13:
	ldrh	r1, [r7, #0x16]
	lsl	r0, r1, #0x3
	mov	r2, sl
	ldr	r1, [r2, #0x8]
	sub	r1, r1, r0
	lsl	r1, r1, #0x5
	ldr	r0, [r5, #0xc]
	cmp	r0, r1
	blt	.L63	@cond_branch
.L25:
	mov	r0, #0x66
	and	r0, r0, r6
	cmp	r0, #0
	beq	.L54	@cond_branch
	mov	r1, r9
	ldr	r0, [r1, #0x8]
	lsl	r0, r0, #0x5
	ldr	r1, [r5, #0xc]
	sub	r0, r0, r1
	ldr	r1, .L57
	cmp	r0, r1
	ble	.L63	@cond_branch
	ldr	r1, [sp, #0x2c]
	add	r1, r1, #0x88
	mov	r0, #0xdc
	str	r0, [r1]
	mov	r2, r9
	ldr	r0, [r2, #0x8]
	lsl	r0, r0, #0x5
	str	r0, [r5, #0xc]
	b	.L63
.L58:
	.align	2, 0
.L57:
	.4byte	0xfffffd00
.L54:
	ldr	r0, [r3, #0x8]
	cmp	r0, #0
	bne	.L59	@cond_branch
	ldr	r0, [r4, #0x8]
	cmp	r0, #0
	beq	.L60	@cond_branch
.L59:
	mov	r0, #0x4
	ldrb	r1, [r7, #0x11]
	and	r0, r0, r1
	cmp	r0, #0
	bne	.L61	@cond_branch
	mov	r0, r8
	add	r1, r7, #0
	add	r2, r5, #0
	add	r3, sp, #0x4
	bl	sub_80567E4
	b	.L62
.L61:
	mov	r0, r8
	add	r1, r7, #0
	add	r2, r5, #0
	add	r3, sp, #0x4
	bl	sub_8056910
.L62:
	ldr	r0, [sp, #0xc]
	ldr	r2, .L65
	add	r0, r0, r2
	ldr	r1, [r5, #0xc]
	cmp	r0, r1
	blt	.L63	@cond_branch
.L60:
	mov	r0, #0x1
	b	.L64
.L66:
	.align	2, 0
.L65:
	.4byte	0xfffff400
.L63:
	mov	r0, #0x0
.L64:
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
