	.include "asm/common.inc"

	thumb_func_start mainLoop
mainLoop:
	push	{r4, r5, lr}
	ldr	r1, .L3
	ldr	r2, .L3 + 4
	add	r0, r2, #0
	strh	r0, [r1]
	bl	sub_8057944
	mov	r0, #0x8
	bl	InitStuff_SetDispStat
	mov	r0, #0x11
	bl	EnableInterrupt
	bl	sub_805791C
	bl	initBlockVariables
	bl	initKeyState
	bl	initBattery
	bl	sub_8063A50
	mov	r0, #0x2
	mov	r1, #0x0
	bl	sub_8063A68
	mov	r0, #0x0
	bl	sub_8063A7C
	mov	r0, #0x2
	mov	r1, #0x10
	mov	r2, #0x3
	bl	initMultiPlayer
	ldr	r0, .L3 + 8
	mov	r1, #0x2
	bl	allocateSoundTables
	ldr	r0, .L3 + 12
	bl	sub_8062B20
	bl	allocateActorHeaps
	mov	r0, #0x80
	mov	r1, #0x20
	bl	SpriteVRamFree
	bl	initGame
	bl	InitCurrentGameState
	bl	sub_8055CB8
	bl	nullsub_11
	ldr	r0, .L3 + 16
	ldr	r0, [r0]
	mov	r1, #0xba
	lsl	r1, r1, #0x4
	add	r0, r0, r1
	mov	r1, #0x0
	bl	allocateRenderCode
	bl	sub_8052514
	bl	sub_8049264
	mov	r5, #0x80
	lsl	r5, r5, #0x13
	mov	r4, #0x0
.L2:
	mov	r0, #0x80
	mov	r1, #0x20
	bl	SpriteVRamFree
	bl	sub_8049458
	bl	VBlankIntrWait
	bl	sub_80627F0
	bl	updateKeyState
	mov	r0, #0x80
	mov	r1, #0x20
	bl	SpriteVRamFree
	strh	r4, [r5]
	bl	initGameLoop
	bl	gameLoop
	strh	r4, [r5]
	bl	VBlankIntrWait
	bl	sub_80627F0
	bl	sub_8053B94
	bl	closeGame
	mov	r0, #0x2
	bl	sub_8051780
	cmp	r0, #0
	bne	.L2	@cond_branch
	bl	sub_80512AC
	b	.L2
.L4:
	.align	2, 0
.L3:
	.4byte	0x4000204
	.4byte	0x4014
	.4byte	0x2b11
	.4byte	0x8040cc4
	.4byte	0x3000fb0
	thumb_func_end mainLoop

.align 2, 0 @ Don't pad with nop.
