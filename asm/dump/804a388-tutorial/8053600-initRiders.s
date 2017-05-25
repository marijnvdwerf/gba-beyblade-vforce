	.include "asm/common.inc"

	thumb_func_start initRiders
initRiders:
	push	{r4, r5, r6, r7, lr}
	mov	r7, sl
	mov	r6, r9
	mov	r5, r8
	push	{r5, r6, r7}
	add	sp, sp, #0xfffffecc
	bl	GetLevelDescriptionNo
	bl	getLevelDescription2
	add	r4, r0, #0
	mov	r0, #0x0
	str	r0, [sp, #0x12c]
	mov	r9, r0
	bl	getSomeLevelID
	lsl	r0, r0, #0x10
	lsr	r0, r0, #0x10
	bl	loadLevelGeometry
	add	r1, r0, #0
	cmp	r1, #0
	bne	.L1	@cond_branch
	ldr	r0, .L3
	bl	printf
	b	.L2
.L4:
	.align	2, 0
.L3:
	.4byte	0x8729504
.L1:
	add	r0, sp, #0xc
	bl	getLevelGeometryAddresses
	ldr	r1, [r4, #0x2c]
	add	r0, sp, #0xc
	bl	StoreMetadataAddr
	add	r0, sp, #0xc
	mov	r1, #0x86
	mov	r2, #0x0
	bl	GetLineIndexOfType
	mov	sl, r0
	mov	r0, #0x1
	NEG	r0, r0
	cmp	sl, r0
	bne	.L5	@cond_branch
	ldr	r0, .L7
	bl	printf
	b	.L37
.L8:
	.align	2, 0
.L7:
	.4byte	0x8729564
.L36:
	ldr	r0, .L10
	bl	printf
	b	.L37
.L11:
	.align	2, 0
.L10:
	.4byte	0x8729610
.L5:
	mov	r1, sl
	cmp	r1, #0
	bge	.L38	@cond_branch
	b	.L37
.L38:
	mov	r2, sl
	lsl	r1, r2, #0x5
	ldr	r0, [sp, #0x18]
	add	r0, r0, r1
	mov	r8, r0
	ldr	r0, [r0]
	lsl	r0, r0, #0x4
	ldr	r1, [sp, #0x10]
	add	r1, r1, r0
	mov	r3, r8
	ldrh	r3, [r3, #0x16]
	str	r3, [sp, #0x130]
	ldr	r0, [r1]
	asr	r7, r0, #0x3
	ldr	r0, [r1, #0x4]
	asr	r6, r0, #0x3
	ldr	r0, [r1, #0x8]
	asr	r4, r0, #0x3
	cmp	r3, #0
	beq	.L14	@cond_branch
	b	.L15
.L14:
	ldr	r0, .L21
	ldr	r5, [r0]
	mov	r1, #0x0
	str	r1, [sp, #0x128]
	mov	r0, #0x1
	ldr	r2, [sp, #0x12c]
	and	r0, r0, r2
	cmp	r0, #0
	bne	.L16	@cond_branch
	ldr	r3, .L21 + 4
	add	r0, r5, r3
	ldrb	r0, [r0]
	cmp	r0, #0
	beq	.L20	@cond_branch
	bl	isMultiplayer
	lsl	r0, r0, #0x10
	cmp	r0, #0
	beq	.L20	@cond_branch
	add	r0, sp, #0xc
	mov	r1, #0x99
	mov	r2, #0x0
	bl	GetLineIndexOfType
	cmp	r0, #0
	blt	.L19	@cond_branch
	lsl	r1, r0, #0x5
	ldr	r0, [sp, #0x18]
	add	r0, r0, r1
	str	r0, [sp, #0x128]
	ldr	r0, [r0]
	lsl	r0, r0, #0x4
	ldr	r1, [sp, #0x10]
	add	r1, r1, r0
	ldr	r0, [r1]
	asr	r7, r0, #0x3
	ldr	r0, [r1, #0x4]
	asr	r6, r0, #0x3
	ldr	r0, [r1, #0x8]
	asr	r4, r0, #0x3
	b	.L20
.L22:
	.align	2, 0
.L21:
	.4byte	0x3000fb0
	.4byte	0x1618
.L19:
	ldr	r2, .L25
	mov	r0, r8
	ldrb	r1, [r0, #0x8]
	lsl	r0, r1, #0x1
	add	r0, r0, r2
	mov	r3, #0x0
	ldsh	r0, [r0, r3]
	asr	r0, r0, #0x3
	add	r7, r7, r0
	add	r1, r1, #0x40
	lsl	r1, r1, #0x1
	add	r1, r1, r2
	mov	r2, #0x0
	ldsh	r0, [r1, r2]
	lsl	r0, r0, #0x5
	NEG	r0, r0
	asr	r0, r0, #0x8
	add	r6, r6, r0
	ldr	r3, .L25 + 4
	add	r0, r5, r3
	ldrb	r1, [r0]
	ldr	r0, .L25 + 8
	bl	printf
.L20:
	bl	sub_8051820
	ldr	r2, .L25 + 12
	ldr	r1, [r2]
	ldr	r3, .L25 + 16
	add	r1, r1, r3
	add	r2, r4, #0
	add	r2, r2, #0x80
	str	r2, [sp]
	ldr	r2, [sp, #0x130]
	str	r2, [sp, #0x4]
	str	r0, [sp, #0x8]
	add	r0, r5, #0
	add	r2, r7, #0
	add	r3, r6, #0
	bl	initRider
	add	r0, r5, #0
	add	r1, sp, #0xc
	mov	r2, sl
	bl	processRiderMetadata
	ldr	r3, [sp, #0x128]
	cmp	r3, #0
	beq	.L23	@cond_branch
	mov	r1, #0x80
	lsl	r1, r1, #0x2
	add	r0, r5, r1
	b	.L24
.L26:
	.align	2, 0
.L25:
	.4byte	0x874cc3c
	.4byte	0x3ce
	.4byte	0x8729598
	.4byte	0x3000fb0
	.4byte	0x434
.L23:
	mov	r2, #0x80
	lsl	r2, r2, #0x2
	add	r0, r5, r2
	mov	r3, r8
.L24:
	str	r3, [r0]
	mov	r0, r8
	ldrb	r1, [r0, #0x8]
	add	r0, r5, #0
	bl	sub_804E1FC
	add	r0, r5, #0
	mov	r1, #0x1
	bl	sub_804C888
	mov	r0, #0x1
	ldr	r1, [sp, #0x12c]
	orr	r1, r1, r0
	str	r1, [sp, #0x12c]
	b	.L27
.L16:
	ldr	r0, .L32
	bl	printf
.L27:
	ldr	r3, .L32 + 4
	ldr	r2, [r3]
	ldr	r1, .L32 + 8
	add	r0, r2, r1
	ldrb	r0, [r0]
	cmp	r0, #0
	beq	.L34	@cond_branch
	ldr	r3, .L32 + 12
	add	r0, r2, r3
	mov	r3, r9
	lsl	r1, r3, #0x5
	ADD r1, r9
	lsl	r1, r1, #0x2
	ADD r1, r9
	lsl	r1, r1, #0x3
	ldr	r0, [r0]
	add	r5, r0, r1
	cmp	r3, #0x9
	ble	.L29	@cond_branch
	b	.L36
.L29:
	ldr	r0, .L32 + 16
	add	r1, r2, r0
	mov	r0, #0x0
	str	r0, [sp]
	str	r3, [sp, #0x4]
	mov	r3, #0xae
	lsl	r3, r3, #0x5
	add	r0, r2, r3
	mov	r2, #0x0
	ldsh	r0, [r0, r2]
	str	r0, [sp, #0x8]
	add	r0, r5, #0
	mov	r2, #0x0
	mov	r3, #0x0
	bl	initRider
	add	r0, r5, #0
	mov	r1, #0x80
	lsl	r1, r1, #0x13
	bl	SetRiderFlag
	mov	r3, #0x1
	ADD r9, r3
	b	.L34
.L33:
	.align	2, 0
.L32:
	.4byte	0x87295d0
	.4byte	0x3000fb0
	.4byte	0x1618
	.4byte	0x42c
	.4byte	0x434
.L15:
	ldr	r0, .L39
	ldr	r2, [r0]
	ldr	r1, .L39 + 4
	add	r0, r2, r1
	ldrb	r0, [r0]
	cmp	r0, #0
	bne	.L34	@cond_branch
	ldr	r3, .L39 + 8
	add	r0, r2, r3
	mov	r3, r9
	lsl	r1, r3, #0x5
	ADD r1, r9
	lsl	r1, r1, #0x2
	ADD r1, r9
	lsl	r1, r1, #0x3
	ldr	r0, [r0]
	add	r5, r0, r1
	cmp	r3, #0x9
	ble	.L35	@cond_branch
	b	.L36
.L35:
	ldr	r0, .L39 + 12
	add	r1, r2, r0
	str	r4, [sp]
	mov	r4, r9
	add	r4, r4, #0x1
	str	r4, [sp, #0x4]
	mov	r2, r8
	ldrh	r0, [r2, #0x16]
	sub	r0, r0, #0x1
	str	r0, [sp, #0x8]
	add	r0, r5, #0
	add	r2, r7, #0
	add	r3, r6, #0
	bl	initRider
	add	r0, r5, #0
	add	r1, sp, #0xc
	mov	r2, sl
	bl	processRiderMetadata
	add	r0, r5, #0
	mov	r1, #0x80
	lsl	r1, r1, #0x13
	bl	SetRiderFlag
	mov	r9, r4
.L34:
	mov	r2, sl
	add	r2, r2, #0x1
	lsl	r2, r2, #0x10
	lsr	r2, r2, #0x10
	add	r0, sp, #0xc
	mov	r1, #0x86
	bl	GetLineIndexOfType
	mov	sl, r0
	cmp	r0, #0
	blt	.L37	@cond_branch
	b	.L38
.L37:
	ldr	r0, .L39
	ldr	r0, [r0]
	mov	r3, #0x86
	lsl	r3, r3, #0x3
	add	r0, r0, r3
	mov	r1, r9
	str	r1, [r0]
.L2:
	add	sp, sp, #0x134
	pop	{r3, r4, r5}
	mov	r8, r3
	mov	r9, r4
	mov	sl, r5
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L40:
	.align	2, 0
.L39:
	.4byte	0x3000fb0
	.4byte	0x1618
	.4byte	0x42c
	.4byte	0x434
	thumb_func_end initRiders

.align 2, 0 @ Don't pad with nop.
