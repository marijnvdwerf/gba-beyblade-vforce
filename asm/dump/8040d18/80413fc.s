	.include "asm/common.inc"

	thumb_func_start sub_80413FC
sub_80413FC:
	push	{r4, r5, r6, r7, lr}
	mov	r7, sl
	mov	r6, r9
	mov	r5, r8
	push	{r5, r6, r7}
	add	sp, sp, #0xfffffff0
	mov	sl, r0
	add	r4, r1, #0
	bl	isMultiplayer
	ldr	r2, .L9
	lsl	r0, r0, #0x10
	lsr	r0, r0, #0x10
	mov	r1, #0x1
	sub	r1, r1, r0
	lsl	r1, r1, #0x4
	ldr	r0, .L9 + 4
	add	r1, r1, r0
	ldr	r0, [r2]
	add	r1, r1, r0
	mov	r9, r1
	ldr	r1, .L9 + 8
	add	r1, r1, r0
	mov	r8, r1
	cmp	r4, #0x1
	bne	.L1	@cond_branch
	b	.L2
.L1:
	cmp	r4, #0x1
	bcc	.L3	@cond_branch
	cmp	r4, #0x2
	bne	.L4	@cond_branch
	b	.L5
.L4:
	cmp	r4, #0x7
	bne	.L6	@cond_branch
	b	.L7
.L6:
	bl	.L115
.L10:
	.align	2, 0
.L9:
	.4byte	0x3000fb0
	.4byte	0x15d4
	.4byte	0x15c4
.L3:
	mov	r0, #0x1
	bl	sub_8051780
	cmp	r0, #0
	beq	.L11	@cond_branch
	ldr	r1, .L13
	ldr	r0, .L13 + 4
	ldr	r0, [r0]
	ldr	r2, .L13 + 8
	add	r0, r0, r2
	b	.L21
.L14:
	.align	2, 0
.L13:
	.4byte	0x3000074
	.4byte	0x3000f48
	.4byte	0x5a4
.L11:
	mov	r0, #0x80
	lsl	r0, r0, #0x1
	bl	sub_8051780
	cmp	r0, #0
	beq	.L15	@cond_branch
	ldr	r1, .L17
	ldr	r0, .L17 + 4
	ldr	r0, [r0]
	ldr	r3, .L17 + 8
	add	r0, r0, r3
	b	.L21
.L18:
	.align	2, 0
.L17:
	.4byte	0x3000074
	.4byte	0x3000f48
	.4byte	0x5e4
.L15:
	mov	r0, #0x4
	bl	sub_8051780
	cmp	r0, #0
	beq	.L19	@cond_branch
	ldr	r0, .L22
	ldr	r2, [r0]
	ldr	r4, .L22 + 4
	add	r0, r2, r4
	ldrb	r0, [r0]
	cmp	r0, #0x1
	bne	.L20	@cond_branch
	ldr	r1, .L22 + 8
	ldr	r3, .L22 + 12
	add	r0, r2, r3
	b	.L21
.L23:
	.align	2, 0
.L22:
	.4byte	0x3000f48
	.4byte	0x6a4
	.4byte	0x3000074
	.4byte	0x624
.L20:
	ldr	r1, .L30
	ldr	r4, .L30 + 4
	add	r0, r2, r4
.L21:
	str	r0, [r1]
.L19:
	ldr	r0, .L30
	ldr	r2, [r0]
	ldr	r1, .L30 + 8
	mov	r0, #0x0
	strb	r0, [r1]
	mov	r0, #0x0
	ldsb	r0, [r2, r0]
	mov	r3, #0x1
	NEG	r3, r3
	add	r2, r2, #0x1
	add	r4, r1, #0
	mov	r1, #0x80
	ADD r1, sl
	mov	r9, r1
	cmp	r0, r3
	beq	.L24	@cond_branch
	add	r1, r4, #0
.L25:
	ldrb	r0, [r1]
	add	r0, r0, #0x1
	strb	r0, [r1]
	mov	r0, #0x0
	ldsb	r0, [r2, r0]
	add	r2, r2, #0x1
	cmp	r0, r3
	bne	.L25	@cond_branch
.L24:
	mov	r0, #0x0
	bl	allocSprite
	add	r4, r0, #0
	ldr	r0, .L30 + 12
	str	r4, [r0]
	cmp	r4, #0
	beq	.L26	@cond_branch
	ldr	r1, .L30 + 16
	ldr	r2, .L30 + 20
	mov	r3, #0xa8
	lsl	r3, r3, #0x7
	mov	r0, #0x0
	str	r0, [sp]
	str	r0, [sp, #0x4]
	str	r0, [sp, #0x8]
	str	r0, [sp, #0xc]
	add	r0, r4, #0
	bl	LoadSpriteSheet
.L26:
	mov	r0, #0x0
	bl	allocSprite
	add	r5, r0, #0
	ldr	r0, .L30 + 24
	str	r5, [r0]
	cmp	r5, #0
	beq	.L27	@cond_branch
	ldr	r1, .L30 + 16
	mov	r2, #0xc0
	lsl	r2, r2, #0x9
	mov	r3, #0xa8
	lsl	r3, r3, #0x7
	mov	r4, #0x0
	str	r4, [sp]
	str	r4, [sp, #0x4]
	mov	r0, #0x1
	str	r0, [sp, #0x8]
	str	r4, [sp, #0xc]
	add	r0, r5, #0
	bl	LoadSpriteSheet
.L27:
	ldr	r1, .L30 + 28
	mov	r0, #0x80
	lsl	r0, r0, #0x4
	str	r0, [r1]
	ldr	r1, .L30 + 32
	mov	r0, #0xd8
	lsl	r0, r0, #0x8
	str	r0, [r1]
	mov	r0, #0x4
	bl	sub_8051780
	cmp	r0, #0
	beq	.L28	@cond_branch
	ldr	r0, .L30 + 36
	ldr	r0, [r0]
	ldr	r2, .L30 + 40
	add	r0, r0, r2
	ldrb	r3, [r0]
	b	.L29
.L31:
	.align	2, 0
.L30:
	.4byte	0x3000074
	.4byte	0x664
	.4byte	0x3000078
	.4byte	0x300005c
	.4byte	0x823bf04
	.4byte	0xffff0000
	.4byte	0x3000060
	.4byte	0x3000064
	.4byte	0x3000068
	.4byte	0x3000f48
	.4byte	0x6a9
.L28:
	bl	sub_805137C
	add	r3, r0, #0
.L29:
	mov	r2, #0x0
	ldr	r0, .L39
	add	r4, r0, #0
	ldr	r6, .L39 + 4
	ldr	r7, .L39 + 8
	ldrb	r0, [r4]
	cmp	r2, r0
	bge	.L34	@cond_branch
	ldr	r0, .L39 + 12
	ldr	r1, [r0]
	ldrb	r1, [r1]
	lsl	r1, r1, #0x18
	asr	r1, r1, #0x18
	add	r5, r0, #0
	cmp	r1, r3
	beq	.L33	@cond_branch
.L35:
	add	r2, r2, #0x1
	ldrb	r1, [r4]
	cmp	r2, r1
	bge	.L34	@cond_branch
	ldr	r0, [r5]
	add	r0, r0, r2
	ldrb	r0, [r0]
	lsl	r0, r0, #0x18
	asr	r0, r0, #0x18
	cmp	r0, r3
	bne	.L35	@cond_branch
.L33:
	ldr	r0, .L39 + 16
	strb	r2, [r0, #0x1d]
.L34:
	mov	r1, #0x80
	lsl	r1, r1, #0x9
	str	r1, [r6]
	mov	r5, #0x0
	str	r5, [r7]
	mov	r0, #0x94
	lsl	r0, r0, #0x2
	ADD r0, sl
	NEG	r1, r1
	mov	r2, #0x90
	lsl	r2, r2, #0x6
	bl	sub_80596AC
	mov	r0, #0x0
	bl	sub_804A0E0
	ldr	r4, .L39 + 16
	str	r0, [r4, #0x4]
	mov	r0, #0x1
	bl	sub_804A0E0
	str	r0, [r4, #0x8]
	mov	r0, #0x2
	bl	sub_804A0E0
	str	r0, [r4, #0xc]
	mov	r0, #0x3
	bl	sub_804A0E0
	str	r0, [r4, #0x10]
	mov	r0, #0x4
	bl	sub_804A0E0
	str	r0, [r4, #0x14]
	mov	r0, #0x5
	bl	sub_804A0E0
	str	r0, [r4, #0x18]
	strb	r5, [r4, #0x1e]
	ldr	r0, [r4, #0x4]
	mov	r1, #0x1
	bl	sub_8062318
	ldr	r0, [r4, #0x8]
	mov	r1, #0x1
	bl	sub_8062318
	ldr	r0, [r4, #0xc]
	mov	r1, #0x1
	bl	sub_8062318
	ldr	r0, [r4, #0x10]
	mov	r1, #0x1
	bl	sub_8062318
	ldr	r0, [r4, #0x14]
	mov	r1, #0x1
	bl	sub_8062318
	ldr	r0, [r4, #0x18]
	mov	r1, #0x1
	bl	sub_8062318
	str	r5, [r4]
	ldr	r0, .L39 + 20
	strb	r5, [r0]
	ldr	r0, .L39 + 24
	strb	r5, [r0]
	ldr	r0, .L39 + 28
	strb	r5, [r0]
	mov	r0, #0x30
	mov	r2, r9
	ldrb	r2, [r2]
	orr	r0, r0, r2
	mov	r3, r9
	strb	r0, [r3]
	bl	sub_8049168
	bl	sub_805FFE4
	lsl	r0, r0, #0x18
	cmp	r0, #0
	beq	.L37	@cond_branch
	bl	sub_8060070
	lsl	r0, r0, #0x18
	cmp	r0, #0
	beq	.L37	@cond_branch
	mov	r0, #0x10
	NEG	r0, r0
	mov	r4, r8
	ldrb	r4, [r4, #0x2]
	and	r0, r0, r4
	mov	r1, #0x4
	orr	r0, r0, r1
	mov	r1, #0xf
	and	r0, r0, r1
	mov	r1, r8
	strb	r0, [r1, #0x2]
	ldr	r0, .L39 + 32
	add	r1, r1, #0x4
	ldr	r3, [r0]
	mov	r0, #0x0
	mov	r2, #0xc
	bl	_call_via_r3
	mov	r0, r8
	bl	sub_8043960
.L37:
	ldr	r1, .L39 + 36
	mov	r0, #0x0
	str	r0, [r1]
	ldr	r1, .L39 + 40
	mov	r0, #0x10
	bl	.L38
.L40:
	.align	2, 0
.L39:
	.4byte	0x3000078
	.4byte	0x3000030
	.4byte	0x300002c
	.4byte	0x3000074
	.4byte	0x3000038
	.4byte	0x3000058
	.4byte	0x3000059
	.4byte	0x300005a
	.4byte	0x807d970
	.4byte	0x300006c
	.4byte	0x3000070
.L7:
	ldr	r0, .L46
	ldr	r0, [r0]
	cmp	r0, #0
	beq	.L41	@cond_branch
	bl	sub_8060A94
.L41:
	ldr	r0, .L46 + 4
	ldr	r0, [r0]
	cmp	r0, #0
	beq	.L42	@cond_branch
	bl	sub_8060A94
.L42:
	ldr	r0, .L46 + 8
	ldr	r0, [r0]
	cmp	r0, #0
	bne	.L43	@cond_branch
	b	.L115
.L43:
	bl	sub_8060A94
	b	.L115
.L47:
	.align	2, 0
.L46:
	.4byte	0x300005c
	.4byte	0x3000060
	.4byte	0x3000038
.L2:
	ldr	r0, .L64
	ADD r0, sl
	ldrh	r0, [r0]
	cmp	r0, #0
	beq	.L48	@cond_branch
	b	.L55
.L48:
	ldr	r1, .L64 + 4
	mov	r2, #0xf4
	lsl	r2, r2, #0x4
	add	r0, r2, #0
	strh	r0, [r1]
	add	r1, r1, #0x2
	ldr	r3, .L64 + 8
	ldr	r2, [r3]
	mov	r0, #0x10
	sub	r0, r0, r2
	lsl	r0, r0, #0x8
	orr	r0, r0, r2
	strh	r0, [r1]
	ldr	r0, .L64 + 12
	ldr	r0, [r0]
	cmp	r2, r0
	beq	.L50	@cond_branch
	sub	r1, r2, #1
	cmp	r0, r2
	ble	.L51	@cond_branch
	add	r1, r2, #1
.L51:
	str	r1, [r3]
.L50:
	ldr	r7, .L64 + 16
	ldrb	r0, [r7]
	cmp	r0, #0
	bne	.L52	@cond_branch
	ldr	r4, .L64 + 20
	add	r0, r4, #0
	bl	sub_8041078
	mov	r0, #0x1
	bl	sub_8041324
	mov	r1, #0x1d
	ldsb	r1, [r4, r1]
	ldr	r5, .L64 + 24
	ldr	r0, [r5]
	add	r0, r0, r1
	ldrb	r0, [r0]
	lsl	r0, r0, #0x18
	asr	r0, r0, #0x18
	bl	getLevelDescription
	add	r6, r0, #0
	mov	r1, #0x1d
	ldsb	r1, [r4, r1]
	ldr	r0, [r5]
	add	r0, r0, r1
	ldrb	r0, [r0]
	lsl	r0, r0, #0x18
	asr	r0, r0, #0x18
	bl	sub_8051720
	add	r2, r0, #0
	add	r0, r4, #0
	add	r1, r6, #0
	bl	displayFrontendLevel
	mov	r1, #0x1d
	ldsb	r1, [r4, r1]
	ldr	r0, [r5]
	add	r0, r0, r1
	ldrb	r0, [r0]
	lsl	r0, r0, #0x18
	asr	r0, r0, #0x18
	bl	getLevelDescription
	add	r6, r0, #0
	mov	r1, #0x1d
	ldsb	r1, [r4, r1]
	ldr	r0, [r5]
	add	r0, r0, r1
	ldrb	r0, [r0]
	lsl	r0, r0, #0x18
	asr	r0, r0, #0x18
	bl	sub_8051720
	add	r2, r0, #0
	mov	r1, #0x1d
	ldsb	r1, [r4, r1]
	ldr	r0, [r5]
	add	r0, r0, r1
	mov	r3, #0x0
	ldsb	r3, [r0, r3]
	add	r0, r4, #0
	add	r1, r6, #0
	bl	sub_8041288
	mov	r1, #0x1d
	ldsb	r1, [r4, r1]
	ldr	r0, [r5]
	add	r0, r0, r1
	ldrb	r0, [r0]
	lsl	r0, r0, #0x18
	asr	r0, r0, #0x18
	bl	getLevelDescription
	add	r6, r0, #0
	mov	r1, #0x1d
	ldsb	r1, [r4, r1]
	ldr	r0, [r5]
	add	r0, r0, r1
	ldrb	r0, [r0]
	lsl	r0, r0, #0x18
	asr	r0, r0, #0x18
	bl	sub_8051720
	add	r2, r0, #0
	mov	r1, #0x1d
	ldsb	r1, [r4, r1]
	ldr	r0, [r5]
	add	r0, r0, r1
	mov	r3, #0x0
	ldsb	r3, [r0, r3]
	add	r0, r4, #0
	add	r1, r6, #0
	bl	sub_8041188
	mov	r0, #0x1
	strb	r0, [r7]
.L52:
	ldr	r4, .L64 + 8
	ldr	r0, [r4]
	cmp	r0, #0x10
	bne	.L53	@cond_branch
	ldr	r0, .L64 + 20
	mov	r1, #0x0
	bl	sub_8041344
.L53:
	ldr	r0, [r4]
	cmp	r0, #0
	bne	.L55	@cond_branch
	ldr	r0, .L64 + 28
	ldrb	r0, [r0]
	cmp	r0, #0
	bne	.L55	@cond_branch
	ldr	r1, .L64 + 32
	mov	r0, #0x1
	strb	r0, [r1]
	ldr	r1, .L64 + 12
	mov	r0, #0x10
	str	r0, [r1]
.L55:
	ldr	r0, .L64 + 16
	ldrb	r0, [r0]
	cmp	r0, #0
	beq	.L57	@cond_branch
	ldr	r7, .L64 + 32
	ldrb	r0, [r7]
	cmp	r0, #0
	beq	.L57	@cond_branch
	ldr	r4, .L64 + 20
	mov	r1, #0x1d
	ldsb	r1, [r4, r1]
	ldr	r5, .L64 + 24
	ldr	r0, [r5]
	add	r0, r0, r1
	ldrb	r0, [r0]
	lsl	r0, r0, #0x18
	asr	r0, r0, #0x18
	bl	getLevelDescription
	add	r6, r0, #0
	mov	r1, #0x1d
	ldsb	r1, [r4, r1]
	ldr	r0, [r5]
	add	r0, r0, r1
	ldrb	r0, [r0]
	lsl	r0, r0, #0x18
	asr	r0, r0, #0x18
	bl	sub_8051720
	add	r2, r0, #0
	add	r0, r4, #0
	add	r1, r6, #0
	bl	displayFrontendLevel
	mov	r1, #0x1d
	ldsb	r1, [r4, r1]
	ldr	r0, [r5]
	add	r0, r0, r1
	ldrb	r0, [r0]
	lsl	r0, r0, #0x18
	asr	r0, r0, #0x18
	bl	getLevelDescription
	add	r6, r0, #0
	mov	r1, #0x1d
	ldsb	r1, [r4, r1]
	ldr	r0, [r5]
	add	r0, r0, r1
	ldrb	r0, [r0]
	lsl	r0, r0, #0x18
	asr	r0, r0, #0x18
	bl	sub_8051720
	add	r2, r0, #0
	mov	r1, #0x1d
	ldsb	r1, [r4, r1]
	ldr	r0, [r5]
	add	r0, r0, r1
	mov	r3, #0x0
	ldsb	r3, [r0, r3]
	add	r0, r4, #0
	add	r1, r6, #0
	bl	sub_8041188
	mov	r0, #0x0
	strb	r0, [r7]
.L57:
	mov	r0, #0xa0
	lsl	r0, r0, #0x1
	ADD r0, sl
	bl	sub_80439A0
	bl	sub_805FFE4
	lsl	r0, r0, #0x18
	cmp	r0, #0
	beq	.L59	@cond_branch
	bl	sub_8060070
	lsl	r0, r0, #0x18
	cmp	r0, #0
	beq	.L59	@cond_branch
	bl	sub_8060040
	lsl	r0, r0, #0x18
	cmp	r0, #0
	beq	.L60	@cond_branch
	ldr	r0, .L64 + 20
	ldrb	r0, [r0, #0x1d]
	mov	r3, r8
	strb	r0, [r3, #0x4]
.L60:
	bl	sub_8051820
	mov	r4, r8
	strb	r0, [r4, #0x5]
	mov	r0, r8
	bl	sub_8043960
.L59:
	ldr	r5, .L64 + 36
	ldr	r0, [r5]
	cmp	r0, #0
	beq	.L61	@cond_branch
	bl	sub_8057C40
	ldr	r5, [r5]
	ldr	r1, .L64 + 40
	ldr	r2, [r1]
	ldr	r3, [r5, #0x8]
	sub	r2, r2, r3
	asr	r2, r2, #0x2
	ldr	r4, .L64 + 44
	mov	r1, #0xff
	lsl	r1, r1, #0x1
	and	r1, r1, r0
	add	r1, r1, r4
	mov	r4, #0x0
	ldsh	r0, [r1, r4]
	add	r2, r2, r0
	ldr	r0, .L64 + 48
	ldr	r0, [r0]
	sub	r2, r2, r0
	add	r3, r3, r2
	str	r3, [r5, #0x8]
.L61:
	ldr	r5, .L64 + 52
	ldr	r0, [r5]
	cmp	r0, #0
	beq	.L62	@cond_branch
	bl	sub_8057C40
	ldr	r5, [r5]
	ldr	r1, .L64 + 56
	ldr	r2, [r1]
	ldr	r3, [r5, #0x8]
	sub	r2, r2, r3
	asr	r2, r2, #0x2
	ldr	r4, .L64 + 44
	mov	r1, #0xff
	lsl	r1, r1, #0x1
	and	r1, r1, r0
	add	r1, r1, r4
	mov	r4, #0x0
	ldsh	r0, [r1, r4]
	sub	r2, r2, r0
	ldr	r0, .L64 + 48
	ldr	r0, [r0]
	add	r2, r2, r0
	add	r3, r3, r2
	str	r3, [r5, #0x8]
.L62:
	ldr	r0, .L64 + 48
	ldr	r5, .L64 + 60
	ldr	r4, [r0]
	ldr	r0, [r5]
	sub	r4, r4, r0
	asr	r4, r4, #0x2
	mov	r0, #0x94
	lsl	r0, r0, #0x2
	ADD r0, sl
	NEG	r1, r4
	mov	r2, #0x0
	bl	sub_80596AC
	ldr	r0, [r5]
	add	r0, r0, r4
	str	r0, [r5]
	b	.L115
.L65:
	.align	2, 0
.L64:
	.4byte	0x584
	.4byte	0x4000050
	.4byte	0x300006c
	.4byte	0x3000070
	.4byte	0x3000059
	.4byte	0x3000038
	.4byte	0x3000074
	.4byte	0x300005a
	.4byte	0x3000058
	.4byte	0x300005c
	.4byte	0x3000064
	.4byte	0x874cc3c
	.4byte	0x300002c
	.4byte	0x3000060
	.4byte	0x3000068
	.4byte	0x3000030
.L5:
	ldr	r5, .L83
	mov	r0, #0x30
	ldrh	r1, [r5]
	and	r0, r0, r1
	cmp	r0, #0
	bne	.L66	@cond_branch
	b	.L88
.L66:
	ldr	r0, .L83 + 4
	ldrb	r0, [r0]
	cmp	r0, #0
	beq	.L68	@cond_branch
	b	.L88
.L68:
	bl	sub_8060070
	lsl	r0, r0, #0x18
	cmp	r0, #0
	beq	.L75	@cond_branch
	bl	sub_805FFE4
	lsl	r0, r0, #0x18
	cmp	r0, #0
	bne	.L71	@cond_branch
	b	.L88
.L71:
	bl	sub_8060070
	lsl	r0, r0, #0x18
	cmp	r0, #0
	bne	.L73	@cond_branch
	b	.L88
.L73:
	bl	sub_8060040
	lsl	r0, r0, #0x18
	cmp	r0, #0
	bne	.L75	@cond_branch
	b	.L88
.L75:
	mov	r4, #0x20
	add	r0, r4, #0
	ldrh	r5, [r5]
	and	r0, r0, r5
	cmp	r0, #0
	beq	.L80	@cond_branch
	mov	r0, #0x5
	bl	sub_805A914
	add	r2, r0, #0
	ldr	r1, .L83 + 8
	add	r0, r4, #0
	ldrh	r1, [r1]
	and	r0, r0, r1
	cmp	r0, #0
	bne	.L78	@cond_branch
	ldr	r0, [r2, #0x8]
	cmp	r0, #0xf0
	bls	.L80	@cond_branch
	bl	sub_8057C40
	asr	r0, r0, #0x4
	mov	r1, #0x7
	and	r0, r0, r1
	cmp	r0, #0
	bne	.L80	@cond_branch
.L78:
	ldr	r0, .L83 + 12
	ldrb	r2, [r0, #0x1d]
	mov	r1, #0x1d
	ldsb	r1, [r0, r1]
	add	r6, r0, #0
	cmp	r1, #0
	ble	.L81	@cond_branch
	sub	r0, r2, #1
	b	.L82
.L84:
	.align	2, 0
.L83:
	.4byte	0x3005ca0
	.4byte	0x300005a
	.4byte	0x3005da0
	.4byte	0x3000038
.L81:
	ldr	r0, .L91
	ldrb	r0, [r0]
	sub	r0, r0, #0x1
.L82:
	strb	r0, [r6, #0x1d]
	add	r0, r6, #0
	mov	r1, #0x0
	bl	sub_8041344
	mov	r1, #0x1d
	ldsb	r1, [r6, r1]
	ldr	r4, .L91 + 4
	ldr	r0, [r4]
	add	r0, r0, r1
	ldrb	r0, [r0]
	lsl	r0, r0, #0x18
	asr	r0, r0, #0x18
	bl	getLevelDescription
	add	r5, r0, #0
	mov	r1, #0x1d
	ldsb	r1, [r6, r1]
	ldr	r0, [r4]
	add	r0, r0, r1
	ldrb	r0, [r0]
	lsl	r0, r0, #0x18
	asr	r0, r0, #0x18
	bl	sub_8051720
	add	r2, r0, #0
	mov	r1, #0x1d
	ldsb	r1, [r6, r1]
	ldr	r0, [r4]
	add	r0, r0, r1
	mov	r3, #0x0
	ldsb	r3, [r0, r3]
	add	r0, r6, #0
	add	r1, r5, #0
	bl	sub_8041288
	ldr	r1, .L91 + 8
	mov	r0, #0x0
	str	r0, [r1]
	mov	r0, #0x7
	bl	sub_804ABFC
.L80:
	ldr	r1, .L91 + 12
	mov	r4, #0x10
	add	r0, r4, #0
	ldrh	r1, [r1]
	and	r0, r0, r1
	cmp	r0, #0
	beq	.L88	@cond_branch
	mov	r0, #0x4
	bl	sub_805A914
	add	r2, r0, #0
	ldr	r1, .L91 + 16
	add	r0, r4, #0
	ldrh	r1, [r1]
	and	r0, r0, r1
	cmp	r0, #0
	bne	.L86	@cond_branch
	ldr	r0, [r2, #0x8]
	cmp	r0, #0xf0
	bls	.L88	@cond_branch
	bl	sub_8057C40
	asr	r0, r0, #0x4
	mov	r1, #0x7
	and	r0, r0, r1
	cmp	r0, #0
	bne	.L88	@cond_branch
.L86:
	ldr	r1, .L91 + 20
	mov	r2, #0x1d
	ldsb	r2, [r1, r2]
	ldr	r0, .L91
	ldrb	r0, [r0]
	sub	r0, r0, #0x1
	add	r6, r1, #0
	cmp	r2, r0
	bge	.L89	@cond_branch
	ldrb	r0, [r6, #0x1d]
	add	r0, r0, #0x1
	b	.L90
.L92:
	.align	2, 0
.L91:
	.4byte	0x3000078
	.4byte	0x3000074
	.4byte	0x3000070
	.4byte	0x3005ca0
	.4byte	0x3005da0
	.4byte	0x3000038
.L89:
	mov	r0, #0x0
.L90:
	strb	r0, [r6, #0x1d]
	add	r0, r6, #0
	mov	r1, #0x0
	bl	sub_8041344
	mov	r1, #0x1d
	ldsb	r1, [r6, r1]
	ldr	r4, .L108
	ldr	r0, [r4]
	add	r0, r0, r1
	ldrb	r0, [r0]
	lsl	r0, r0, #0x18
	asr	r0, r0, #0x18
	bl	getLevelDescription
	add	r5, r0, #0
	mov	r1, #0x1d
	ldsb	r1, [r6, r1]
	ldr	r0, [r4]
	add	r0, r0, r1
	ldrb	r0, [r0]
	lsl	r0, r0, #0x18
	asr	r0, r0, #0x18
	bl	sub_8051720
	add	r2, r0, #0
	mov	r1, #0x1d
	ldsb	r1, [r6, r1]
	ldr	r0, [r4]
	add	r0, r0, r1
	mov	r3, #0x0
	ldsb	r3, [r0, r3]
	add	r0, r6, #0
	add	r1, r5, #0
	bl	sub_8041288
	ldr	r1, .L108 + 4
	mov	r0, #0x0
	str	r0, [r1]
	mov	r0, #0x7
	bl	sub_804ABFC
.L88:
	bl	sub_805FFE4
	lsl	r0, r0, #0x18
	cmp	r0, #0
	bne	.L93	@cond_branch
	b	.L96
.L93:
	bl	sub_8060070
	lsl	r0, r0, #0x18
	cmp	r0, #0
	bne	.L95	@cond_branch
	b	.L96
.L95:
	bl	sub_8060040
	lsl	r0, r0, #0x18
	cmp	r0, #0
	beq	.L100	@cond_branch
	ldr	r2, .L108 + 8
	mov	r0, #0x1
	ldrh	r3, [r2]
	and	r0, r0, r3
	cmp	r0, #0
	beq	.L98	@cond_branch
	mov	r0, #0xf
	mov	r4, r8
	ldrb	r4, [r4, #0x2]
	and	r0, r0, r4
	mov	r1, #0x10
	orr	r0, r0, r1
	mov	r1, r8
	strb	r0, [r1, #0x2]
.L98:
	mov	r0, #0x2
	ldrh	r2, [r2]
	and	r0, r0, r2
	cmp	r0, #0
	beq	.L100	@cond_branch
	ldr	r0, .L108 + 12
	ldr	r0, [r0]
	ldr	r2, .L108 + 16
	add	r0, r0, r2
	ldrb	r0, [r0]
	cmp	r0, #0
	bne	.L100	@cond_branch
	mov	r0, #0xf
	mov	r3, r8
	ldrb	r3, [r3, #0x2]
	and	r0, r0, r3
	mov	r1, #0x20
	orr	r0, r0, r1
	mov	r4, r8
	strb	r0, [r4, #0x2]
.L100:
	mov	r0, r9
	mov	r1, #0x4
	bl	sub_8043970
	lsl	r0, r0, #0x18
	cmp	r0, #0
	bne	.L101	@cond_branch
	b	.L112
.L101:
	ldr	r0, .L108 + 20
	ldr	r0, [r0]
	mov	r2, r9
	mov	r1, #0x5
	ldsb	r1, [r2, r1]
	mov	r3, #0xae
	lsl	r3, r3, #0x5
	add	r0, r0, r3
	strh	r1, [r0]
	bl	sub_8060040
	lsl	r0, r0, #0x18
	lsr	r7, r0, #0x18
	cmp	r7, #0
	bne	.L104	@cond_branch
	ldr	r6, .L108 + 24
	mov	r4, r9
	ldrb	r0, [r4, #0x4]
	add	r1, r0, #0
	ldrb	r2, [r6, #0x1d]
	cmp	r1, r2
	beq	.L104	@cond_branch
	strb	r0, [r6, #0x1d]
	mov	r1, #0x1d
	ldsb	r1, [r6, r1]
	ldr	r4, .L108
	ldr	r0, [r4]
	add	r0, r0, r1
	ldrb	r0, [r0]
	lsl	r0, r0, #0x18
	asr	r0, r0, #0x18
	bl	getLevelDescription
	add	r5, r0, #0
	mov	r1, #0x1d
	ldsb	r1, [r6, r1]
	ldr	r0, [r4]
	add	r0, r0, r1
	ldrb	r0, [r0]
	lsl	r0, r0, #0x18
	asr	r0, r0, #0x18
	bl	sub_8051720
	add	r2, r0, #0
	mov	r1, #0x1d
	ldsb	r1, [r6, r1]
	ldr	r0, [r4]
	add	r0, r0, r1
	mov	r3, #0x0
	ldsb	r3, [r0, r3]
	add	r0, r6, #0
	add	r1, r5, #0
	bl	sub_8041288
	ldr	r0, .L108 + 4
	str	r7, [r0]
.L104:
	mov	r6, #0xf0
	add	r0, r6, #0
	mov	r3, r9
	ldrb	r3, [r3, #0x2]
	and	r0, r0, r3
	cmp	r0, #0x10
	bne	.L105	@cond_branch
	ldr	r1, .L108 + 28
	mov	r0, #0x1
	strb	r0, [r1]
	ldr	r1, .L108 + 4
	mov	r0, #0x0
	str	r0, [r1]
	mov	r0, #0xf
	mov	r4, r8
	ldrb	r4, [r4, #0x2]
	and	r0, r0, r4
	mov	r1, #0x10
	orr	r0, r0, r1
	mov	r1, r8
	strb	r0, [r1, #0x2]
	ldr	r5, .L108 + 24
	mov	r1, #0x1d
	ldsb	r1, [r5, r1]
	ldr	r4, .L108
	ldr	r0, [r4]
	add	r0, r0, r1
	ldrb	r0, [r0]
	lsl	r0, r0, #0x18
	asr	r0, r0, #0x18
	bl	sub_8051688
	ldr	r0, .L108 + 12
	ldr	r1, [r0]
	mov	r2, #0x1d
	ldsb	r2, [r5, r2]
	ldr	r0, [r4]
	add	r0, r0, r2
	ldrb	r0, [r0]
	ldr	r2, .L108 + 32
	add	r1, r1, r2
	strb	r0, [r1]
.L105:
	add	r0, r6, #0
	mov	r3, r9
	ldrb	r3, [r3, #0x2]
	and	r0, r0, r3
	cmp	r0, #0x20
	bne	.L112	@cond_branch
	mov	r0, #0xf
	mov	r4, r8
	ldrb	r4, [r4, #0x2]
	and	r0, r0, r4
	mov	r1, #0x20
	orr	r0, r0, r1
	mov	r1, r8
	strb	r0, [r1, #0x2]
	ldr	r1, .L108 + 28
	mov	r0, #0x2
	strb	r0, [r1]
	ldr	r1, .L108 + 4
	mov	r0, #0x0
	str	r0, [r1]
	b	.L112
.L109:
	.align	2, 0
.L108:
	.4byte	0x3000074
	.4byte	0x3000070
	.4byte	0x3005da0
	.4byte	0x3000f48
	.4byte	0x6a6
	.4byte	0x3000fb0
	.4byte	0x3000038
	.4byte	0x300005a
	.4byte	0x6a9
.L96:
	ldr	r4, .L120
	mov	r0, #0x2
	ldrh	r2, [r4]
	and	r0, r0, r2
	cmp	r0, #0
	beq	.L110	@cond_branch
	ldr	r1, .L120 + 4
	mov	r0, #0x2
	strb	r0, [r1]
	ldr	r1, .L120 + 8
	mov	r0, #0x0
	str	r0, [r1]
	ldr	r0, .L120 + 12
	mov	r1, #0x1
	bl	sub_8041344
.L110:
	mov	r0, #0x1
	ldrh	r4, [r4]
	and	r0, r0, r4
	cmp	r0, #0
	beq	.L112	@cond_branch
	ldr	r4, .L120 + 12
	mov	r1, #0x1d
	ldsb	r1, [r4, r1]
	ldr	r0, .L120 + 16
	ldr	r0, [r0]
	add	r0, r0, r1
	ldrb	r0, [r0]
	lsl	r0, r0, #0x18
	asr	r0, r0, #0x18
	bl	sub_80517E8
	lsl	r0, r0, #0x18
	cmp	r0, #0
	beq	.L112	@cond_branch
	ldr	r1, .L120 + 4
	mov	r0, #0x1
	strb	r0, [r1]
	ldr	r1, .L120 + 8
	mov	r0, #0x0
	str	r0, [r1]
	add	r0, r4, #0
	mov	r1, #0x1
	bl	sub_8041344
.L112:
	ldr	r4, .L120 + 4
	ldrb	r0, [r4]
	cmp	r0, #0
	bne	.L113	@cond_branch
	b	.L115
.L113:
	ldr	r0, .L120 + 20
	ldr	r1, .L120 + 8
	ldr	r2, [r0]
	ldr	r0, [r1]
	cmp	r2, r0
	bne	.L115	@cond_branch
	bl	sub_805FFE4
	lsl	r0, r0, #0x18
	cmp	r0, #0
	beq	.L117	@cond_branch
	bl	sub_8060070
	lsl	r0, r0, #0x18
	cmp	r0, #0
	beq	.L117	@cond_branch
	ldrb	r4, [r4]
	cmp	r4, #0x1
	bne	.L118	@cond_branch
	mov	r0, #0x13
	bl	sub_804924C
	mov	r0, #0x8
	bl	sub_8049234
	b	.L125
.L121:
	.align	2, 0
.L120:
	.4byte	0x3005da0
	.4byte	0x300005a
	.4byte	0x3000070
	.4byte	0x3000038
	.4byte	0x3000074
	.4byte	0x300006c
.L118:
	mov	r0, #0x21
	bl	sub_80490F8
	mov	r0, #0x9
	bl	sub_804ABFC
	b	.L129
.L117:
	ldr	r0, .L127
	ldrb	r5, [r0]
	cmp	r5, #0x1
	bne	.L123	@cond_branch
	ldr	r0, .L127 + 4
	mov	r1, #0x1d
	ldsb	r1, [r0, r1]
	ldr	r0, .L127 + 8
	ldr	r0, [r0]
	add	r0, r0, r1
	ldrb	r0, [r0]
	lsl	r0, r0, #0x18
	asr	r0, r0, #0x18
	bl	sub_8051688
	bl	sub_8051734
	add	r6, r0, #0
	bl	getLevelDescription2
	add	r4, r0, #0
	mov	r0, #0x8
	bl	sub_8049234
	mov	r0, #0x11
	bl	sub_804924C
	ldrb	r0, [r4, #0x10]
	cmp	r0, #0
	beq	.L125	@cond_branch
	ldrh	r6, [r6]
	and	r5, r5, r6
	cmp	r5, #0
	bne	.L125	@cond_branch
	bl	getLevelDescription2
	ldr	r0, [r0, #0x14]
	bl	StoreLevelVar14
	ldr	r0, .L127 + 12
	bl	StoreFunction
	mov	r0, #0x1c
	bl	sub_80490F8
	b	.L129
.L128:
	.align	2, 0
.L127:
	.4byte	0x300005a
	.4byte	0x3000038
	.4byte	0x3000074
	.4byte	sub_8049DE0 + 1
.L125:
	mov	r0, #0x9
	bl	sub_80490F8
	b	.L129
.L123:
	mov	r0, #0xa
	bl	sub_80490F8
	mov	r0, #0x9
	bl	sub_804ABFC
.L129:
	ldr	r0, .L130
	bl	sub_8041364
	ldr	r1, .L130 + 4
	ldr	r0, .L130 + 8
	str	r0, [r1]
	ldr	r1, .L130 + 12
	mov	r0, #0xf0
	lsl	r0, r0, #0x9
	str	r0, [r1]
	ldr	r1, .L130 + 16
	mov	r0, #0x80
	lsl	r0, r0, #0x9
.L38:
	str	r0, [r1]
.L115:
	add	sp, sp, #0x10
	pop	{r3, r4, r5}
	mov	r8, r3
	mov	r9, r4
	mov	sl, r5
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L131:
	.align	2, 0
.L130:
	.4byte	0x3000038
	.4byte	0x3000064
	.4byte	0xffff0000
	.4byte	0x3000068
	.4byte	0x300002c
	thumb_func_end sub_80413FC

.align 2, 0 @ Don't pad with nop.
