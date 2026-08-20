	.include "asm/common.inc"

	thumb_func_start sub_804568C
sub_804568C:
	push	{r4, r5, r6, lr}
	cmp	r1, #0x1
	beq	.L80456FC	@cond_branch
	cmp	r1, #0x1
	bcc	.L80456A4	@cond_branch
	cmp	r1, #0x2
	bne	.L804569C	@cond_branch
	b	.L8045810
.L804569C:
	cmp	r1, #0x7
	bne	.L80456A2	@cond_branch
	b	.L8045830
.L80456A2:
	b	.L8045840
.L80456A4:
	bl	sub_8049168
	ldr	r0, .L80456D4
	ldr	r1, .L80456D4 + 4
	bl	sub_8057158
	ldr	r0, .L80456D4 + 8
	ldr	r1, .L80456D4 + 12
	bl	sub_8057158
	ldr	r0, .L80456D4 + 16
	ldr	r1, .L80456D4 + 20
	bl	sub_8057158
	ldr	r0, .L80456D4 + 24
	ldr	r1, .L80456D4 + 28
	bl	sub_8057158
	ldr	r0, .L80456D4 + 32
	ldr	r1, .L80456D4 + 36
	bl	sub_8057158
	b	.L8045840
.L80456D2:
	.align	2, 0
.L80456D4:
	.4byte	_unk3000380
	.4byte	0x80693a0
	.4byte	_unk3000388
	.4byte	0x8069378
	.4byte	_unk3000390
	.4byte	0x806938c
	.4byte	_unk3000398
	.4byte	0x80693b4
	.4byte	_unk30003A0
	.4byte	0x80693c8
.L80456FC:
	ldr	r4, .L80457F0
	add	r0, r4, #0
	bl	sub_8057164
	add	r0, r4, #0
	bl	sub_80571D0
	lsl	r0, r0, #0x18
	cmp	r0, #0
	beq	.L804572C	@cond_branch
	mov	r4, #0x0
	mov	r5, #0x2
.L8045714:
	add	r0, r4, #0
	bl	sub_8051720
	ldrh	r1, [r0]
	orr	r1, r1, r5
	strh	r1, [r0]
	add	r4, r4, #0x1
	cmp	r4, #0x37
	ble	.L8045714	@cond_branch
	mov	r0, #0x8
	bl	sub_804ABFC
.L804572C:
	ldr	r4, .L80457F0 + 4
	add	r0, r4, #0
	bl	sub_8057164
	add	r0, r4, #0
	bl	sub_80571D0
	lsl	r0, r0, #0x18
	cmp	r0, #0
	beq	.L8045756	@cond_branch
	ldr	r0, .L80457F0 + 8
	ldr	r1, [r0]
	ldr	r0, .L80457F0 + 12
	add	r1, r1, r0
	ldr	r0, [r1]
	mov	r2, #0x1
	orr	r0, r0, r2
	str	r0, [r1]
	mov	r0, #0x8
	bl	sub_804ABFC
.L8045756:
	ldr	r4, .L80457F0 + 16
	add	r0, r4, #0
	bl	sub_8057164
	add	r0, r4, #0
	bl	sub_80571D0
	lsl	r0, r0, #0x18
	cmp	r0, #0
	beq	.L8045780	@cond_branch
	mov	r4, #0x0
.L804576C:
	add	r0, r4, #0
	mov	r1, #0x1
	bl	sub_8057104
	add	r4, r4, #0x1
	cmp	r4, #0x6c
	ble	.L804576C	@cond_branch
	mov	r0, #0x8
	bl	sub_804ABFC
.L8045780:
	ldr	r4, .L80457F0 + 20
	add	r0, r4, #0
	bl	sub_8057164
	add	r0, r4, #0
	bl	sub_80571D0
	lsl	r0, r0, #0x18
	cmp	r0, #0
	beq	.L80457AA	@cond_branch
	ldr	r0, .L80457F0 + 8
	ldr	r1, [r0]
	ldr	r3, .L80457F0 + 12
	add	r1, r1, r3
	ldr	r0, [r1]
	mov	r2, #0x2
	orr	r0, r0, r2
	str	r0, [r1]
	mov	r0, #0x8
	bl	sub_804ABFC
.L80457AA:
	ldr	r4, .L80457F0 + 24
	add	r0, r4, #0
	bl	sub_8057164
	add	r0, r4, #0
	bl	sub_80571D0
	lsl	r0, r0, #0x18
	cmp	r0, #0
	beq	.L80457D4	@cond_branch
	ldr	r0, .L80457F0 + 8
	ldr	r1, [r0]
	ldr	r0, .L80457F0 + 12
	add	r1, r1, r0
	ldr	r0, [r1]
	mov	r2, #0x4
	orr	r0, r0, r2
	str	r0, [r1]
	mov	r0, #0x8
	bl	sub_804ABFC
.L80457D4:
	bl	sub_8057C40
	asr	r0, r0, #0x8
	mov	r1, #0x1
	and	r0, r0, r1
	cmp	r0, #0
	bne	.L8045830	@cond_branch
	mov	r2, #0x80
	lsl	r2, r2, #0x13
	ldrh	r1, [r2]
	ldr	r0, .L80457F0 + 28
	and	r0, r0, r1
	strh	r0, [r2]
	b	.L8045840
.L80457F0:
	.align	2, 0

	.4byte	_unk3000380
	.4byte	_unk3000388
	.4byte	_currentGameState
	.4byte	0xc64
	.4byte	_unk3000390
	.4byte	_unk3000398
	.4byte	_unk30003A0
	.4byte	0xefff
.L8045810:
	ldr	r1, .L804582C
	mov	r0, #0x9
	ldrh	r1, [r1]
	and	r0, r0, r1
	cmp	r0, #0
	beq	.L8045840	@cond_branch
	mov	r0, #0xa
	bl	sub_804924C
	mov	r0, #0x8
	bl	sub_80490F8
	b	.L8045840
.L804582A:
	.align	2, 0
.L804582C:
	.4byte	_unk3005DA0
.L8045830:
	mov	r0, #0x80
	lsl	r0, r0, #0x13
	ldrh	r1, [r0]
	mov	r3, #0x80
	lsl	r3, r3, #0x5
	add	r2, r3, #0
	orr	r1, r1, r2
	strh	r1, [r0]
.L8045840:
	pop	{r4, r5, r6}
	pop	{r0}
	bx	r0
	thumb_func_end sub_804568C

.align 2, 0 @ Don't pad with nop.
