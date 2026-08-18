	.include "asm/common.inc"

	thumb_func_start sub_804D754
sub_804D754:
	push	{r4, r5, r6, r7, lr}
	mov	r7, r8
	push	{r7}
	add	r5, r0, #0
	ldr	r6, [r5]
	mov	r1, #0x81
	lsl	r1, r1, #0x2
	add	r0, r5, r1
	mov	r2, #0x0
	ldsh	r3, [r0, r2]
	add	r1, r1, #0x2
	add	r0, r5, r1
	mov	r1, #0x0
	ldsh	r2, [r0, r1]
	mov	r8, r2
	mov	r2, #0x0
	mov	r7, #0x1
	NEG	r7, r7
	ldr	r1, [r5, #0x48]
	cmp	r1, #0xc
	ble	.L804D782	@cond_branch
	mov	r2, #0x1
	b	.L804D78C
.L804D782:
	mov	r0, #0xc
	NEG	r0, r0
	cmp	r1, r0
	bge	.L804D78C	@cond_branch
	mov	r2, #0x2
.L804D78C:
	ldr	r1, [r5, #0x4c]
	cmp	r1, #0xc
	ble	.L804D796	@cond_branch
	mov	r0, #0x4
	b	.L804D7A0
.L804D796:
	mov	r0, #0xc
	NEG	r0, r0
	cmp	r1, r0
	bge	.L804D7A2	@cond_branch
	mov	r0, #0x8
.L804D7A0:
	orr	r2, r2, r0
.L804D7A2:
	sub	r0, r2, #1
	cmp	r0, #0x9
	bhi	.L804D7FE	@cond_branch
	lsl	r0, r0, #0x2
	ldr	r1, .L804D7B4
	add	r0, r0, r1
	ldr	r0, [r0]
	mov	pc, r0
.L804D7B2:
	.align	2, 0
.L804D7B4:
	.4byte	.L804D7B8
.L804D7B8:
	.4byte	.L804D7E0
	.4byte	.L804D7EC
	.4byte	.L804D7FE
	.4byte	.L804D7F8
	.4byte	.L804D7E4
	.4byte	.L804D7F4
	.4byte	.L804D7FE
	.4byte	.L804D7FC
	.4byte	.L804D7E8
	.4byte	.L804D7F0
.L804D7E0:
	mov	r7, #0x2
	b	.L804D7FE
.L804D7E4:
	mov	r7, #0x1
	b	.L804D7FE
.L804D7E8:
	mov	r7, #0x3
	b	.L804D7FE
.L804D7EC:
	mov	r7, #0x6
	b	.L804D7FE
.L804D7F0:
	mov	r7, #0x5
	b	.L804D7FE
.L804D7F4:
	mov	r7, #0x7
	b	.L804D7FE
.L804D7F8:
	mov	r7, #0x0
	b	.L804D7FE
.L804D7FC:
	mov	r7, #0x4
.L804D7FE:
	mov	r4, #0x0
	mov	r2, #0x82
	lsl	r2, r2, #0x2
	add	r0, r5, r2
	ldr	r1, [r0]
	ldr	r0, .L804D890
	cmp	r1, r0
	bgt	.L804D810	@cond_branch
	mov	r4, #0x1
.L804D810:
	ldr	r0, .L804D890 + 4
	cmp	r1, r0
	bgt	.L804D818	@cond_branch
	mov	r4, #0x2
.L804D818:
	ldr	r0, .L804D890 + 8
	cmp	r1, r0
	bgt	.L804D820	@cond_branch
	mov	r4, #0x3
.L804D820:
	cmp	r1, #0xff
	bgt	.L804D830	@cond_branch
	mov	r0, #0x80
	lsl	r0, r0, #0x1
	sub	r0, r0, r1
	asr	r0, r0, #0x1
	strh	r0, [r6, #0x36]
	mov	r4, #0x4
.L804D830:
	cmp	r4, r3
	beq	.L804D866	@cond_branch
	cmp	r4, #0x1
	bls	.L804D840	@cond_branch
	mov	r0, #0x80
	lsl	r0, r0, #0x3
	cmp	r4, r0
	bne	.L804D844	@cond_branch
.L804D840:
	mov	r0, #0x1
	NEG	r0, r0
.L804D844:
	add	r1, r6, #0
	add	r1, r1, #0x31
	mov	r0, #0x0
	strb	r0, [r1]
	add	r2, r4, #0
	add	r0, r6, #0
	add	r1, r2, #0
	bl	actor_80580C0
	mov	r1, #0x81
	lsl	r1, r1, #0x2
	add	r0, r5, r1
	strh	r4, [r0]
	ldr	r2, .L804D890 + 12
	add	r1, r5, r2
	ldr	r0, .L804D890 + 16
	strh	r0, [r1]
.L804D866:
	cmp	r4, #0x1
	bhi	.L804D8C6	@cond_branch
	cmp	r7, r8
	beq	.L804D8C6	@cond_branch
	cmp	r7, #0
	blt	.L804D8A4	@cond_branch
	add	r1, r6, #0
	add	r1, r1, #0x31
	mov	r0, #0x0
	strb	r0, [r1]
	lsl	r2, r7, #0x10
	lsr	r2, r2, #0x10
	add	r0, r6, #0
	mov	r1, #0x5
	mov	r3, #0x0
	bl	sub_8058390
	ldr	r1, .L804D890 + 12
	add	r0, r5, r1
	strh	r7, [r0]
	b	.L804D8C6
.L804D890:
	.align	2, 0

	.4byte	0x8ff
	.4byte	0x3ff
	.4byte	0x1ff
	.4byte	0x206
	.4byte	0xffff
.L804D8A4:
	add	r1, r6, #0
	add	r1, r1, #0x31
	mov	r0, #0x0
	strb	r0, [r1]
	add	r0, r6, #0
	add	r1, r4, #0
	add	r2, r4, #0
	bl	actor_80580C0
	mov	r2, #0x81
	lsl	r2, r2, #0x2
	add	r0, r5, r2
	strh	r4, [r0]
	ldr	r0, .L804D8D0
	add	r1, r5, r0
	ldr	r0, .L804D8D0 + 4
	strh	r0, [r1]
.L804D8C6:
	pop	{r3}
	mov	r8, r3
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L804D8D0:
	.align	2, 0

	.4byte	0x206
	.4byte	0xffff
	thumb_func_end sub_804D754

.align 2, 0 @ Don't pad with nop.
