	.include "asm/common.inc"

	thumb_func_start creditsFrontendHandler
creditsFrontendHandler:
	push	{r4, r5, r6, r7, lr}
	mov	r7, sl
	mov	r6, r9
	mov	r5, r8
	push	{r5, r6, r7}
	add	sp, sp, #0xfffffff4
	mov	sl, r0
	cmp	r1, #0x1
	beq	.L1	@cond_branch
	cmp	r1, #0x1
	bcc	.L2	@cond_branch
	b	.L38
.L2:
	ldr	r0, .L5
	ldr	r1, .L5 + 4
	str	r1, [r0]
	ldr	r0, .L5 + 8
	mov	r4, #0x0
	str	r4, [r0]
	mov	r0, #0x94
	lsl	r0, r0, #0x2
	ADD r0, sl
	mov	r2, #0x0
	bl	sub_80596AC
	ldr	r0, .L5 + 12
	str	r4, [r0]
	ldr	r0, .L5 + 16
	strb	r4, [r0]
	ldr	r0, .L5 + 20
	strb	r4, [r0]
	ldr	r0, .L5 + 24
	str	r4, [r0]
	ldr	r1, .L5 + 28
	ldr	r0, .L5 + 32
	str	r0, [r1]
	ldr	r0, .L5 + 36
	str	r4, [r0]
	ldr	r0, .L5 + 40
	str	r4, [r0]
	ldr	r0, .L5 + 44
	str	r4, [r0]
	ldr	r0, .L5 + 48
	str	r4, [r0]
	ldr	r0, .L5 + 52
	str	r4, [r0]
	b	.L38
.L6:
	.align	2, 0
.L5:
	.4byte	0x3000004
	.4byte	0xffff0000
	.4byte	0x3000000
	.4byte	0x3000008
	.4byte	0x3000020
	.4byte	0x3000021
	.4byte	0x3000018
	.4byte	0x300001c
	.4byte	0x8067d64
	.4byte	0x300000c
	.4byte	0x3000010
	.4byte	0x3000014
	.4byte	0x3000024
	.4byte	0x3000028
.L1:
	ldr	r0, .L10
	ADD r0, sl
	ldrh	r0, [r0]
	ldr	r3, .L10 + 4
	cmp	r0, #0
	bne	.L14	@cond_branch
	ldr	r1, .L10 + 8
	mov	r2, #0xf4
	lsl	r2, r2, #0x4
	add	r0, r2, #0
	strh	r0, [r1]
	ldr	r3, .L10 + 12
	ldr	r2, .L10 + 16
	ldr	r1, [r2]
	mov	r0, #0x10
	sub	r0, r0, r1
	lsl	r0, r0, #0x8
	orr	r1, r1, r0
	strh	r1, [r3]
	ldr	r3, .L10 + 20
	ldr	r1, [r3]
	cmp	r1, #0
	beq	.L8	@cond_branch
	sub	r0, r1, #1
	str	r0, [r3]
	ldr	r0, .L10 + 24
	b	.L9
.L11:
	.align	2, 0
.L10:
	.4byte	0x584
	.4byte	0x3000020
	.4byte	0x4000050
	.4byte	0x4000052
	.4byte	0x300000c
	.4byte	0x3000014
	.4byte	0x3000010
.L8:
	ldr	r0, .L23
	str	r1, [r0]
.L9:
	ldr	r1, [r2]
	ldr	r0, [r0]
	cmp	r1, r0
	beq	.L12	@cond_branch
	sub	r3, r1, #1
	cmp	r0, r1
	ble	.L13	@cond_branch
	add	r3, r1, #1
.L13:
	str	r3, [r2]
.L12:
	ldr	r0, [r2]
	ldr	r3, .L23 + 4
	cmp	r0, #0
	bne	.L14	@cond_branch
	mov	r0, #0x1
	strb	r0, [r3]
.L14:
	ldrb	r0, [r3]
	ldr	r2, .L23 + 8
	cmp	r0, #0
	beq	.L16	@cond_branch
	ldr	r0, .L23 + 12
	ldr	r1, [r0]
	mov	r0, #0x1
	ldrh	r1, [r1, #0x4]
	and	r0, r0, r1
	cmp	r0, #0
	beq	.L16	@cond_branch
	mov	r0, #0x1
	strb	r0, [r2]
.L16:
	ldr	r1, .L23 + 16
	mov	r0, #0xb
	ldrh	r1, [r1]
	and	r0, r0, r1
	cmp	r0, #0
	beq	.L18	@cond_branch
	ldr	r0, .L23 + 20
	ADD r0, sl
	ldrb	r0, [r0]
	lsl	r0, r0, #0x18
	asr	r0, r0, #0x18
	cmp	r0, #0
	bne	.L18	@cond_branch
	mov	r0, #0x1
	strb	r0, [r2]
.L18:
	ldrb	r0, [r2]
	cmp	r0, #0
	beq	.L20	@cond_branch
	ldr	r0, .L23 + 24
	ldr	r0, [r0]
	cmp	r0, #0
	beq	.L20	@cond_branch
	mov	r0, #0x1
	strb	r0, [r2]
	bl	sub_804915C
	cmp	r0, #0x8
	bne	.L21	@cond_branch
	mov	r0, #0xa
	bl	sub_80490F8
	b	.L22
.L24:
	.align	2, 0
.L23:
	.4byte	0x3000010
	.4byte	0x3000020
	.4byte	0x3000021
	.4byte	0x300001c
	.4byte	0x3005da0
	.4byte	0x584
	.4byte	0x3000008
.L21:
	bl	sub_8049178
.L22:
	ldr	r1, .L39
	ldr	r0, .L39 + 4
	str	r0, [r1]
	ldr	r2, .L39 + 8
	ldr	r0, [r2]
	add	r1, r0, #0
	sub	r0, r0, #0x1
	str	r0, [r2]
	cmp	r1, #0
	beq	.L25	@cond_branch
	ldr	r4, .L39 + 12
	add	r5, r2, #0
.L26:
	ldr	r0, [r4]
	bl	sub_8061204
	ldr	r0, [r4]
	add	r0, r0, #0x30
	str	r0, [r4]
	ldr	r0, [r5]
	add	r1, r0, #0
	sub	r0, r0, #0x1
	str	r0, [r5]
	cmp	r1, #0
	bne	.L26	@cond_branch
.L25:
	ldr	r0, .L39 + 8
	mov	r4, #0x0
	str	r4, [r0]
	ldr	r5, .L39 + 16
	ldr	r0, [r5]
	cmp	r0, #0
	beq	.L27	@cond_branch
	bl	deallocateBlock
.L27:
	str	r4, [r5]
	ldr	r0, .L39 + 20
	strb	r4, [r0]
	add	r3, r0, #0
.L20:
	ldrb	r0, [r3]
	cmp	r0, #0
	bne	.L28	@cond_branch
	b	.L29
.L28:
	ldr	r2, .L39 + 8
	ldr	r0, [r2]
	add	r1, r0, #0
	sub	r0, r0, #0x1
	str	r0, [r2]
	cmp	r1, #0
	beq	.L30	@cond_branch
	ldr	r4, .L39 + 12
	add	r5, r2, #0
.L31:
	ldr	r0, [r4]
	bl	sub_8061204
	ldr	r0, [r4]
	add	r0, r0, #0x30
	str	r0, [r4]
	ldr	r0, [r5]
	add	r1, r0, #0
	sub	r0, r0, #0x1
	str	r0, [r5]
	cmp	r1, #0
	bne	.L31	@cond_branch
.L30:
	ldr	r0, .L39 + 16
	ldr	r0, [r0]
	cmp	r0, #0
	beq	.L32	@cond_branch
	bl	deallocateBlock
.L32:
	ldr	r3, .L39 + 8
	mov	r0, #0x0
	str	r0, [r3]
	mov	r5, #0x0
	ldr	r1, .L39 + 24
	ldr	r2, .L39 + 28
	ldr	r0, [r2]
	str	r0, [r1]
	ldr	r0, [r0]
	mov	r8, r3
	cmp	r0, #0
	beq	.L33	@cond_branch
	add	r4, r2, #0
.L34:
	ldr	r1, [r4]
	ldrh	r0, [r1, #0x6]
	add	r5, r0, r5
	add	r0, r1, #0
	add	r0, r0, #0xc
	str	r0, [r4]
	ldr	r0, [r3]
	add	r0, r0, #0x1
	str	r0, [r3]
	ldr	r0, [r1, #0xc]
	cmp	r0, #0
	bne	.L34	@cond_branch
.L33:
	ldr	r0, [r2]
	add	r0, r0, #0xc
	str	r0, [r2]
	mov	r2, r8
	ldr	r1, [r2]
	lsl	r0, r1, #0x1
	add	r0, r0, r1
	lsl	r0, r0, #0x4
	bl	slowAllocate
	ldr	r4, .L39 + 16
	str	r0, [r4]
	cmp	r0, #0
	bne	.L35	@cond_branch
	ldr	r0, .L39 + 32
	bl	printf
.L35:
	ldr	r2, .L39 + 12
	ldr	r0, [r4]
	ldr	r0, [r0]
	str	r0, [r2]
	asr	r1, r5, #0x1
	mov	r0, #0x50
	sub	r6, r0, r1
	mov	r7, #0x0
	mov	r1, r8
	ldr	r0, [r1]
	cmp	r7, r0
	bge	.L36	@cond_branch
	mov	r8, r2
	ldr	r2, .L39 + 24
	mov	r9, r2
	mov	r5, #0x0
	mov	r4, #0x0
.L37:
	mov	r1, r8
	ldr	r0, [r1]
	add	r0, r0, r4
	lsl	r1, r6, #0x10
	asr	r1, r1, #0x10
	str	r1, [sp]
	mov	r1, #0xf0
	str	r1, [sp, #0x4]
	mov	r1, #0x2
	str	r1, [sp, #0x8]
	ldr	r1, .L39 + 36
	ldr	r2, .L39 + 40
	mov	r3, #0x0
	bl	allocFont
	mov	r2, r8
	ldr	r0, [r2]
	add	r0, r0, r4
	mov	r1, r9
	ldr	r2, [r1]
	add	r2, r5, r2
	ldr	r1, [r2]
	ldrb	r2, [r2, #0x8]
	bl	sub_8061660
	mov	r2, r8
	ldr	r0, [r2]
	add	r0, r0, r4
	mov	r1, #0x1
	bl	sub_8061E58
	mov	r1, r9
	ldr	r0, [r1]
	add	r0, r5, r0
	ldrh	r0, [r0, #0x6]
	add	r6, r0, r6
	add	r5, r5, #0xc
	add	r4, r4, #0x30
	add	r7, r7, #0x1
	ldr	r0, .L39 + 8
	ldr	r0, [r0]
	cmp	r7, r0
	blt	.L37	@cond_branch
.L36:
	ldr	r1, .L39 + 44
	mov	r0, #0x10
	str	r0, [r1]
	ldr	r1, .L39 + 48
	mov	r0, #0x78
	str	r0, [r1]
	ldr	r1, .L39 + 20
	mov	r0, #0x0
	strb	r0, [r1]
.L29:
	mov	r0, #0xa0
	lsl	r0, r0, #0x1
	ADD r0, sl
	bl	sub_80439A0
	ldr	r0, .L39
	ldr	r5, .L39 + 52
	ldr	r4, [r0]
	ldr	r0, [r5]
	cmp	r4, r0
	beq	.L38	@cond_branch
	sub	r4, r4, r0
	asr	r4, r4, #0x2
	mov	r0, #0x94
	lsl	r0, r0, #0x2
	ADD r0, sl
	add	r1, r4, #0
	mov	r2, #0x0
	bl	sub_80596AC
	ldr	r0, [r5]
	add	r0, r0, r4
	str	r0, [r5]
.L38:
	add	sp, sp, #0xc
	pop	{r3, r4, r5}
	mov	r8, r3
	mov	r9, r4
	mov	sl, r5
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L40:
	.align	2, 0
.L39:
	.4byte	0x3000000
	.4byte	0xffff0000
	.4byte	0x3000008
	.4byte	0x3000028
	.4byte	0x3000024
	.4byte	0x3000020
	.4byte	0x3000018
	.4byte	0x300001c
	.4byte	0x86fced8
	.4byte	0x82b05ec
	.4byte	0x8067ae0
	.4byte	0x3000010
	.4byte	0x3000014
	.4byte	0x3000004
	thumb_func_end creditsFrontendHandler

.align 2, 0 @ Don't pad with nop.
