	.include "asm/common.inc"

	thumb_func_start sub_804444C
sub_804444C:
	push	{r4, r5, r6, r7, lr}
	mov	r7, sl
	mov	r6, r9
	mov	r5, r8
	push	{r5, r6, r7}
	add	sp, sp, #0xfffffffc
	str	r0, [sp]
	add	r4, r1, #0
	bl	isMultiplayer
	lsl	r0, r0, #0x10
	lsr	r0, r0, #0x10
	mov	r1, #0x1
	mov	sl, r1
	sub	r0, r1, r0
	lsl	r0, r0, #0x4
	ldr	r2, .L8044498
	add	r0, r0, r2
	ldr	r3, .L8044498 + 4
	ldr	r1, [r3]
	add	r7, r1, r0
	ldr	r0, .L8044498 + 8
	add	r5, r1, r0
	ldr	r2, .L8044498 + 12
	mov	r9, r2
	ldr	r0, [r2]
	ldr	r3, .L8044498 + 16
	add	r6, r0, r3
	mov	r8, r1
	cmp	r4, #0x1
	bne	.L804448C	@cond_branch
	b	.L80445C8
.L804448C:
	cmp	r4, #0x1
	bcc	.L80444AC	@cond_branch
	cmp	r4, #0x2
	bne	.L8044496	@cond_branch
	b	.L8044750
.L8044496:
	b	.L80448E2
.L8044498:
	.align	2, 0

	.4byte	0x15d4
	.4byte	_gameData
	.4byte	0x15c4
	.4byte	_currentGameState
	.4byte	0x6ec
.L80444AC:
	bl	sub_8049168
	mov	r4, r9
	ldr	r0, [r4]
	ldr	r1, .L80445A8
	add	r0, r0, r1
	ldrb	r1, [r0]
	add	r1, r1, #0x1
	mov	r4, #0x0
	strb	r1, [r0]
	ldr	r0, .L80445A8 + 4
	mov	r1, #0x80
	lsl	r1, r1, #0x9
	str	r1, [r0]
	ldr	r0, .L80445A8 + 8
	str	r4, [r0]
	ldr	r0, .L80445A8 + 12
	str	r4, [r0]
	ldr	r0, .L80445A8 + 16
	str	r4, [r0]
	ldr	r0, .L80445A8 + 20
	strh	r4, [r0]
	ldr	r2, [sp]
	mov	r3, #0x94
	lsl	r3, r3, #0x2
	add	r0, r2, r3
	NEG	r1, r1
	mov	r2, #0x0
	bl	sub_80596AC
	ldr	r1, [sp]
	add	r1, r1, #0x80
	mov	r0, #0x30
	ldrb	r2, [r1]
	orr	r0, r0, r2
	strb	r0, [r1]
	ldr	r0, .L80445A8 + 24
	str	r4, [r0]
	bl	sub_805FFE4
	lsl	r0, r0, #0x18
	cmp	r0, #0
	beq	.L8044554	@cond_branch
	bl	sub_8060070
	lsl	r0, r0, #0x18
	cmp	r0, #0
	beq	.L8044554	@cond_branch
	mov	r0, #0x7
	strb	r0, [r5, #0x2]
	ldr	r0, [r6, #0x4]
	strb	r0, [r5, #0x4]
	mov	r1, #0x80
	lsl	r1, r1, #0x14
	mov	r0, r8
	bl	RiderHasFlag
	strb	r0, [r5, #0x5]
	ldr	r0, [r6]
	strb	r0, [r5, #0x6]
	ldr	r0, [r6]
	asr	r0, r0, #0x8
	strb	r0, [r5, #0x7]
	mov	r3, #0x2
	ldsh	r0, [r6, r3]
	strb	r0, [r5, #0x8]
	mov	r0, #0x3
	ldsb	r0, [r6, r0]
	strb	r0, [r5, #0x9]
	mov	r0, #0x0
	strb	r0, [r5, #0xa]
	mov	r1, #0x80
	lsl	r1, r1, #0x4
	mov	r0, r8
	bl	RiderHasFlag
	lsl	r0, r0, #0x18
	lsr	r0, r0, #0x18
	NEG	r0, r0
	lsr	r0, r0, #0x1f
	strb	r0, [r5, #0xb]
	add	r0, r5, #0
	bl	sub_8043960
.L8044554:
	mov	r0, #0x0
	bl	sub_804A0E0
	ldr	r4, .L80445A8 + 28
	str	r0, [r4]
	mov	r0, #0x1
	bl	sub_804A0E0
	str	r0, [r4, #0x4]
	mov	r0, #0x2
	bl	sub_804A0E0
	str	r0, [r4, #0x8]
	mov	r0, #0x3
	bl	sub_804A0E0
	str	r0, [r4, #0xc]
	mov	r0, #0x4
	bl	sub_804A0E0
	str	r0, [r4, #0x10]
	mov	r0, #0x5
	bl	sub_804A0E0
	str	r0, [r4, #0x14]
	mov	r0, #0x6
	bl	sub_804A0E0
	str	r0, [r4, #0x18]
	mov	r0, #0x7
	bl	sub_804A0E0
	str	r0, [r4, #0x1c]
	mov	r0, #0x8
	bl	sub_804A0E0
	str	r0, [r4, #0x20]
	mov	r0, #0x9
	bl	sub_804A0E0
	str	r0, [r4, #0x24]
	b	.L80448E2
.L80445A8:
	.align	2, 0

	.4byte	0x6a6
	.4byte	_unk30001B0
	.4byte	_unk30001AC
	.4byte	_unk30001B4
	.4byte	_unk30001BC
	.4byte	_unk30001C0
	.4byte	_unk30001B8
	.4byte	_unk30001C8
.L80445C8:
	ldr	r0, .L8044628
	ldr	r1, .L8044628 + 4
	ldr	r1, [r1]
	bl	sub_804423C
	ldr	r4, [sp]
	mov	r1, #0xa0
	lsl	r1, r1, #0x1
	add	r0, r4, r1
	bl	sub_80439A0
	ldr	r5, .L8044628 + 8
	ldr	r4, [r5]
	cmp	r4, #0
	beq	.L80445E8	@cond_branch
	b	.L804471A
.L80445E8:
	bl	sub_805FFE4
	lsl	r0, r0, #0x18
	cmp	r0, #0
	bne	.L80445F4	@cond_branch
	b	.L804471A
.L80445F4:
	bl	sub_8060070
	lsl	r0, r0, #0x18
	cmp	r0, #0
	bne	.L8044600	@cond_branch
	b	.L804471A
.L8044600:
	add	r0, r7, #0
	mov	r1, #0x7
	bl	sub_8043970
	lsl	r0, r0, #0x18
	cmp	r0, #0
	bne	.L8044610	@cond_branch
	b	.L804471A
.L8044610:
	mov	r2, sl
	str	r2, [r5]
	ldr	r3, .L8044628 + 12
	ldr	r0, [r3]
	ldr	r1, .L8044628 + 16
	add	r0, r0, r1
	ldrb	r0, [r0]
	cmp	r0, #0
	beq	.L8044640	@cond_branch
	ldr	r0, .L8044628 + 20
	str	r4, [r0]
	b	.L80446EC
.L8044628:
	.align	2, 0

	.4byte	_unk30001C8
	.4byte	_unk30001B0
	.4byte	_unk30001B8
	.4byte	_gameData
	.4byte	0x161b
	.4byte	_unk30001BC
.L8044640:
	mov	r2, r9
	ldr	r0, [r2]
	ldr	r3, .L8044670
	add	r0, r0, r3
	ldrb	r0, [r0]
	cmp	r0, #0x1
	bne	.L804469C	@cond_branch
	mov	r1, #0x80
	lsl	r1, r1, #0x4
	mov	r0, r8
	bl	RiderHasFlag
	lsl	r0, r0, #0x18
	cmp	r0, #0
	beq	.L8044678	@cond_branch
	mov	r0, #0xb
	ldsb	r0, [r7, r0]
	cmp	r0, #0
	bne	.L8044678	@cond_branch
	ldr	r0, .L8044670 + 4
	mov	r4, sl
	str	r4, [r0]
	b	.L80446EC
.L804466E:
	.align	2, 0
.L8044670:
	.4byte	0x6a4
	.4byte	_unk30001BC
.L8044678:
	mov	r1, #0x80
	lsl	r1, r1, #0x4
	mov	r0, r8
	bl	RiderHasFlag
	lsl	r0, r0, #0x18
	cmp	r0, #0
	beq	.L8044690	@cond_branch
	mov	r0, #0xb
	ldsb	r0, [r7, r0]
	cmp	r0, #0
	bne	.L80446E4	@cond_branch
.L8044690:
	ldr	r1, .L8044698
	mov	r0, #0x2
	b	.L80446E8
.L8044696:
	.align	2, 0
.L8044698:
	.4byte	_unk30001BC
.L804469C:
	mov	r1, #0x80
	lsl	r1, r1, #0x14
	mov	r0, r8
	bl	RiderHasFlag
	lsl	r0, r0, #0x18
	cmp	r0, #0
	bne	.L80446C0	@cond_branch
	mov	r0, #0x5
	ldsb	r0, [r7, r0]
	cmp	r0, #0
	beq	.L80446C0	@cond_branch
	ldr	r0, .L80446BC
	mov	r1, sl
	str	r1, [r0]
	b	.L80446EC
.L80446BC:
	.align	2, 0

	.4byte	_unk30001BC
.L80446C0:
	mov	r1, #0x80
	lsl	r1, r1, #0x14
	mov	r0, r8
	bl	RiderHasFlag
	lsl	r0, r0, #0x18
	cmp	r0, #0
	beq	.L80446E4	@cond_branch
	mov	r0, #0x5
	ldsb	r0, [r7, r0]
	cmp	r0, #0
	bne	.L80446E4	@cond_branch
	ldr	r1, .L80446E0
	mov	r0, #0x2
	b	.L80446E8
.L80446DE:
	.align	2, 0
.L80446E0:
	.4byte	_unk30001BC
.L80446E4:
	ldr	r1, .L8044700
	mov	r0, #0x0
.L80446E8:
	str	r0, [r1]
	add	r0, r1, #0
.L80446EC:
	ldr	r0, [r0]
	cmp	r0, #0
	bne	.L8044708	@cond_branch
	ldr	r0, .L8044700 + 4
	ldr	r0, [r0]
	mov	r2, #0xd5
	lsl	r2, r2, #0x3
	add	r0, r0, r2
	b	.L8044714
.L80446FE:
	.align	2, 0
.L8044700:
	.4byte	_unk30001BC
	.4byte	_currentGameState
.L8044708:
	cmp	r0, #0x1
	bne	.L804471A	@cond_branch
	ldr	r0, .L8044740
	ldr	r0, [r0]
	ldr	r3, .L8044740 + 4
	add	r0, r0, r3
.L8044714:
	ldrb	r1, [r0]
	add	r1, r1, #0x1
	strb	r1, [r0]
.L804471A:
	ldr	r0, .L8044740 + 8
	ldr	r5, .L8044740 + 12
	ldr	r4, [r0]
	ldr	r0, [r5]
	sub	r4, r4, r0
	asr	r4, r4, #0x2
	ldr	r1, [sp]
	mov	r2, #0x94
	lsl	r2, r2, #0x2
	add	r0, r1, r2
	NEG	r1, r4
	mov	r2, #0x0
	bl	sub_80596AC
	ldr	r0, [r5]
	add	r0, r0, r4
	str	r0, [r5]
	b	.L80448E2
.L804473E:
	.align	2, 0
.L8044740:
	.4byte	_currentGameState
	.4byte	0x6a7
	.4byte	_unk30001AC
	.4byte	_unk30001B0
.L8044750:
	ldr	r0, .L8044784
	ldr	r0, [r0]
	cmp	r0, #0
	beq	.L80447B6	@cond_branch
	ldr	r0, .L8044784 + 4
	ldr	r4, .L8044784 + 8
	ldr	r2, [r4]
	ldr	r1, .L8044784 + 12
	ldr	r3, [r1]
	add	r1, r7, #0
	bl	sub_8044314
	ldr	r1, .L8044784 + 16
	ldrh	r0, [r1]
	cmp	r0, #0
	beq	.L80447A8	@cond_branch
	ldr	r0, [r4]
	mov	r2, #0x1f
	add	r1, r0, #0
	and	r1, r1, r2
	cmp	r1, #0x1f
	bne	.L8044798	@cond_branch
	add	r0, r0, #0x1
	str	r0, [r4]
	b	.L80447B6
.L8044782:
	.align	2, 0
.L8044784:
	.4byte	_unk30001B8
	.4byte	_unk30001C8
	.4byte	_unk30001B4
	.4byte	_unk30001BC
	.4byte	_unk30001C0
.L8044798:
	cmp	r1, #0
	bne	.L80447A2	@cond_branch
	add	r0, r0, #0x1f
	str	r0, [r4]
	b	.L80447B6
.L80447A2:
	orr	r0, r0, r2
	str	r0, [r4]
	b	.L80447B6
.L80447A8:
	ldr	r0, [r4]
	add	r0, r0, #0x1
	str	r0, [r4]
	cmp	r0, #0x7e
	ble	.L80447B6	@cond_branch
	mov	r3, sl
	strh	r3, [r1]
.L80447B6:
	bl	sub_805FFE4
	lsl	r0, r0, #0x18
	cmp	r0, #0
	bne	.L80447C2	@cond_branch
	b	.L80448E2
.L80447C2:
	bl	sub_8060070
	lsl	r0, r0, #0x18
	cmp	r0, #0
	bne	.L80447CE	@cond_branch
	b	.L80448E2
.L80447CE:
	bl	sub_8060040
	lsl	r0, r0, #0x18
	cmp	r0, #0
	beq	.L8044818	@cond_branch
	ldr	r1, .L8044804
	mov	r6, #0x1
	add	r0, r6, #0
	ldrh	r1, [r1]
	and	r0, r0, r1
	cmp	r0, #0
	beq	.L8044818	@cond_branch
	ldr	r4, .L8044804 + 4
	ldrh	r0, [r4]
	cmp	r0, #0
	beq	.L804480C	@cond_branch
	mov	r0, #0xf
	ldrb	r4, [r5, #0x2]
	and	r0, r0, r4
	mov	r1, #0x10
	orr	r0, r0, r1
	strb	r0, [r5, #0x2]
	add	r0, r5, #0
	bl	sub_8043960
	b	.L8044818
.L8044802:
	.align	2, 0
.L8044804:
	.4byte	_unk3005DA0
	.4byte	_unk30001C0
.L804480C:
	mov	r0, #0x1
	strb	r0, [r5, #0xa]
	add	r0, r5, #0
	bl	sub_8043960
	strh	r6, [r4]
.L8044818:
	add	r0, r7, #0
	mov	r1, #0x7
	bl	sub_8043970
	lsl	r0, r0, #0x18
	cmp	r0, #0
	beq	.L80448E2	@cond_branch
	ldr	r0, .L80448A4
	ldr	r1, [r0]
	ldr	r2, .L80448A4 + 4
	mov	sl, r2
	add	r3, r1, r2
	ldr	r4, .L80448A4 + 8
	mov	r9, r4
	add	r2, r1, r4
	add	r4, r4, #0x1
	add	r0, r1, r4
	ldrb	r4, [r0]
	mov	r0, #0xd5
	lsl	r0, r0, #0x3
	add	r1, r1, r0
	ldrb	r0, [r1]
	ldrb	r2, [r2]
	sub	r1, r2, r0
	sub	r1, r1, r4
	mov	r8, r1
	ldrb	r3, [r3]
	sub	r0, r3, r0
	asr	r0, r0, #0x1
	add	r6, r0, #1
	mov	r0, #0xa
	ldsb	r0, [r7, r0]
	cmp	r0, #0
	beq	.L8044862	@cond_branch
	ldr	r1, .L80448A4 + 12
	mov	r0, #0x1
	strh	r0, [r1]
.L8044862:
	mov	r0, #0xf0
	ldrb	r7, [r7, #0x2]
	and	r0, r0, r7
	cmp	r0, #0x10
	bne	.L80448E2	@cond_branch
	mov	r0, #0xf
	ldrb	r1, [r5, #0x2]
	and	r0, r0, r1
	mov	r1, #0x10
	orr	r0, r0, r1
	strb	r0, [r5, #0x2]
	add	r0, r5, #0
	bl	sub_8043960
	ldr	r1, .L80448A4 + 16
	mov	r0, #0x80
	lsl	r0, r0, #0x9
	str	r0, [r1]
	ldr	r2, .L80448A4
	ldr	r0, [r2]
	mov	r3, sl
	add	r1, r0, r3
	ADD r0, r9
	ldrb	r1, [r1]
	ldrb	r0, [r0]
	cmp	r1, r0
	bne	.L80448B8	@cond_branch
	cmp	r4, r8
	bne	.L80448B8	@cond_branch
	mov	r0, #0x25
	bl	sub_80490F8
	b	.L80448DC
.L80448A4:
	.align	2, 0

	.4byte	_currentGameState
	.4byte	0x6a5
	.4byte	0x6a6
	.4byte	_unk30001C0
	.4byte	_unk30001AC
.L80448B8:
	sub	r0, r6, r4
	cmp	r0, #0
	bgt	.L80448C6	@cond_branch
	mov	r0, #0x23
	bl	sub_80490F8
	b	.L80448DC
.L80448C6:
	mov	r4, r8
	sub	r0, r6, r4
	cmp	r0, #0
	bgt	.L80448D6	@cond_branch
	mov	r0, #0x24
	bl	sub_80490F8
	b	.L80448DC
.L80448D6:
	mov	r0, #0x22
	bl	sub_80490F8
.L80448DC:
	mov	r0, #0x8
	bl	sub_804ABFC
.L80448E2:
	add	sp, sp, #0x4
	pop	{r3, r4, r5}
	mov	r8, r3
	mov	r9, r4
	mov	sl, r5
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
	thumb_func_end sub_804444C

.align 2, 0 @ Don't pad with nop.
