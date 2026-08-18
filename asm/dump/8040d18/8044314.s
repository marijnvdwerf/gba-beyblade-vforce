	.include "asm/common.inc"

	thumb_func_start sub_8044314
sub_8044314:
	push	{r4, r5, r6, r7, lr}
	add	r5, r0, #0
	add	r7, r3, #0
	asr	r4, r2, #0x5
	mov	r0, #0x1f
	and	r0, r0, r2
	add	r6, r0, #1
	bl	getLanguage
	add	r3, r0, #0
	cmp	r6, #0x1
	bne	.L8044394	@cond_branch
	cmp	r4, #0x1
	beq	.L8044350	@cond_branch
	cmp	r4, #0x1
	bgt	.L804433A	@cond_branch
	cmp	r4, #0
	beq	.L8044344	@cond_branch
	b	.L804443A
.L804433A:
	cmp	r4, #0x2
	beq	.L8044364	@cond_branch
	cmp	r4, #0x3
	beq	.L8044378	@cond_branch
	b	.L804443A
.L8044344:
	ldr	r0, [r5]
	ldr	r2, .L804434C
	lsl	r1, r3, #0x2
	b	.L8044384
.L804434C:
	.align	2, 0

	.4byte	0x806e8d8
.L8044350:
	ldr	r0, [r5, #0x8]
	ldr	r1, .L8044360
	lsl	r2, r3, #0x2
	add	r1, r1, #0x14
	add	r2, r2, r1
	ldr	r1, [r2]
	b	.L8044388
.L804435E:
	.align	2, 0
.L8044360:
	.4byte	0x806e8d8
.L8044364:
	ldr	r0, [r5, #0x10]
	ldr	r1, .L8044374
	lsl	r2, r3, #0x2
	add	r1, r1, #0x28
	add	r2, r2, r1
	ldr	r1, [r2]
	b	.L8044388
.L8044372:
	.align	2, 0
.L8044374:
	.4byte	0x806e8d8
.L8044378:
	ldr	r0, [r5, #0x24]
	ldr	r2, .L8044390
	lsl	r1, r7, #0x2
	add	r1, r1, r7
	add	r1, r1, r3
	lsl	r1, r1, #0x2
.L8044384:
	add	r1, r1, r2
	ldr	r1, [r1]
.L8044388:
	mov	r2, #0xe
	bl	sub_8061660
	b	.L804443A
.L8044390:
	.align	2, 0

	.4byte	0x806e914
.L8044394:
	cmp	r4, #0x1
	beq	.L80443FC	@cond_branch
	cmp	r4, #0x1
	bgt	.L80443A2	@cond_branch
	cmp	r4, #0
	beq	.L80443A8	@cond_branch
	b	.L804443A
.L80443A2:
	cmp	r4, #0x2
	beq	.L804441C	@cond_branch
	b	.L804443A
.L80443A8:
	ldr	r0, .L80443EC
	ldr	r0, [r0]
	ldr	r2, .L80443EC + 4
	add	r1, r0, r2
	ldrb	r2, [r1]
	ldr	r3, .L80443EC + 8
	add	r1, r0, r3
	add	r3, r3, #0x2
	add	r0, r0, r3
	ldrb	r1, [r1]
	ldrb	r0, [r0]
	sub	r4, r1, r0
	sub	r4, r4, r2
	ldr	r0, [r5, #0x4]
	add	r1, r2, #0
	mul	r1, r1, r6
	asr	r1, r1, #0x5
	mov	r2, #0xf
	bl	showNumber_2
	ldr	r0, [r5, #0x4]
	ldr	r1, .L80443EC + 12
	mov	r2, #0xf
	bl	showString
	ldr	r0, [r5, #0x4]
	add	r1, r4, #0
	mul	r1, r1, r6
	asr	r1, r1, #0x5
	mov	r2, #0xf
	bl	showNumber
	b	.L804443A
.L80443EA:
	.align	2, 0
.L80443EC:
	.4byte	0x3000f48
	.4byte	0x6a7
	.4byte	0x6a6
	.4byte	0x86fd470
.L80443FC:
	ldr	r0, [r5, #0xc]
	ldr	r1, .L8044418
	ldr	r1, [r1]
	mov	r2, #0xd5
	lsl	r2, r2, #0x3
	add	r1, r1, r2
	ldrb	r1, [r1]
	mul	r1, r1, r6
	asr	r1, r1, #0x5
	mov	r2, #0xf
	bl	showNumber_2
	b	.L804443A
.L8044416:
	.align	2, 0
.L8044418:
	.4byte	0x3000f48
.L804441C:
	ldr	r0, .L8044440
	ldr	r0, [r0]
	ldr	r3, .L8044440 + 4
	add	r1, r0, r3
	ldr	r2, .L8044440 + 8
	add	r0, r0, r2
	ldrb	r1, [r1]
	ldrb	r0, [r0]
	sub	r1, r1, r0
	ldr	r0, [r5, #0x14]
	mul	r1, r1, r6
	asr	r1, r1, #0x5
	mov	r2, #0xf
	bl	showNumber_2
.L804443A:
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L8044440:
	.align	2, 0

	.4byte	0x3000f48
	.4byte	0x6a5
	.4byte	0x6a6
	thumb_func_end sub_8044314

.align 2, 0 @ Don't pad with nop.
