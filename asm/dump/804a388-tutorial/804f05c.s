	.include "asm/common.inc"

	thumb_func_start sub_804F05C
sub_804F05C:
	push	{r4, r5, r6, r7, lr}
	add	sp, sp, #0xfffffff0
	add	r6, r0, #0
	mov	r0, #0x94
	lsl	r0, r0, #0x1
	add	r2, r6, r0
	mov	r1, #0x95
	lsl	r1, r1, #0x1
	add	r0, r6, r1
	ldrh	r1, [r2]
	ldrh	r0, [r0]
	sub	r0, r0, r1
	asr	r0, r0, #0x4
	add	r1, r1, r0
	strh	r1, [r2]
	ldrh	r1, [r2]
	lsl	r0, r1, #0x2
	add	r0, r0, r1
	lsl	r0, r0, #0x3
	add	r0, r0, r1
	asr	r7, r0, #0x10
	cmp	r7, #0
	bne	.L804F0B0	@cond_branch
	mov	r2, #0x8c
	lsl	r2, r2, #0x1
	add	r4, r6, r2
	ldr	r0, [r4]
	cmp	r0, #0
	beq	.L804F09C	@cond_branch
	bl	sub_8060A94
	str	r7, [r4]
.L804F09C:
	mov	r0, #0x8e
	lsl	r0, r0, #0x1
	add	r4, r6, r0
	ldr	r0, [r4]
	cmp	r0, #0
	beq	.L804F15A	@cond_branch
	bl	sub_8060A94
	str	r7, [r4]
	b	.L804F15A
.L804F0B0:
	mov	r1, #0x8c
	lsl	r1, r1, #0x1
	add	r5, r6, r1
	ldr	r4, [r5]
	cmp	r4, #0
	bne	.L804F0DC	@cond_branch
	mov	r0, #0x0
	bl	allocSprite
	str	r0, [r5]
	cmp	r0, #0
	beq	.L804F0DC	@cond_branch
	ldr	r1, .L804F13C
	mov	r3, #0x80
	lsl	r3, r3, #0x2
	str	r4, [sp]
	str	r4, [sp, #0x4]
	str	r4, [sp, #0x8]
	str	r4, [sp, #0xc]
	add	r2, r3, #0
	bl	LoadSpriteSheet
.L804F0DC:
	mov	r2, #0x8e
	lsl	r2, r2, #0x1
	add	r5, r6, r2
	ldr	r4, [r5]
	cmp	r4, #0
	bne	.L804F10E	@cond_branch
	cmp	r7, #0x19
	ble	.L804F112	@cond_branch
	mov	r0, #0x0
	bl	allocSprite
	str	r0, [r5]
	cmp	r0, #0
	beq	.L804F10E	@cond_branch
	ldr	r1, .L804F13C + 4
	mov	r2, #0x84
	lsl	r2, r2, #0x7
	mov	r3, #0x80
	lsl	r3, r3, #0x2
	str	r4, [sp]
	str	r4, [sp, #0x4]
	str	r4, [sp, #0x8]
	str	r4, [sp, #0xc]
	bl	LoadSpriteSheet
.L804F10E:
	cmp	r7, #0x19
	bgt	.L804F126	@cond_branch
.L804F112:
	mov	r0, #0x8e
	lsl	r0, r0, #0x1
	add	r4, r6, r0
	ldr	r0, [r4]
	cmp	r0, #0
	beq	.L804F126	@cond_branch
	bl	sub_8060A94
	mov	r0, #0x0
	str	r0, [r4]
.L804F126:
	mov	r1, #0x8c
	lsl	r1, r1, #0x1
	add	r0, r6, r1
	ldr	r0, [r0]
	cmp	r0, #0
	beq	.L804F148	@cond_branch
	cmp	r7, #0x1a
	bgt	.L804F144	@cond_branch
	sub	r1, r7, #1
	b	.L804F146
.L804F13A:
	.align	2, 0
.L804F13C:
	.4byte	SpriteSheet_821DFF0
	.4byte	SpriteSheet_8224868
.L804F144:
	mov	r1, #0x19
.L804F146:
	strh	r1, [r0, #0x18]
.L804F148:
	mov	r2, #0x8e
	lsl	r2, r2, #0x1
	add	r0, r6, r2
	ldr	r1, [r0]
	cmp	r1, #0
	beq	.L804F15A	@cond_branch
	add	r0, r7, #0
	sub	r0, r0, #0x1a
	strh	r0, [r1, #0x18]
.L804F15A:
	mov	r1, #0x95
	lsl	r1, r1, #0x1
	add	r0, r6, r1
	ldrh	r1, [r0]
	mov	r0, #0xbd
	lsl	r0, r0, #0x8
	cmp	r1, r0
	bls	.L804F198	@cond_branch
	mov	r2, #0x88
	lsl	r2, r2, #0x1
	add	r0, r6, r2
	ldr	r4, [r0]
	mov	r1, #0x8a
	lsl	r1, r1, #0x1
	add	r0, r6, r1
	ldr	r3, [r0]
	mov	r2, #0x0
	ldr	r0, .L804F194
	ldr	r0, [r0]
	lsr	r0, r0, #0x4
	mov	r1, #0x3
	and	r0, r0, r1
	cmp	r0, #0x1
	bhi	.L804F18C	@cond_branch
	mov	r2, #0x1
.L804F18C:
	strh	r2, [r3, #0x18]
	strh	r2, [r4, #0x18]
	b	.L804F1E4
.L804F192:
	.align	2, 0
.L804F194:
	.4byte	_unk3000E30
.L804F198:
	ldr	r0, .L804F1C8
	cmp	r1, r0
	bhi	.L804F1D0	@cond_branch
	mov	r2, #0x88
	lsl	r2, r2, #0x1
	add	r0, r6, r2
	ldr	r3, [r0]
	mov	r1, #0x8a
	lsl	r1, r1, #0x1
	add	r0, r6, r1
	ldr	r2, [r0]
	ldr	r0, .L804F1C8 + 4
	ldr	r0, [r0]
	lsr	r0, r0, #0x4
	mov	r1, #0x3
	and	r0, r0, r1
	mov	r1, #0x0
	cmp	r0, #0x1
	bhi	.L804F1C0	@cond_branch
	mov	r1, #0x2
.L804F1C0:
	strh	r1, [r2, #0x18]
	strh	r1, [r3, #0x18]
	b	.L804F1E4
.L804F1C6:
	.align	2, 0
.L804F1C8:
	.4byte	0x2fff
	.4byte	_unk3000E30
.L804F1D0:
	mov	r2, #0x88
	lsl	r2, r2, #0x1
	add	r0, r6, r2
	ldr	r0, [r0]
	mov	r1, #0x0
	strh	r1, [r0, #0x18]
	add	r2, r2, #0x4
	add	r0, r6, r2
	ldr	r0, [r0]
	strh	r1, [r0, #0x18]
.L804F1E4:
	mov	r1, #0x88
	lsl	r1, r1, #0x1
	add	r0, r6, r1
	ldr	r1, [r0]
	ldr	r5, [r1, #0xc]
	mov	r2, #0x98
	lsl	r2, r2, #0x1
	add	r0, r6, r2
	ldr	r0, [r0]
	sub	r0, r0, r5
	asr	r0, r0, #0x3
	add	r5, r5, r0
	sub	r2, r2, #0x1c
	add	r0, r6, r2
	ldr	r0, [r0]
	str	r5, [r0, #0xc]
	str	r5, [r1, #0xc]
	mov	r1, #0x8c
	lsl	r1, r1, #0x1
	add	r0, r6, r1
	ldr	r0, [r0]
	cmp	r0, #0
	beq	.L804F214	@cond_branch
	str	r5, [r0, #0xc]
.L804F214:
	mov	r2, #0x8e
	lsl	r2, r2, #0x1
	add	r0, r6, r2
	ldr	r0, [r0]
	cmp	r0, #0
	beq	.L804F222	@cond_branch
	str	r5, [r0, #0xc]
.L804F222:
	add	r4, r6, #0
	add	r4, r4, #0x60
	asr	r7, r5, #0x8
	add	r2, r7, #0
	add	r2, r2, #0x14
	lsl	r2, r2, #0x10
	asr	r2, r2, #0x10
	add	r0, r4, #0
	mov	r1, #0xa
	bl	sub_8061844
	mov	r0, #0x4
	bl	sub_8051780
	cmp	r0, #0
	bne	.L804F25C	@cond_branch
	add	r0, r6, #0
	add	r0, r0, #0x90
	add	r2, r7, #4
	lsl	r2, r2, #0x10
	asr	r2, r2, #0x10
	mov	r1, #0xd0
	bl	sub_8061844
	mov	r1, #0x92
	lsl	r1, r1, #0x1
	add	r0, r6, r1
	ldr	r0, [r0]
	str	r5, [r0, #0xc]
.L804F25C:
	ldr	r0, .L804F288
	ldr	r0, [r0]
	mov	r2, #0x8d
	lsl	r2, r2, #0x2
	add	r0, r0, r2
	ldr	r0, [r0]
	lsl	r5, r0, #0x4
	bl	sub_8051734
	ldr	r0, [r0, #0x4]
	cmp	r5, r0
	bge	.L804F28C	@cond_branch
	bl	sub_8057C40
	asr	r0, r0, #0x4
	mov	r1, #0x7
	and	r0, r0, r1
	mov	r2, #0xf
	cmp	r0, #0x3
	bgt	.L804F28E	@cond_branch
	mov	r2, #0xe
	b	.L804F28E
.L804F288:
	.align	2, 0

	.4byte	_gameData
.L804F28C:
	mov	r2, #0xf
.L804F28E:
	add	r0, r4, #0
	add	r1, r5, #0
	bl	sub_8061C48
	add	sp, sp, #0x10
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
	thumb_func_end sub_804F05C

.align 2, 0 @ Don't pad with nop.
