	.include "asm/common.inc"

	thumb_func_start sub_8063F84
sub_8063F84:
	push	{r4, r5, r6, r7, lr}
	mov	r7, r9
	mov	r6, r8
	push	{r6, r7}
	add	sp, sp, #0xfffffffc
	add	r4, r0, #0
	add	r1, r4, #0
	add	r1, r1, #0xba
	ldrh	r0, [r1]
	cmp	r0, #0
	bne	.L1	@cond_branch
	mov	r0, #0x8
	strh	r0, [r1]
.L1:
	mov	r0, #0x8
	ldrh	r2, [r1]
	and	r0, r0, r2
	mov	r8, r1
	cmp	r0, #0
	beq	.L2	@cond_branch
	mov	r6, #0x1
	mov	r5, r8
	add	r7, r4, #0
	add	r7, r7, #0xac
.L27:
	ldr	r0, [r4]
	ldrb	r1, [r0]
	add	r2, r1, #0
	add	r3, r0, #0
	cmp	r1, #0x20
	beq	.L5	@cond_branch
	cmp	r1, #0x20
	bgt	.L4	@cond_branch
	cmp	r1, #0x9
	beq	.L5	@cond_branch
	cmp	r1, #0x9
	bgt	.L6	@cond_branch
	cmp	r1, #0
	beq	.L7	@cond_branch
	b	.L13
.L6:
	cmp	r1, #0xa
	beq	.L9	@cond_branch
	cmp	r1, #0xc
	beq	.L10	@cond_branch
	b	.L13
.L4:
	cmp	r2, #0x7b
	beq	.L12	@cond_branch
	b	.L13
.L7:
	mov	r6, #0x0
	mov	r0, #0x2
	ldrh	r1, [r5]
	b	.L22
.L9:
	add	r0, r4, #0
	add	r0, r0, #0xe4
	ldr	r2, [r0]
	cmp	r2, #0
	beq	.L15	@cond_branch
	sub	r0, r0, #0x26
	ldrb	r1, [r0]
	add	r0, r4, #0
	bl	_call_via_r2
.L15:
	add	r0, r4, #0
	bl	sub_8063CD0
	b	.L20
.L5:
	ldrb	r2, [r4, #0xc]
	lsl	r0, r2, #0x8
	ldr	r1, [r7]
	add	r1, r1, r0
	str	r1, [r7]
	add	r0, r3, #1
	str	r0, [r4]
	b	.L20
.L12:
	mov	r1, sp
	bl	sub_8063D38
	str	r0, [r4]
	add	r0, r4, #0
	add	r0, r0, #0xdc
	ldr	r2, [r0]
	cmp	r2, #0
	beq	.L20	@cond_branch
	ldr	r1, [sp]
	add	r0, r4, #0
	bl	_call_via_r2
	b	.L20
.L10:
	mov	r6, #0x0
	add	r0, r4, #0
	bl	sub_8064140
	b	.L20
.L13:
	add	r0, r4, #0
	bl	sub_8063BA8
	mov	r6, #0x0
	add	r0, r4, #0
	add	r0, r0, #0xc0
	ldrb	r1, [r4, #0x12]
	ldrb	r0, [r0]
	add	r0, r1, r0
	ldrb	r2, [r4, #0x11]
	cmp	r0, r2
	ble	.L21	@cond_branch
	ldr	r1, .L23
	add	r0, r1, #0
	ldrh	r2, [r5]
	and	r0, r0, r2
	mov	r1, #0x4
	b	.L22
.L24:
	.align	2, 0
.L23:
	.4byte	0xfff7
.L21:
	add	r0, r4, #0
	add	r0, r0, #0xb4
	ldr	r1, [r7]
	ldr	r0, [r0]
	add	r1, r1, r0
	add	r0, r4, #0
	add	r0, r0, #0xa4
	ldr	r0, [r0]
	cmp	r1, r0
	ble	.L25	@cond_branch
	add	r0, r4, #0
	add	r0, r0, #0xe4
	ldr	r2, [r0]
	cmp	r2, #0
	beq	.L26	@cond_branch
	sub	r0, r0, #0x26
	ldrb	r1, [r0]
	add	r0, r4, #0
	bl	_call_via_r2
.L26:
	add	r0, r4, #0
	bl	sub_8063CD0
.L25:
	ldr	r1, .L31
	add	r0, r1, #0
	ldrh	r2, [r5]
	and	r0, r0, r2
	mov	r1, #0x10
.L22:
	orr	r0, r0, r1
	strh	r0, [r5]
.L20:
	cmp	r6, #0
	bne	.L27	@cond_branch
.L2:
	mov	r0, #0x10
	mov	r1, r8
	ldrh	r1, [r1]
	and	r0, r0, r1
	cmp	r0, #0
	beq	.L30	@cond_branch
	add	r0, r4, #0
	add	r0, r0, #0xe0
	ldr	r2, [r0]
	cmp	r2, #0
	beq	.L29	@cond_branch
	add	r1, r4, #0
	add	r1, r1, #0x1c
	add	r0, r4, #0
	bl	_call_via_r2
.L29:
	add	r0, r4, #0
	bl	sub_8063B44
	lsl	r0, r0, #0x18
	cmp	r0, #0
	beq	.L30	@cond_branch
	ldr	r0, .L31 + 4
	mov	r2, r8
	ldrh	r2, [r2]
	and	r0, r0, r2
	mov	r1, #0x8
	orr	r0, r0, r1
	mov	r1, r8
	strh	r0, [r1]
.L30:
	add	sp, sp, #0x4
	pop	{r3, r4}
	mov	r8, r3
	mov	r9, r4
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L32:
	.align	2, 0
.L31:
	.4byte	0xfff7
	.4byte	0xffef
	thumb_func_end sub_8063F84

.align 2, 0 @ Don't pad with nop.
