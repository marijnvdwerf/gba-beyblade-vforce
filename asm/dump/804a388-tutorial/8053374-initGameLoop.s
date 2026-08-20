	.include "asm/common.inc"

	thumb_func_start initGameLoop
initGameLoop:
	push	{r4, r5, r6, r7, lr}
	mov	r7, r8
	push	{r7}
	ldr	r0, .L8053424
	ldr	r0, [r0]
	ldr	r1, .L8053424 + 4
	add	r0, r0, r1
	bl	nullsub_12
	bl	getSomeLevelID
	mov	r8, r0
	mov	r0, #0x2
	bl	sub_8051780
	cmp	r0, #0
	beq	.L80533AC	@cond_branch
	mov	r0, #0x20
	bl	sub_8051780
	cmp	r0, #0
	bne	.L80533AC	@cond_branch
	ldr	r0, .L8053424 + 8
	ldr	r1, [r0]
	ldr	r2, .L8053424 + 12
	add	r0, r1, r2
	ldrh	r0, [r0]
	strb	r0, [r1]
.L80533AC:
	bl	GetLevelDescriptionNo
	bl	getLevelDescription2
	ldr	r5, .L8053424
	ldr	r2, [r5]
	ldr	r3, .L8053424 + 16
	add	r0, r2, r3
	mov	r6, #0x0
	mov	r4, #0x0
	strh	r4, [r0]
	ldr	r7, .L8053424 + 20
	add	r0, r2, r7
	str	r4, [r0]
	ldr	r0, .L8053424 + 24
	add	r1, r2, r0
	ldr	r7, .L8053424 + 28
	add	r3, r7, #0
	ldrh	r0, [r1]
	orr	r0, r0, r3
	strh	r0, [r1]
	ldr	r1, .L8053424 + 32
	add	r0, r2, r1
	mov	r1, #0x1
	NEG	r1, r1
	str	r1, [r0]
	ldr	r7, .L8053424 + 36
	add	r0, r2, r7
	str	r1, [r0]
	ldr	r0, .L8053424 + 40
	add	r1, r2, r0
	ldrh	r0, [r1]
	orr	r0, r0, r3
	strh	r0, [r1]
	ldr	r1, .L8053424 + 44
	add	r0, r2, r1
	ldrh	r7, [r0]
	orr	r3, r3, r7
	strh	r3, [r0]
	ldr	r0, .L8053424 + 48
	add	r2, r2, r0
	strb	r6, [r2]
	ldr	r1, [r5]
	ldr	r2, .L8053424 + 52
	add	r0, r1, r2
	strh	r4, [r0]
	ldr	r3, .L8053424 + 56
	add	r0, r1, r3
	str	r4, [r0]
	ldr	r7, .L8053424 + 60
	add	r0, r1, r7
	ldrb	r0, [r0]
	cmp	r0, #0
	bne	.L8053464	@cond_branch
	mov	r0, #0x86
	lsl	r0, r0, #0x3
	add	r1, r1, r0
	mov	r0, #0xa
	b	.L805346C
.L8053422:
	.align	2, 0
.L8053424:
	.4byte	_gameData
	.4byte	0x434
	.4byte	_currentGameState
	.4byte	0x6c4
	.4byte	0x161c
	.4byte	0x998
	.4byte	0xc24
	.4byte	0xffff
	.4byte	0xc28
	.4byte	0xc2c
	.4byte	0xc26
	.4byte	0xc6c
	.4byte	0xb53
	.4byte	0xc6e
	.4byte	0x163c
	.4byte	0x1618
.L8053464:
	mov	r2, #0x86
	lsl	r2, r2, #0x3
	add	r1, r1, r2
	mov	r0, #0x1
.L805346C:
	str	r0, [r1]
	mov	r0, #0x0
	bl	sub_8053F0C
	ldr	r7, .L80535A0
	ldr	r0, [r7]
	ldr	r3, .L80535A0 + 4
	add	r0, r0, r3
	mov	r5, #0x0
	strb	r5, [r0]
	ldr	r0, [r7]
	ldr	r1, .L80535A0 + 8
	add	r0, r0, r1
	strb	r5, [r0]
	bl	emptyBeybladeActorData
	ldr	r1, [r7]
	ldr	r3, .L80535A0 + 12
	add	r2, r1, r3
	ldr	r0, .L80535A0 + 16
	ldr	r0, [r0]
	str	r0, [r2]
	ldr	r2, .L80535A0 + 20
	add	r0, r1, r2
	str	r5, [r0]
	add	r3, r3, #0x14
	add	r0, r1, r3
	str	r5, [r0]
	add	r2, r2, #0x8
	add	r0, r1, r2
	str	r5, [r0]
	add	r3, r3, #0x8
	add	r0, r1, r3
	str	r5, [r0]
	ldr	r0, .L80535A0 + 24
	add	r1, r1, r0
	str	r5, [r1]
	ldr	r6, .L80535A0 + 28
	add	r0, r6, #0
	bl	slowAllocate
	add	r4, r0, #0
	cmp	r4, #0
	bne	.L80534CC	@cond_branch
	ldr	r0, .L80535A0 + 32
	add	r1, r6, #0
	bl	printf
.L80534CC:
	ldr	r0, [r7]
	mov	r2, #0x85
	lsl	r2, r2, #0x3
	add	r1, r0, r2
	str	r4, [r1]
	ldr	r3, .L80535A0 + 36
	add	r0, r0, r3
	ldr	r1, [r4]
	str	r1, [r0]
	bl	initRiders
	mov	r0, r8
	lsl	r4, r0, #0x10
	lsr	r4, r4, #0x10
	add	r0, r4, #0
	bl	initLevelEnvironmentActors
	mov	r0, r8
	bl	initEventListeners
	add	r0, r4, #0
	bl	initCollectables
	add	r0, r4, #0
	bl	initTutorialManagement
	bl	nullsub_2
	bl	LoadHUD
	ldr	r0, [r7]
	ldr	r1, .L80535A0 + 40
	add	r0, r0, r1
	ldrb	r0, [r0]
	bl	sub_804F800
	ldr	r1, [r7]
	ldr	r2, .L80535A0 + 44
	add	r0, r1, r2
	str	r5, [r0]
	ldr	r3, .L80535A0 + 48
	add	r0, r1, r3
	str	r5, [r0]
	ldr	r2, .L80535A0 + 52
	add	r0, r1, r2
	strh	r5, [r0]
	mov	r3, #0xb2
	lsl	r3, r3, #0x4
	add	r0, r1, r3
	strh	r5, [r0]
	add	r2, r2, #0x2
	add	r0, r1, r2
	strh	r5, [r0]
	add	r3, r3, #0x8
	add	r0, r1, r3
	strh	r5, [r0]
	add	r2, r2, #0x2
	add	r0, r1, r2
	strh	r5, [r0]
	add	r3, r3, #0x2
	add	r0, r1, r3
	strh	r5, [r0]
	ldr	r2, .L80535A0 + 56
	add	r0, r1, r2
	strh	r5, [r0]
	mov	r3, #0x98
	lsl	r3, r3, #0x4
	add	r1, r1, r3
	str	r5, [r1]
	mov	r0, #0x4
	bl	sub_8051780
	cmp	r0, #0
	beq	.L805356A	@cond_branch
	ldr	r0, [r7]
	ldr	r7, .L80535A0 + 40
	add	r0, r0, r7
	mov	r1, #0x0
	strb	r1, [r0]
.L805356A:
	mov	r0, #0x1
	bl	sub_8051780
	cmp	r0, #0
	beq	.L805357C	@cond_branch
	mov	r0, #0xe1
	lsl	r0, r0, #0x4
	bl	initKeyRecording
.L805357C:
	mov	r0, #0x2
	bl	sub_8051780
	cmp	r0, #0
	beq	.L80535F6	@cond_branch
	ldr	r0, .L80535A0 + 60
	ldr	r1, [r0]
	ldr	r2, .L80535A0 + 64
	add	r0, r1, r2
	ldr	r2, [r0]
	cmp	r2, #0
	bne	.L80535E8	@cond_branch
	ldr	r1, .L80535A0 + 68
	mov	r0, #0x0
	bl	sub_805AAEC
	b	.L80535F6
.L805359E:
	.align	2, 0
.L80535A0:
	.4byte	_gameData
	.4byte	0x161b
	.4byte	0x1641
	.4byte	0x978
	.4byte	_unk3000E30
	.4byte	0x988
	.4byte	0x91c
	.4byte	0x2990
	.4byte	Str_87294CC
	.4byte	0x42c
	.4byte	0x1638
	.4byte	0xc28
	.4byte	0x984
	.4byte	0xb22
	.4byte	0x99c
	.4byte	_currentGameState
	.4byte	0x6bc
	.4byte	0x8ca0
.L80535E8:
	mov	r3, #0xd8
	lsl	r3, r3, #0x3
	add	r0, r1, r3
	ldrh	r1, [r0]
	add	r0, r2, #0
	bl	sub_805AAEC
.L80535F6:
	pop	{r3}
	mov	r8, r3
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
	thumb_func_end initGameLoop

.align 2, 0 @ Don't pad with nop.
