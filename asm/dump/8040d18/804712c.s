	.include "asm/common.inc"

	thumb_func_start sub_804712C
sub_804712C:
	push	{r4, r5, r6, r7, lr}
	mov	r7, sl
	mov	r6, r9
	mov	r5, r8
	push	{r5, r6, r7}
	add	r7, r0, #0
	bl	getLanguage
	add	r4, r0, #0
	add	r0, r7, #0
	add	r0, r0, #0x34
	ldrb	r0, [r0]
	lsl	r0, r0, #0x18
	asr	r0, r0, #0x18
	mov	r9, r0
	bl	getBeybladeData0
	mov	r0, #0x0
	mov	sl, r0
	add	r0, r7, #0
	bl	sub_804703C
	ldr	r0, [r7, #0x14]
	bl	sub_8061228
	ldr	r0, [r7, #0x18]
	bl	sub_8061228
	ldr	r0, [r7, #0x1c]
	bl	sub_8061228
	ldr	r0, [r7, #0x20]
	bl	sub_8061228
	ldr	r0, [r7, #0x24]
	bl	sub_8061228
	ldr	r0, [r7, #0x28]
	bl	sub_8061228
	ldr	r0, [r7, #0x2c]
	bl	sub_8061228
	ldr	r1, [r7, #0x8]
	cmp	r1, #0
	beq	.L804718E	@cond_branch
	mov	r0, #0xa0
	lsl	r0, r0, #0x8
	str	r0, [r1, #0xc]
.L804718E:
	ldr	r1, [r7, #0xc]
	cmp	r1, #0
	beq	.L804719A	@cond_branch
	mov	r0, #0xa0
	lsl	r0, r0, #0x8
	str	r0, [r1, #0xc]
.L804719A:
	ldr	r1, [r7, #0x10]
	cmp	r1, #0
	beq	.L80471A6	@cond_branch
	mov	r0, #0xa0
	lsl	r0, r0, #0x8
	str	r0, [r1, #0xc]
.L80471A6:
	add	r0, r7, #0
	add	r0, r0, #0x35
	ldrb	r0, [r0]
	lsl	r0, r0, #0x18
	asr	r0, r0, #0x18
	cmp	r0, #0x5
	bls	.L80471B6	@cond_branch
	b	.L804741E
.L80471B6:
	lsl	r0, r0, #0x2
	ldr	r1, .L80471C0
	add	r0, r0, r1
	ldr	r0, [r0]
	mov	pc, r0
.L80471C0:
	.align	2, 0

	.4byte	.L80471C4
.L80471C4:
	.4byte	.L80471DC
	.4byte	.L8047250
	.4byte	.L80472CC
	.4byte	.L804734C
	.4byte	.L80473CC
	.4byte	.L804740C
.L80471DC:
	ldr	r0, [r7, #0x14]
	ldr	r1, .L8047248
	lsl	r6, r4, #0x2
	add	r1, r6, r1
	ldr	r1, [r1]
	mov	r2, #0xe
	bl	sub_8061660
	ldr	r0, [r7, #0x18]
	ldr	r5, .L8047248 + 4
	add	r1, r6, r5
	ldr	r1, [r1]
	mov	r2, #0xe
	bl	sub_8061660
	ldr	r4, [r7, #0x18]
	mov	r0, r9
	bl	sub_8057048
	add	r1, r0, #0
	add	r0, r4, #0
	mov	r2, #0xf
	bl	showString
	ldr	r0, [r7, #0x1c]
	add	r1, r5, #0
	add	r1, r1, #0x14
	add	r1, r6, r1
	ldr	r1, [r1]
	mov	r2, #0xe
	bl	sub_8061660
	ldr	r4, [r7, #0x1c]
	mov	r0, r9
	bl	sub_80573DC
	add	r1, r0, #0
	add	r0, r4, #0
	mov	r2, #0xf
	bl	showString
	ldr	r0, [r7, #0x20]
	add	r5, r5, #0x28
	add	r6, r6, r5
	ldr	r1, [r6]
	mov	r2, #0xe
	bl	sub_8061660
	ldr	r4, [r7, #0x20]
	mov	r0, r9
	bl	sub_80573FC
	b	.L80473F6
.L8047246:
	.align	2, 0
.L8047248:
	.4byte	0x806e240
	.4byte	0x806e31c
.L8047250:
	ldr	r0, [r7, #0x14]
	ldr	r6, .L80472C4
	lsl	r4, r4, #0x2
	add	r1, r6, #0
	add	r1, r1, #0x14
	add	r1, r4, r1
	ldr	r1, [r1]
	mov	r2, #0xe
	bl	sub_8061660
	ldr	r0, [r7, #0x18]
	ldr	r1, .L80472C4 + 4
	add	r1, r4, r1
	ldr	r1, [r1]
	mov	r2, #0xe
	bl	sub_8061660
	ldr	r5, [r7, #0x18]
	mov	r0, r9
	bl	sub_805741C
	add	r1, r0, #0
	add	r0, r5, #0
	mov	r2, #0xf
	bl	showString
	ldr	r0, [r7, #0x24]
	add	r1, r6, #0
	add	r1, r1, #0x64
	add	r1, r4, r1
	ldr	r1, [r1]
	mov	r2, #0xe
	bl	sub_8061660
	ldr	r0, [r7, #0x28]
	add	r1, r6, #0
	add	r1, r1, #0x78
	add	r1, r4, r1
	ldr	r1, [r1]
	mov	r2, #0xe
	bl	sub_8061660
	ldr	r0, [r7, #0x2c]
	add	r1, r6, #0
	add	r1, r1, #0x8c
	add	r4, r4, r1
	ldr	r1, [r4]
	mov	r2, #0xe
	bl	sub_8061660
	mov	r2, #0x1
	mov	sl, r2
	mov	r0, r9
	bl	sub_80573C8
	mov	r8, r0
	b	.L804741E
.L80472C2:
	.align	2, 0
.L80472C4:
	.4byte	0x806e240
	.4byte	0x806e31c
.L80472CC:
	ldr	r0, [r7, #0x14]
	ldr	r6, .L8047344
	lsl	r4, r4, #0x2
	add	r1, r6, #0
	add	r1, r1, #0x28
	add	r1, r4, r1
	ldr	r1, [r1]
	mov	r2, #0xe
	bl	sub_8061660
	ldr	r0, [r7, #0x18]
	ldr	r1, .L8047344 + 4
	add	r1, r1, #0x14
	add	r1, r4, r1
	ldr	r1, [r1]
	mov	r2, #0xe
	bl	sub_8061660
	ldr	r5, [r7, #0x18]
	mov	r0, r9
	bl	sub_805743C
	add	r1, r0, #0
	add	r0, r5, #0
	mov	r2, #0xf
	bl	showString
	ldr	r0, [r7, #0x24]
	add	r1, r6, #0
	add	r1, r1, #0x64
	add	r1, r4, r1
	ldr	r1, [r1]
	mov	r2, #0xe
	bl	sub_8061660
	ldr	r0, [r7, #0x28]
	add	r1, r6, #0
	add	r1, r1, #0x78
	add	r1, r4, r1
	ldr	r1, [r1]
	mov	r2, #0xe
	bl	sub_8061660
	ldr	r0, [r7, #0x2c]
	add	r1, r6, #0
	add	r1, r1, #0x8c
	add	r4, r4, r1
	ldr	r1, [r4]
	mov	r2, #0xe
	bl	sub_8061660
	mov	r0, #0x1
	mov	sl, r0
	mov	r0, r9
	bl	sub_80573C8
	add	r0, r0, #0x4
	mov	r8, r0
	b	.L804741E
.L8047342:
	.align	2, 0
.L8047344:
	.4byte	0x806e240
	.4byte	0x806e31c
.L804734C:
	ldr	r0, [r7, #0x14]
	ldr	r6, .L80473C4
	lsl	r4, r4, #0x2
	add	r1, r6, #0
	add	r1, r1, #0x3c
	add	r1, r4, r1
	ldr	r1, [r1]
	mov	r2, #0xe
	bl	sub_8061660
	ldr	r0, [r7, #0x18]
	ldr	r1, .L80473C4 + 4
	add	r1, r1, #0x14
	add	r1, r4, r1
	ldr	r1, [r1]
	mov	r2, #0xe
	bl	sub_8061660
	ldr	r5, [r7, #0x18]
	mov	r0, r9
	bl	sub_805745C
	add	r1, r0, #0
	add	r0, r5, #0
	mov	r2, #0xf
	bl	showString
	ldr	r0, [r7, #0x24]
	add	r1, r6, #0
	add	r1, r1, #0x64
	add	r1, r4, r1
	ldr	r1, [r1]
	mov	r2, #0xe
	bl	sub_8061660
	ldr	r0, [r7, #0x28]
	add	r1, r6, #0
	add	r1, r1, #0x78
	add	r1, r4, r1
	ldr	r1, [r1]
	mov	r2, #0xe
	bl	sub_8061660
	ldr	r0, [r7, #0x2c]
	add	r1, r6, #0
	add	r1, r1, #0x8c
	add	r4, r4, r1
	ldr	r1, [r4]
	mov	r2, #0xe
	bl	sub_8061660
	mov	r2, #0x1
	mov	sl, r2
	mov	r0, r9
	bl	sub_80573C8
	add	r0, r0, #0x8
	mov	r8, r0
	b	.L804741E
.L80473C2:
	.align	2, 0
.L80473C4:
	.4byte	0x806e240
	.4byte	0x806e31c
.L80473CC:
	ldr	r0, [r7, #0x14]
	ldr	r1, .L8047404
	lsl	r4, r4, #0x2
	add	r1, r1, #0x50
	add	r1, r4, r1
	ldr	r1, [r1]
	mov	r2, #0xe
	bl	sub_8061660
	ldr	r0, [r7, #0x18]
	ldr	r1, .L8047404 + 4
	add	r1, r1, #0x14
	add	r4, r4, r1
	ldr	r1, [r4]
	mov	r2, #0xe
	bl	sub_8061660
	ldr	r4, [r7, #0x18]
	mov	r0, r9
	bl	sub_805747C
.L80473F6:
	add	r1, r0, #0
	add	r0, r4, #0
	mov	r2, #0xf
	bl	showString
	b	.L804741E
.L8047402:
	.align	2, 0
.L8047404:
	.4byte	0x806e240
	.4byte	0x806e31c
.L804740C:
	ldr	r0, [r7, #0x14]
	ldr	r1, .L8047440
	lsl	r2, r4, #0x2
	add	r1, r1, #0xc8
	add	r2, r2, r1
	ldr	r1, [r2]
	mov	r2, #0xe
	bl	sub_8061660
.L804741E:
	mov	r0, sl
	cmp	r0, #0
	beq	.L8047484	@cond_branch
	ldr	r1, [r7, #0x8]
	cmp	r1, #0
	beq	.L8047448	@cond_branch
	mov	r0, #0xa8
	lsl	r0, r0, #0x7
	str	r0, [r1, #0xc]
	mov	r2, r8
	ldrb	r0, [r2]
	cmp	r0, #0
	beq	.L8047444	@cond_branch
	ldrb	r0, [r2]
	sub	r0, r0, #0x1
	b	.L8047446
.L804743E:
	.align	2, 0
.L8047440:
	.4byte	0x806e240
.L8047444:
	mov	r0, #0x0
.L8047446:
	strh	r0, [r1, #0x18]
.L8047448:
	ldr	r1, [r7, #0xc]
	cmp	r1, #0
	beq	.L8047466	@cond_branch
	mov	r0, #0xc0
	lsl	r0, r0, #0x7
	str	r0, [r1, #0xc]
	mov	r2, r8
	ldrb	r0, [r2, #0x1]
	cmp	r0, #0
	beq	.L8047462	@cond_branch
	ldrb	r0, [r2, #0x1]
	sub	r0, r0, #0x1
	b	.L8047464
.L8047462:
	mov	r0, #0x0
.L8047464:
	strh	r0, [r1, #0x18]
.L8047466:
	ldr	r1, [r7, #0x10]
	cmp	r1, #0
	beq	.L8047484	@cond_branch
	mov	r0, #0xd8
	lsl	r0, r0, #0x7
	str	r0, [r1, #0xc]
	mov	r2, r8
	ldrb	r0, [r2, #0x2]
	cmp	r0, #0
	beq	.L8047480	@cond_branch
	ldrb	r0, [r2, #0x2]
	sub	r0, r0, #0x1
	b	.L8047482
.L8047480:
	mov	r0, #0x0
.L8047482:
	strh	r0, [r1, #0x18]
.L8047484:
	pop	{r3, r4, r5}
	mov	r8, r3
	mov	r9, r4
	mov	sl, r5
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
	thumb_func_end sub_804712C

.align 2, 0 @ Don't pad with nop.
