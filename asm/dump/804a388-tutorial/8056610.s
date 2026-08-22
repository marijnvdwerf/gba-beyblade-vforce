	.include "asm/common.inc"

	thumb_func_start sub_8056610
sub_8056610:
	push	{r4, r5, r6, r7, lr}
	add	r7, r1, #0
	add	r4, r2, #0
	add	r5, r3, #0
	ldr	r6, [r4]
	mov	r0, #0xda
	lsl	r0, r0, #0x1
	add	r2, r4, r0
	ldr	r1, [r5, #0x8]
	ldr	r0, [r2]
	cmp	r1, r0
	ble	.L805662A	@cond_branch
	str	r1, [r2]
.L805662A:
	mov	r0, #0x2
	ldrb	r1, [r5, #0xc]
	and	r0, r0, r1
	lsl	r0, r0, #0x18
	lsr	r1, r0, #0x18
	cmp	r1, #0
	bne	.L8056640	@cond_branch
	add	r0, r4, #0
	add	r0, r0, #0xe4
	str	r1, [r0]
	b	.L80567DE
.L8056640:
	ldr	r0, [r6, #0xc]
	ldr	r1, [r6, #0x48]
	add	r0, r0, r1
	ldr	r1, [r5, #0x8]
	cmp	r0, r1
	ble	.L8056656	@cond_branch
	add	r1, r4, #0
	add	r1, r1, #0xe4
	mov	r0, #0x0
	str	r0, [r1]
	b	.L80567DE
.L8056656:
	add	r2, r4, #0
	add	r2, r2, #0xe8
	ldr	r0, [r2]
	add	r1, r4, #0
	add	r1, r1, #0xe4
	cmp	r7, r0
	beq	.L8056668	@cond_branch
	ldr	r0, [r1]
	str	r0, [r2]
.L8056668:
	str	r7, [r1]
	add	r1, r4, #0
	add	r1, r1, #0xf0
	ldr	r0, .L8056698
	ldr	r0, [r0]
	str	r0, [r1]
	sub	r1, r1, #0x5c
	ldr	r0, [r6, #0x48]
	str	r0, [r1]
	ldrb	r0, [r7, #0xf]
	cmp	r0, #0x81
	beq	.L805669C	@cond_branch
	cmp	r0, #0x85
	beq	.L80566C2	@cond_branch
	mov	r0, #0x1
	ldrb	r2, [r5, #0xc]
	and	r0, r0, r2
	cmp	r0, #0
	beq	.L8056726	@cond_branch
	mov	r0, #0xd
	ldsb	r0, [r5, r0]
	cmp	r0, #0
	blt	.L8056702	@cond_branch
	b	.L80566E0
.L8056698:
	.align	2, 0

	.4byte	_unk3000E30
.L805669C:
	mov	r0, #0xb8
	lsl	r0, r0, #0x1
	add	r1, r4, r0
	ldr	r0, [r5, #0x18]
	str	r0, [r1]
	mov	r2, #0xba
	lsl	r2, r2, #0x1
	add	r1, r4, r2
	ldr	r0, [r5, #0x1c]
	str	r0, [r1]
	mov	r0, #0xb6
	lsl	r0, r0, #0x1
	add	r1, r4, r0
	ldr	r0, [r5, #0x14]
	str	r0, [r1]
	ldr	r0, [r5, #0x20]
	str	r0, [r4, #0x30]
	ldr	r0, [r5, #0x24]
	b	.L805677A
.L80566C2:
	mov	r2, #0xb8
	lsl	r2, r2, #0x1
	add	r1, r4, r2
	ldr	r0, [r5, #0x18]
	str	r0, [r1]
	mov	r0, #0xba
	lsl	r0, r0, #0x1
	add	r1, r4, r0
	ldr	r0, [r5, #0x1c]
	str	r0, [r1]
	sub	r2, r2, #0x4
	add	r1, r4, r2
	ldr	r0, [r5, #0x14]
	str	r0, [r1]
	b	.L805677C
.L80566E0:
	mov	r0, #0xb8
	lsl	r0, r0, #0x1
	add	r1, r4, r0
	mov	r0, #0xd
	ldsb	r0, [r5, r0]
	str	r0, [r1]
	mov	r2, #0xba
	lsl	r2, r2, #0x1
	add	r1, r4, r2
	ldr	r0, [r4, #0x28]
	asr	r0, r0, #0x8
	str	r0, [r1]
	mov	r0, #0xb6
	lsl	r0, r0, #0x1
	add	r1, r4, r0
	mov	r0, #0x0
	b	.L805676A
.L8056702:
	mov	r2, #0xb8
	lsl	r2, r2, #0x1
	add	r1, r4, r2
	mov	r0, #0xd
	ldsb	r0, [r5, r0]
	neg	r0, r0
	str	r0, [r1]
	mov	r0, #0xba
	lsl	r0, r0, #0x1
	add	r1, r4, r0
	ldr	r0, [r4, #0x28]
	neg	r0, r0
	asr	r0, r0, #0x8
	str	r0, [r1]
	sub	r2, r2, #0x4
	add	r1, r4, r2
	mov	r0, #0x80
	b	.L805676A
.L8056726:
	mov	r2, #0xe
	ldsb	r2, [r5, r2]
	neg	r1, r2
	cmp	r1, #0
	blt	.L805674E	@cond_branch
	mov	r2, #0xb8
	lsl	r2, r2, #0x1
	add	r0, r4, r2
	str	r1, [r0]
	mov	r0, #0xba
	lsl	r0, r0, #0x1
	add	r1, r4, r0
	ldr	r0, [r4, #0x34]
	neg	r0, r0
	asr	r0, r0, #0x8
	str	r0, [r1]
	sub	r2, r2, #0x4
	add	r1, r4, r2
	mov	r0, #0x40
	b	.L805676A
.L805674E:
	mov	r1, #0xb8
	lsl	r1, r1, #0x1
	add	r0, r4, r1
	str	r2, [r0]
	mov	r2, #0xba
	lsl	r2, r2, #0x1
	add	r1, r4, r2
	ldr	r0, [r4, #0x34]
	asr	r0, r0, #0x8
	str	r0, [r1]
	mov	r0, #0xb6
	lsl	r0, r0, #0x1
	add	r1, r4, r0
	mov	r0, #0xc0
.L805676A:
	str	r0, [r1]
	mov	r0, #0xd
	ldsb	r0, [r5, r0]
	lsl	r0, r0, #0x8
	str	r0, [r4, #0x30]
	mov	r0, #0xe
	ldsb	r0, [r5, r0]
	lsl	r0, r0, #0x8
.L805677A:
	str	r0, [r4, #0x3c]
.L805677C:
	mov	r0, #0x0
	str	r0, [r4, #0x74]
	add	r0, r4, #0
	add	r0, r0, #0xe0
	str	r7, [r0]
	ldr	r1, [r6, #0x48]
	ldr	r0, .L80567B4
	cmp	r1, r0
	bge	.L80567B8	@cond_branch
	mov	r0, #0x56
	mul	r0, r0, r1
	asr	r0, r0, #0x8
	neg	r0, r0
	str	r0, [r6, #0x48]
	mov	r0, #0x3
	bl	sub_804ABFC
	mov	r1, #0x80
	lsl	r1, r1, #0x13
	add	r0, r4, #0
	bl	RiderHasFlag
	lsl	r0, r0, #0x18
	cmp	r0, #0
	bne	.L80567C0	@cond_branch
	bl	sub_80558B8
	b	.L80567C0
.L80567B4:
	.align	2, 0

	.4byte	0xfffffd00
.L80567B8:
	add	r0, r4, #0
	mov	r1, #0x2
	bl	UnsetRiderFlag
.L80567C0:
	ldr	r0, [r5, #0x8]
	str	r0, [r6, #0xc]
	add	r0, r4, #0
	mov	r1, #0x2
	bl	RiderHasFlag
	lsl	r0, r0, #0x18
	lsr	r0, r0, #0x18
	cmp	r0, #0
	bne	.L80567DE	@cond_branch
	str	r0, [r6, #0x48]
	add	r0, r4, #0
	add	r1, r7, #0
	bl	sub_804E124
.L80567DE:
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
	thumb_func_end sub_8056610

.align 2, 0 @ Don't pad with nop.
