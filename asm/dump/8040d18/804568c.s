	.include "asm/common.inc"

	thumb_func_start sub_804568C
sub_804568C:
	push	{r4, r5, r6, lr}
	cmp	r1, #0x1
	beq	.L1	@cond_branch
	cmp	r1, #0x1
	bcc	.L2	@cond_branch
	cmp	r1, #0x2
	bne	.L3	@cond_branch
	b	.L4
.L3:
	cmp	r1, #0x7
	bne	.L5	@cond_branch
	b	.L18
.L5:
	b	.L23
.L2:
	bl	sub_8049168
	ldr	r0, .L9
	ldr	r1, .L9 + 4
	bl	sub_8057158
	ldr	r0, .L9 + 8
	ldr	r1, .L9 + 12
	bl	sub_8057158
	ldr	r0, .L9 + 16
	ldr	r1, .L9 + 20
	bl	sub_8057158
	ldr	r0, .L9 + 24
	ldr	r1, .L9 + 28
	bl	sub_8057158
	ldr	r0, .L9 + 32
	ldr	r1, .L9 + 36
	bl	sub_8057158
	b	.L23
.L10:
	.align	2, 0
.L9:
	.4byte	0x3000380
	.4byte	0x80693a0
	.4byte	0x3000388
	.4byte	0x8069378
	.4byte	0x3000390
	.4byte	0x806938c
	.4byte	0x3000398
	.4byte	0x80693b4
	.4byte	0x30003a0
	.4byte	0x80693c8
.L1:
	ldr	r4, .L20
	add	r0, r4, #0
	bl	sub_8057164
	add	r0, r4, #0
	bl	sub_80571D0
	lsl	r0, r0, #0x18
	cmp	r0, #0
	beq	.L11	@cond_branch
	mov	r4, #0x0
	mov	r5, #0x2
.L12:
	add	r0, r4, #0
	bl	sub_8051720
	ldrh	r1, [r0]
	orr	r1, r1, r5
	strh	r1, [r0]
	add	r4, r4, #0x1
	cmp	r4, #0x37
	ble	.L12	@cond_branch
	mov	r0, #0x8
	bl	sub_804ABFC
.L11:
	ldr	r4, .L20 + 4
	add	r0, r4, #0
	bl	sub_8057164
	add	r0, r4, #0
	bl	sub_80571D0
	lsl	r0, r0, #0x18
	cmp	r0, #0
	beq	.L13	@cond_branch
	ldr	r0, .L20 + 8
	ldr	r1, [r0]
	ldr	r0, .L20 + 12
	add	r1, r1, r0
	ldr	r0, [r1]
	mov	r2, #0x1
	orr	r0, r0, r2
	str	r0, [r1]
	mov	r0, #0x8
	bl	sub_804ABFC
.L13:
	ldr	r4, .L20 + 16
	add	r0, r4, #0
	bl	sub_8057164
	add	r0, r4, #0
	bl	sub_80571D0
	lsl	r0, r0, #0x18
	cmp	r0, #0
	beq	.L14	@cond_branch
	mov	r4, #0x0
.L15:
	add	r0, r4, #0
	mov	r1, #0x1
	bl	sub_8057104
	add	r4, r4, #0x1
	cmp	r4, #0x6c
	ble	.L15	@cond_branch
	mov	r0, #0x8
	bl	sub_804ABFC
.L14:
	ldr	r4, .L20 + 20
	add	r0, r4, #0
	bl	sub_8057164
	add	r0, r4, #0
	bl	sub_80571D0
	lsl	r0, r0, #0x18
	cmp	r0, #0
	beq	.L16	@cond_branch
	ldr	r0, .L20 + 8
	ldr	r1, [r0]
	ldr	r3, .L20 + 12
	add	r1, r1, r3
	ldr	r0, [r1]
	mov	r2, #0x2
	orr	r0, r0, r2
	str	r0, [r1]
	mov	r0, #0x8
	bl	sub_804ABFC
.L16:
	ldr	r4, .L20 + 24
	add	r0, r4, #0
	bl	sub_8057164
	add	r0, r4, #0
	bl	sub_80571D0
	lsl	r0, r0, #0x18
	cmp	r0, #0
	beq	.L17	@cond_branch
	ldr	r0, .L20 + 8
	ldr	r1, [r0]
	ldr	r0, .L20 + 12
	add	r1, r1, r0
	ldr	r0, [r1]
	mov	r2, #0x4
	orr	r0, r0, r2
	str	r0, [r1]
	mov	r0, #0x8
	bl	sub_804ABFC
.L17:
	bl	sub_8057C40
	asr	r0, r0, #0x8
	mov	r1, #0x1
	and	r0, r0, r1
	cmp	r0, #0
	bne	.L18	@cond_branch
	mov	r2, #0x80
	lsl	r2, r2, #0x13
	ldrh	r1, [r2]
	ldr	r0, .L20 + 28
	and	r0, r0, r1
	strh	r0, [r2]
	b	.L23
.L21:
	.align	2, 0
.L20:
	.4byte	0x3000380
	.4byte	0x3000388
	.4byte	0x3000f48
	.4byte	0xc64
	.4byte	0x3000390
	.4byte	0x3000398
	.4byte	0x30003a0
	.4byte	0xefff
.L4:
	ldr	r1, .L24
	mov	r0, #0x9
	ldrh	r1, [r1]
	and	r0, r0, r1
	cmp	r0, #0
	beq	.L23	@cond_branch
	mov	r0, #0xa
	bl	sub_804924C
	mov	r0, #0x8
	bl	sub_80490F8
	b	.L23
.L25:
	.align	2, 0
.L24:
	.4byte	0x3005da0
.L18:
	mov	r0, #0x80
	lsl	r0, r0, #0x13
	ldrh	r1, [r0]
	mov	r3, #0x80
	lsl	r3, r3, #0x5
	add	r2, r3, #0
	orr	r1, r1, r2
	strh	r1, [r0]
.L23:
	pop	{r4, r5, r6}
	pop	{r0}
	bx	r0
	thumb_func_end sub_804568C

.align 2, 0 @ Don't pad with nop.
