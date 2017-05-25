	.include "asm/common.inc"

	thumb_func_start initRider
initRider:
	push	{r4, r5, r6, r7, lr}
	mov	r7, sl
	mov	r6, r9
	mov	r5, r8
	push	{r5, r6, r7}
	add	sp, sp, #0xffffffe8
	add	r6, r0, #0
	mov	sl, r1
	str	r2, [sp, #0x10]
	str	r3, [sp, #0x14]
	ldr	r5, [sp, #0x40]
	mov	r0, #0x8e
	lsl	r0, r0, #0x2
	add	r7, r6, r0
	mov	r1, #0xbf
	lsl	r1, r1, #0x2
	add	r1, r1, r6
	mov	r9, r1
	add	r0, r5, #0
	bl	getBeybladeData0
	ldr	r4, .L5
	ldr	r3, [r4]
	mov	r0, #0x0
	add	r1, r7, #0
	mov	r2, #0xc4
	bl	call_via_r3
	mov	r2, #0xb8
	lsl	r2, r2, #0x2
	add	r1, r6, r2
	ldr	r3, [r4]
	mov	r0, #0x0
	mov	r2, #0x8
	bl	call_via_r3
	add	r0, r5, #0
	bl	getBeyBladeActorDataForIndex
	add	r4, r0, #0
	add	r0, r5, #0
	bl	getBeybladeActorData
	ldrb	r1, [r0, #0x4]
	ldr	r3, .L5 + 4
	add	r0, r6, r3
	mov	r5, #0x0
	strb	r1, [r0]
	ldr	r0, [sp, #0x14]
	str	r0, [sp]
	ldr	r1, [sp, #0x38]
	str	r1, [sp, #0x4]
	mov	r2, #0x1
	NEG	r2, r2
	mov	r8, r2
	str	r2, [sp, #0x8]
	add	r0, r7, #0
	add	r1, r4, #0
	mov	r2, sl
	ldr	r3, [sp, #0x10]
	bl	actor_8057C58
	add	r0, r7, #0
	mov	r1, #0xf
	mov	r2, #0x14
	bl	ActorSetSpriteOffset
	add	r0, r7, #0
	mov	r1, #0x0
	mov	r2, #0x0
	mov	r3, #0x4
	bl	rider_8058614
	add	r0, r7, #0
	mov	r1, #0x7
	bl	actor_80585F0
	mov	r0, #0x1
	str	r0, [sp]
	add	r0, r7, #0
	mov	r1, r8
	mov	r2, r8
	mov	r3, #0x1
	bl	actor_80585F8
	mov	r3, #0xb3
	lsl	r3, r3, #0x2
	add	r1, r6, r3
	ldr	r0, .L5 + 8
	str	r0, [r1]
	mov	r0, #0xb2
	lsl	r0, r0, #0x2
	add	r1, r6, r0
	ldr	r0, .L5 + 12
	str	r0, [r1]
	mov	r1, #0xba
	lsl	r1, r1, #0x2
	add	r0, r6, r1
	ldr	r2, .L5 + 16
	str	r2, [r0]
	add	r3, r3, #0x20
	add	r0, r6, r3
	str	r6, [r0]
	mov	r1, #0x10
	ldr	r0, [sp, #0x3c]
	cmp	r0, #0
	beq	.L1	@cond_branch
	mov	r1, #0x20
.L1:
	mov	r2, #0xbd
	lsl	r2, r2, #0x2
	add	r0, r6, r2
	mov	r4, #0x0
	strh	r1, [r0]
	add	r0, r6, #0
	add	r1, r7, #0
	bl	s_rider_804C4B4
	str	r6, [r6, #0x4]
	ldr	r1, .L5 + 20
	ldr	r3, .L5 + 24
	str	r3, [sp]
	mov	r0, #0xfa
	lsl	r0, r0, #0x7
	str	r0, [sp, #0x4]
	mov	r0, r8
	str	r0, [sp, #0x8]
	mov	r0, r9
	mov	r2, sl
	bl	actor_8057C58
	mov	r0, r9
	mov	r1, #0x1
	bl	sub_80585C8
	mov	r0, r9
	mov	r1, #0x8
	mov	r2, #0x4
	bl	ActorSetSpriteOffset
	ldr	r1, .L5 + 28
	add	r0, r6, r1
	strb	r4, [r0]
	mov	r2, #0xeb
	lsl	r2, r2, #0x2
	add	r0, r6, r2
	ldr	r3, .L5 + 16
	str	r3, [r0]
	add	r1, r1, #0x83
	add	r0, r6, r1
	mov	r1, #0x80
	lsl	r1, r1, #0x1
	strh	r1, [r0]
	mov	r3, #0xf5
	lsl	r3, r3, #0x2
	add	r2, r6, r3
	ldr	r3, [sp, #0x3c]
	lsl	r0, r3, #0x4
	add	r0, r0, r1
	lsl	r0, r0, #0x5
	ldr	r1, .L5 + 32
	add	r0, r0, r1
	str	r0, [r2]
	mov	r2, #0xf2
	lsl	r2, r2, #0x2
	add	r0, r6, r2
	strh	r5, [r0]
	mov	r3, #0xf3
	lsl	r3, r3, #0x2
	add	r0, r6, r3
	strh	r5, [r0]
	ldr	r1, .L5 + 36
	add	r0, r6, r1
	strh	r5, [r0]
	sub	r2, r2, #0x8
	add	r0, r6, r2
	str	r5, [r0]
	add	r3, r3, #0x2
	add	r0, r6, r3
	add	r1, sp, #0x3c
	ldrb	r1, [r1]
	strb	r1, [r0]
	add	r2, r2, #0x18
	add	r0, r6, r2
	str	r5, [r0]
	add	r3, r3, #0xe
	add	r0, r6, r3
	str	r5, [r0]
	mov	r1, #0xf9
	lsl	r1, r1, #0x2
	add	r0, r6, r1
	str	r5, [r0]
	add	r2, r2, #0x8
	add	r0, r6, r2
	str	r5, [r0]
	ldr	r3, [sp, #0x3c]
	cmp	r3, #0
	beq	.L2	@cond_branch
	mov	r0, #0x1
	bl	allocSprite
	add	r2, r0, #0
	mov	r1, #0xf1
	lsl	r1, r1, #0x2
	add	r0, r6, r1
	str	r2, [r0]
	cmp	r2, #0
	beq	.L4	@cond_branch
	ldr	r1, .L5 + 40
	str	r5, [sp]
	str	r5, [sp, #0x4]
	str	r5, [sp, #0x8]
	str	r5, [sp, #0xc]
	add	r0, r2, #0
	mov	r2, #0x0
	mov	r3, #0x0
	bl	LoadSpriteSheet
	b	.L4
.L6:
	.align	2, 0
.L5:
	.4byte	0x807d970
	.4byte	0x3cf
	.4byte	0x3000fc0
	.4byte	0x3000fd0
	.4byte	convert3DCoordsto2DCoords + 1
	.4byte	0x86faeac
	.4byte	0xffff8300
	.4byte	0x335
	.4byte	0x6010000
	.4byte	0x3ca
	.4byte	0x86faf34
.L2:
	mov	r2, #0xf1
	lsl	r2, r2, #0x2
	add	r0, r6, r2
	ldr	r3, [sp, #0x3c]
	str	r3, [r0]
.L4:
	mov	r1, #0x0
	ldr	r0, [sp, #0x3c]
	cmp	r0, #0
	bne	.L7	@cond_branch
	mov	r1, #0x1
.L7:
	mov	r2, #0xfa
	lsl	r2, r2, #0x2
	add	r0, r6, r2
	strb	r1, [r0]
	cmp	r1, #0
	beq	.L8	@cond_branch
	mov	r3, #0xfb
	lsl	r3, r3, #0x2
	add	r4, r6, r3
	ldr	r2, .L9
	mov	r0, #0x1
	str	r0, [sp]
	add	r0, r4, #0
	mov	r1, #0x8
	mov	r3, sl
	bl	allocateParticleSystem
	add	r0, r4, #0
	ldr	r1, [sp, #0x10]
	ldr	r2, [sp, #0x14]
	ldr	r3, [sp, #0x38]
	bl	sub_804E584
.L8:
	mov	r0, #0xf4
	lsl	r0, r0, #0x2
	add	r1, r6, r0
	mov	r0, #0x0
	strb	r0, [r1]
	ldr	r2, .L9 + 4
	add	r1, r6, r2
	ldr	r0, .L9 + 8
	strh	r0, [r1]
	add	sp, sp, #0x18
	pop	{r3, r4, r5}
	mov	r8, r3
	mov	r9, r4
	mov	sl, r5
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L10:
	.align	2, 0
.L9:
	.4byte	0x86fb40c
	.4byte	0x424
	.4byte	0xffff
	thumb_func_end initRider

.align 2, 0 @ Don't pad with nop.
