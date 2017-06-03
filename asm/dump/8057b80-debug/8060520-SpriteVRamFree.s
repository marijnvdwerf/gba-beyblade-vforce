	.include "asm/common.inc"

	thumb_func_start SpriteVRamFree
SpriteVRamFree:
	push	{r4, r5, r6, r7, lr}
	mov	r7, sl
	mov	r6, r9
	mov	r5, r8
	push	{r5, r6, r7}
	add	r7, r0, #0
	mov	r8, r1
	ldr	r0, .L12
	mov	r1, #0x80
	lsl	r1, r1, #0x4
	str	r1, [r0]
	ldr	r0, .L12 + 4
	mov	r6, #0x0
	str	r6, [r0]
	cmp	r7, #0x80
	bls	.L1	@cond_branch
	mov	r7, #0x80
.L1:
	mov	r0, r8
	cmp	r0, #0x20
	bls	.L2	@cond_branch
	mov	r1, #0x20
	mov	r8, r1
.L2:
	ldr	r3, .L12 + 8
	mov	r9, r3
	ldr	r0, [r3]
	cmp	r0, #0
	beq	.L3	@cond_branch
	bl	deallocateBlock
	mov	r0, r9
	str	r6, [r0]
.L3:
	ldr	r4, .L12 + 12
	ldr	r0, [r4]
	cmp	r0, #0
	beq	.L4	@cond_branch
	bl	deallocateBlock
	str	r6, [r4]
.L4:
	ldr	r4, .L12 + 16
	ldr	r0, [r4]
	cmp	r0, #0
	beq	.L5	@cond_branch
	bl	deallocateBlock
	str	r6, [r4]
.L5:
	cmp	r7, #0
	beq	.L7	@cond_branch
	mov	r0, #0x34
	mul	r0, r0, r7
	bl	fastAllocate
	mov	r1, r9
	str	r0, [r1]
	cmp	r0, #0
	bne	.L7	@cond_branch
	ldr	r0, .L12 + 20
	bl	nullsub_8
.L7:
	mov	r3, r8
	cmp	r3, #0
	beq	.L9	@cond_branch
	lsl	r0, r3, #0x3
	sub	r0, r0, r3
	lsl	r0, r0, #0x2
	bl	fastAllocate
	ldr	r1, .L12 + 12
	str	r0, [r1]
	cmp	r0, #0
	bne	.L9	@cond_branch
	ldr	r0, .L12 + 24
	bl	nullsub_8
.L9:
	mov	r0, #0x80
	lsl	r0, r0, #0x1
	bl	fastAllocate
	add	r4, r0, #0
	ldr	r0, .L12 + 16
	str	r4, [r0]
	cmp	r4, #0
	bne	.L10	@cond_branch
	ldr	r0, .L12 + 28
	bl	printf
	ldr	r0, .L12 + 32
	str	r4, [r0]
	b	.L11
.L13:
	.align	2, 0
.L12:
	.4byte	0x3005e74
	.4byte	0x3005e6c
	.4byte	0x3005de0
	.4byte	0x3005ddc
	.4byte	0x3005dd4
	.4byte	0x875594c
	.4byte	0x8755968
	.4byte	0x875598c
	.4byte	0x3005dcc
.L10:
	ldr	r1, .L16
	ldr	r0, [r4]
	str	r0, [r1]
.L11:
	ldr	r0, .L16 + 4
	ldr	r2, [r0]
	add	r3, r0, #0
	cmp	r2, #0
	beq	.L14	@cond_branch
	ldr	r1, .L16 + 8
	ldr	r0, [r2]
	str	r0, [r1]
	b	.L15
.L17:
	.align	2, 0
.L16:
	.4byte	0x3005dcc
	.4byte	0x3005de0
	.4byte	0x3005dd0
.L14:
	ldr	r0, .L20
	str	r2, [r0]
.L15:
	ldr	r0, .L20 + 4
	ldr	r2, [r0]
	cmp	r2, #0
	beq	.L18	@cond_branch
	ldr	r1, .L20 + 8
	ldr	r0, [r2]
	str	r0, [r1]
	b	.L19
.L21:
	.align	2, 0
.L20:
	.4byte	0x3005dd0
	.4byte	0x3005ddc
	.4byte	0x3005df0
.L18:
	ldr	r0, .L32
	str	r2, [r0]
.L19:
	ldr	r0, .L32 + 4
	ldr	r4, [r0]
	cmp	r4, #0
	beq	.L22	@cond_branch
	ldr	r1, .L32 + 8
	ldr	r0, [r3]
	ldr	r2, [r0, #0x4]
	ldr	r3, [r1]
	mov	r0, #0x0
	add	r1, r4, #0
	bl	_call_via_r3
.L22:
	ldr	r0, .L32
	ldr	r4, [r0]
	mov	r9, r0
	cmp	r4, #0
	beq	.L23	@cond_branch
	ldr	r1, .L32 + 8
	ldr	r0, .L32 + 12
	ldr	r0, [r0]
	ldr	r2, [r0, #0x4]
	ldr	r3, [r1]
	mov	r0, #0x0
	add	r1, r4, #0
	bl	_call_via_r3
.L23:
	ldr	r1, .L32 + 16
	mov	sl, r1
	cmp	r7, #0
	beq	.L24	@cond_branch
	ldr	r3, .L32 + 4
	ldr	r2, [r3]
	mov	r0, r9
	ldr	r5, [r0]
	mov	r4, #0x0
	sub	r1, r7, #2
	mov	r0, #0x1
	NEG	r0, r0
	ldr	r6, .L32 + 20
	ldr	r3, .L32 + 24
	mov	r9, r3
	ldr	r3, .L32 + 28
	mov	ip, r3
	cmp	r1, r0
	beq	.L25	@cond_branch
	add	r3, r0, #0
.L26:
	str	r4, [r2]
	add	r0, r2, #0
	add	r0, r0, #0x34
	str	r0, [r2, #0x4]
	str	r3, [r2, #0x24]
	add	r4, r2, #0
	add	r2, r0, #0
	sub	r1, r1, #0x1
	cmp	r1, r3
	bne	.L26	@cond_branch
.L25:
	str	r4, [r2]
	mov	r0, #0x0
	str	r0, [r2, #0x4]
	str	r0, [r6]
	ldr	r1, .L32 + 4
	ldr	r0, [r1]
	mov	r3, r9
	str	r0, [r3]
	mov	r0, ip
	str	r7, [r0]
.L24:
	mov	r1, r8
	cmp	r1, #0
	beq	.L27	@cond_branch
	mov	r4, #0x0
	mov	r2, #0xe0
	lsl	r2, r2, #0x13
	sub	r1, r1, #0x2
	mov	r0, #0x1
	NEG	r0, r0
	ldr	r3, .L32
	mov	r9, r3
	ldr	r7, .L32 + 32
	ldr	r3, .L32 + 36
	cmp	r1, r0
	beq	.L28	@cond_branch
	add	r6, r0, #0
.L29:
	str	r4, [r5]
	add	r0, r5, #0
	add	r0, r0, #0x1c
	str	r0, [r5, #0x4]
	str	r2, [r5, #0x8]
	add	r2, r2, #0x20
	add	r4, r5, #0
	add	r5, r0, #0
	sub	r1, r1, #0x1
	cmp	r1, r6
	bne	.L29	@cond_branch
.L28:
	str	r4, [r5]
	mov	r0, #0x0
	str	r0, [r5, #0x4]
	str	r2, [r5, #0x8]
	str	r0, [r7]
	mov	r1, r9
	ldr	r0, [r1]
	str	r0, [r3]
.L27:
	mov	r0, sl
	ldr	r3, [r0]
	cmp	r3, #0
	beq	.L30	@cond_branch
	ldr	r0, .L32 + 40
	str	r3, [r0]
	ldr	r0, .L32 + 44
	add	r2, r3, #0
	add	r2, r2, #0x8
	str	r2, [r0]
	mov	r1, #0x0
	strh	r1, [r3]
	mov	r0, #0x80
	lsl	r0, r0, #0x3
	strh	r0, [r3, #0x2]
	str	r1, [r3, #0x4]
	add	r0, r2, #0
	mov	r1, #0x1d
	mov	r4, #0x1
	NEG	r4, r4
.L31:
	add	r2, r0, #0
	add	r2, r2, #0x8
	str	r2, [r0, #0x4]
	add	r0, r2, #0
	sub	r1, r1, #0x1
	cmp	r1, r4
	bne	.L31	@cond_branch
	mov	r0, #0x0
	str	r0, [r2, #0x4]
.L30:
	mov	r1, #0xe0
	lsl	r1, r1, #0x13
	mov	r2, #0x80
	lsl	r2, r2, #0x3
	ldr	r0, .L32 + 8
	ldr	r3, [r0]
	mov	r0, #0xa0
	bl	_call_via_r3
	pop	{r3, r4, r5}
	mov	r8, r3
	mov	r9, r4
	mov	sl, r5
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L33:
	.align	2, 0
.L32:
	.4byte	0x3005df0
	.4byte	0x3005dd0
	.4byte	0x807d970
	.4byte	0x3005ddc
	.4byte	0x3005dcc
	.4byte	0x3005de4
	.4byte	0x3005dec
	.4byte	0x3005df4
	.4byte	0x3005df8
	.4byte	0x3005de8
	.4byte	0x3005dc8
	.4byte	0x3005dd8
	thumb_func_end SpriteVRamFree

.align 2, 0 @ Don't pad with nop.
