	.include "asm/common.inc"

	thumb_func_start sub_805B41C
sub_805B41C:
	push	{r4, r5, r6, r7, lr}
	mov	r7, sl
	mov	r6, r9
	mov	r5, r8
	push	{r5, r6, r7}
	add	sp, sp, #0xffffffc8
	str	r0, [sp, #0x4]
	str	r1, [sp, #0x8]
	str	r2, [sp, #0xc]
	str	r3, [sp, #0x10]
	ldr	r0, [sp, #0x58]
	lsl	r0, r0, #0x18
	lsr	r5, r0, #0x18
	ldr	r0, [sp, #0x4]
	ldr	r6, [r0]
	ldr	r4, [r0, #0x8]
	add	r0, r6, #0
	add	r0, r0, #0x5c
	ldrb	r0, [r0]
	lsl	r0, r0, #0xb
	mov	r1, #0xc0
	lsl	r1, r1, #0x13
	add	r0, r0, r1
	mov	sl, r0
	add	r0, r6, #0
	add	r0, r0, #0x5d
	ldrb	r0, [r0]
	lsl	r0, r0, #0xe
	add	r0, r0, r1
	str	r0, [sp, #0x14]
	ldrb	r1, [r4, #0x4]
	lsr	r1, r1, #0x3
	str	r1, [sp, #0x18]
	ldrb	r2, [r4, #0x5]
	lsr	r2, r2, #0x3
	str	r2, [sp, #0x1c]
	ldrb	r3, [r4, #0x4]
	str	r3, [sp, #0x20]
	add	r0, r6, #0
	add	r0, r0, #0x5e
	ldrb	r0, [r0]
	bl	GetBGLayerCntPtr
	ldrh	r1, [r0]
	mov	r0, #0x80
	and	r0, r0, r1
	cmp	r0, #0
	bne	.L1	@cond_branch
	mov	r0, #0x1
	ldrb	r4, [r4, #0xc]
	and	r0, r0, r4
	cmp	r0, #0
	bne	.L2	@cond_branch
.L1:
	ldr	r0, .L4
	bl	nullsub_8
	b	.L24
.L5:
	.align	2, 0
.L4:
	.4byte	0x875539c
.L2:
	ldr	r7, [sp, #0x4]
	ldr	r1, [r7, #0x4]
	ldr	r0, [sp, #0x10]
	ldr	r2, [sp, #0x20]
	bl	sub_805B3DC
	add	r2, r0, #0
	mov	r0, #0x3
	and	r0, r0, r5
	cmp	r0, #0x1
	beq	.L6	@cond_branch
	cmp	r0, #0x2
	beq	.L7	@cond_branch
	b	.L9
.L6:
	ldr	r0, [sp, #0x8]
	sub	r0, r0, r2
	str	r0, [sp, #0x8]
	b	.L9
.L7:
	asr	r0, r2, #0x1
	ldr	r1, [sp, #0x8]
	sub	r1, r1, r0
	str	r1, [sp, #0x8]
.L9:
	mov	r0, #0x8
	NEG	r0, r0
	ldr	r3, [sp, #0xc]
	and	r0, r0, r3
	lsl	r0, r0, #0x2
	ldr	r7, [sp, #0x8]
	asr	r1, r7, #0x3
	add	r0, r0, r1
	lsl	r0, r0, #0x1
	ADD sl, r0
	ldr	r3, [sp, #0x1c]
	mov	r1, #0x7
	ldr	r0, [sp, #0xc]
	and	r0, r0, r1
	cmp	r0, #0
	beq	.L10	@cond_branch
	add	r3, r3, #0x1
.L10:
	ldr	r0, [sp, #0x8]
	and	r0, r0, r1
	add	r0, r2, r0
	add	r0, r0, #0x8
	asr	r5, r0, #0x3
	ldr	r0, [sp, #0x4]
	ldrh	r0, [r0, #0xe]
	mov	r8, r0
	add	r0, r3, #0
	sub	r3, r3, #0x1
	add	r6, r6, #0x5c
	mov	r9, r6
	ldr	r1, [sp, #0x10]
	add	r1, r1, #0x1
	str	r1, [sp, #0x28]
	cmp	r0, #0
	beq	.L11	@cond_branch
	mov	r0, #0x20
	sub	r0, r0, r5
	lsl	r0, r0, #0x1
	str	r0, [sp, #0x34]
.L15:
	sub	r2, r5, #1
	sub	r4, r3, #1
	cmp	r5, #0
	beq	.L12	@cond_branch
	ldr	r6, .L26
	mov	ip, r6
.L14:
	mov	r7, sl
	ldrh	r0, [r7]
	cmp	r0, #0
	bne	.L13	@cond_branch
	ldr	r1, [sp, #0x4]
	ldrh	r0, [r1, #0xe]
	strh	r0, [r7]
	ldrh	r0, [r1, #0xe]
	add	r0, r0, #0x1
	strh	r0, [r1, #0xe]
.L13:
	mov	r0, ip
	mov	r6, sl
	ldrh	r6, [r6]
	and	r0, r0, r6
	ldr	r7, [sp, #0x4]
	ldrb	r7, [r7, #0xc]
	lsl	r1, r7, #0xc
	orr	r0, r0, r1
	mov	r1, sl
	strh	r0, [r1]
	mov	r6, #0x2
	ADD sl, r6
	add	r0, r2, #0
	sub	r2, r2, #0x1
	cmp	r0, #0
	bne	.L14	@cond_branch
.L12:
	ldr	r7, [sp, #0x34]
	ADD sl, r7
	add	r0, r3, #0
	add	r3, r4, #0
	cmp	r0, #0
	bne	.L15	@cond_branch
.L11:
	ldr	r0, [sp, #0x4]
	ldrh	r0, [r0, #0xe]
	mov	r1, r8
	sub	r4, r0, r1
	cmp	r4, #0
	beq	.L16	@cond_branch
	ldr	r3, .L26 + 4
	ldr	r2, [sp, #0x4]
	ldr	r0, [r2]
	add	r0, r0, #0x5d
	ldrb	r0, [r0]
	lsl	r1, r0, #0xe
	mov	r6, r8
	lsl	r0, r6, #0x5
	mov	r2, #0xc0
	lsl	r2, r2, #0x13
	add	r0, r0, r2
	add	r1, r1, r0
	lsl	r2, r4, #0x5
	ldr	r3, [r3]
	mov	r0, #0x0
	bl	call_via_r3
.L16:
	mov	r7, r9
	ldrb	r7, [r7]
	lsl	r1, r7, #0xb
	mov	r0, #0xc0
	lsl	r0, r0, #0x13
	add	r1, r1, r0
	mov	sl, r1
	ldr	r0, [sp, #0x10]
	ldrb	r4, [r0]
	ldr	r1, [sp, #0x28]
	str	r1, [sp, #0x10]
	cmp	r4, #0
	beq	.L24	@cond_branch
.L25:
	mov	r2, #0x5
	str	r2, [sp, #0x24]
	cmp	r4, #0x20
	bls	.L20	@cond_branch
	ldr	r7, [sp, #0xc]
	ldr	r3, [sp, #0x1c]
	mov	r8, r3
	ldr	r0, .L26 + 8
	add	r0, r4, r0
	ldrb	r4, [r0]
	ldr	r6, [sp, #0x4]
	ldr	r0, [r6, #0x8]
	add	r1, r4, #0
	bl	sub_805B7F0
	add	r6, r0, #0
	ldr	r0, [sp, #0x20]
	str	r0, [sp, #0x24]
	ldr	r1, [sp, #0x4]
	ldr	r0, [r1, #0x4]
	cmp	r0, #0
	beq	.L19	@cond_branch
	add	r0, r0, r4
	ldr	r2, [sp, #0x24]
	ldrb	r0, [r0]
	sub	r2, r2, r0
	str	r2, [sp, #0x24]
.L19:
	mov	r3, #0x1
	NEG	r3, r3
	ADD r8, r3
	ldr	r0, [sp, #0x1c]
	cmp	r0, #0
	beq	.L20	@cond_branch
.L23:
	ldr	r4, [sp, #0x8]
	ldr	r5, [sp, #0x18]
	sub	r5, r5, #0x1
	mov	r1, r8
	sub	r1, r1, #0x1
	str	r1, [sp, #0x2c]
	add	r2, r7, #0
	add	r2, r2, #0x8
	str	r2, [sp, #0x30]
	ldr	r3, [sp, #0x18]
	cmp	r3, #0
	beq	.L21	@cond_branch
	mov	r0, #0x8
	NEG	r0, r0
	and	r0, r0, r7
	lsl	r0, r0, #0x3
	ADD r0, sl
	mov	r9, r0
.L22:
	asr	r0, r4, #0x3
	lsl	r0, r0, #0x1
	ADD r0, r9
	str	r7, [sp]
	ldr	r1, [sp, #0x14]
	add	r2, r6, #0
	add	r3, r4, #0
	bl	sub_805B280
	add	r4, r4, #0x8
	add	r6, r6, #0x20
	add	r0, r5, #0
	sub	r5, r5, #0x1
	cmp	r0, #0
	bne	.L22	@cond_branch
.L21:
	ldr	r7, [sp, #0x30]
	mov	r0, r8
	ldr	r1, [sp, #0x2c]
	mov	r8, r1
	cmp	r0, #0
	bne	.L23	@cond_branch
.L20:
	ldr	r2, [sp, #0x8]
	ldr	r3, [sp, #0x24]
	add	r2, r2, r3
	str	r2, [sp, #0x8]
	cmp	r2, #0xef
	bgt	.L24	@cond_branch
	ldr	r6, [sp, #0x10]
	ldrb	r4, [r6]
	add	r6, r6, #0x1
	str	r6, [sp, #0x10]
	cmp	r4, #0
	bne	.L25	@cond_branch
.L24:
	ldr	r0, [sp, #0x8]
	add	sp, sp, #0x38
	pop	{r3, r4, r5}
	mov	r8, r3
	mov	r9, r4
	mov	sl, r5
	pop	{r4, r5, r6, r7}
	pop	{r1}
	bx	r1
.L27:
	.align	2, 0
.L26:
	.4byte	0xfff
	.4byte	0x807d970
	.4byte	0x807d980
	thumb_func_end sub_805B41C

.align 2, 0 @ Don't pad with nop.
