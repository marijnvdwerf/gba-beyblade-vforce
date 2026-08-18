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
	ldr	r0, .L80605D0
	mov	r1, #0x80
	lsl	r1, r1, #0x4
	str	r1, [r0]
	ldr	r0, .L80605D0 + 4
	mov	r6, #0x0
	str	r6, [r0]
	cmp	r7, #0x80
	bls	.L8060542	@cond_branch
	mov	r7, #0x80
.L8060542:
	mov	r0, r8
	cmp	r0, #0x20
	bls	.L806054C	@cond_branch
	mov	r1, #0x20
	mov	r8, r1
.L806054C:
	ldr	r3, .L80605D0 + 8
	mov	r9, r3
	ldr	r0, [r3]
	cmp	r0, #0
	beq	.L806055E	@cond_branch
	bl	deallocateBlock
	mov	r0, r9
	str	r6, [r0]
.L806055E:
	ldr	r4, .L80605D0 + 12
	ldr	r0, [r4]
	cmp	r0, #0
	beq	.L806056C	@cond_branch
	bl	deallocateBlock
	str	r6, [r4]
.L806056C:
	ldr	r4, .L80605D0 + 16
	ldr	r0, [r4]
	cmp	r0, #0
	beq	.L806057A	@cond_branch
	bl	deallocateBlock
	str	r6, [r4]
.L806057A:
	cmp	r7, #0
	beq	.L8060594	@cond_branch
	mov	r0, #0x34
	mul	r0, r0, r7
	bl	fastAllocate
	mov	r1, r9
	str	r0, [r1]
	cmp	r0, #0
	bne	.L8060594	@cond_branch
	ldr	r0, .L80605D0 + 20
	bl	nullsub_8
.L8060594:
	mov	r3, r8
	cmp	r3, #0
	beq	.L80605B2	@cond_branch
	lsl	r0, r3, #0x3
	sub	r0, r0, r3
	lsl	r0, r0, #0x2
	bl	fastAllocate
	ldr	r1, .L80605D0 + 12
	str	r0, [r1]
	cmp	r0, #0
	bne	.L80605B2	@cond_branch
	ldr	r0, .L80605D0 + 24
	bl	nullsub_8
.L80605B2:
	mov	r0, #0x80
	lsl	r0, r0, #0x1
	bl	fastAllocate
	add	r4, r0, #0
	ldr	r0, .L80605D0 + 16
	str	r4, [r0]
	cmp	r4, #0
	bne	.L80605F4	@cond_branch
	ldr	r0, .L80605D0 + 28
	bl	printf
	ldr	r0, .L80605D0 + 32
	str	r4, [r0]
	b	.L80605FA
.L80605D0:
	.align	2, 0

	.4byte	0x3005e74
	.4byte	0x3005e6c
	.4byte	0x3005de0
	.4byte	0x3005ddc
	.4byte	0x3005dd4
	.4byte	0x875594c
	.4byte	0x8755968
	.4byte	0x875598c
	.4byte	0x3005dcc
.L80605F4:
	ldr	r1, .L806060C
	ldr	r0, [r4]
	str	r0, [r1]
.L80605FA:
	ldr	r0, .L806060C + 4
	ldr	r2, [r0]
	add	r3, r0, #0
	cmp	r2, #0
	beq	.L8060618	@cond_branch
	ldr	r1, .L806060C + 8
	ldr	r0, [r2]
	str	r0, [r1]
	b	.L806061C
.L806060C:
	.align	2, 0

	.4byte	0x3005dcc
	.4byte	0x3005de0
	.4byte	0x3005dd0
.L8060618:
	ldr	r0, .L806062C
	str	r2, [r0]
.L806061C:
	ldr	r0, .L806062C + 4
	ldr	r2, [r0]
	cmp	r2, #0
	beq	.L8060638	@cond_branch
	ldr	r1, .L806062C + 8
	ldr	r0, [r2]
	str	r0, [r1]
	b	.L806063C
.L806062C:
	.align	2, 0

	.4byte	0x3005dd0
	.4byte	0x3005ddc
	.4byte	0x3005df0
.L8060638:
	ldr	r0, .L8060760
	str	r2, [r0]
.L806063C:
	ldr	r0, .L8060760 + 4
	ldr	r4, [r0]
	cmp	r4, #0
	beq	.L8060654	@cond_branch
	ldr	r1, .L8060760 + 8
	ldr	r0, [r3]
	ldr	r2, [r0, #0x4]
	ldr	r3, [r1]
	mov	r0, #0x0
	add	r1, r4, #0
	bl	_call_via_r3
.L8060654:
	ldr	r0, .L8060760
	ldr	r4, [r0]
	mov	r9, r0
	cmp	r4, #0
	beq	.L8060670	@cond_branch
	ldr	r1, .L8060760 + 8
	ldr	r0, .L8060760 + 12
	ldr	r0, [r0]
	ldr	r2, [r0, #0x4]
	ldr	r3, [r1]
	mov	r0, #0x0
	add	r1, r4, #0
	bl	_call_via_r3
.L8060670:
	ldr	r1, .L8060760 + 16
	mov	sl, r1
	cmp	r7, #0
	beq	.L80606C0	@cond_branch
	ldr	r3, .L8060760 + 4
	ldr	r2, [r3]
	mov	r0, r9
	ldr	r5, [r0]
	mov	r4, #0x0
	sub	r1, r7, #2
	mov	r0, #0x1
	NEG	r0, r0
	ldr	r6, .L8060760 + 20
	ldr	r3, .L8060760 + 24
	mov	r9, r3
	ldr	r3, .L8060760 + 28
	mov	ip, r3
	cmp	r1, r0
	beq	.L80606AC	@cond_branch
	add	r3, r0, #0
.L8060698:
	str	r4, [r2]
	add	r0, r2, #0
	add	r0, r0, #0x34
	str	r0, [r2, #0x4]
	str	r3, [r2, #0x24]
	add	r4, r2, #0
	add	r2, r0, #0
	sub	r1, r1, #0x1
	cmp	r1, r3
	bne	.L8060698	@cond_branch
.L80606AC:
	str	r4, [r2]
	mov	r0, #0x0
	str	r0, [r2, #0x4]
	str	r0, [r6]
	ldr	r1, .L8060760 + 4
	ldr	r0, [r1]
	mov	r3, r9
	str	r0, [r3]
	mov	r0, ip
	str	r7, [r0]
.L80606C0:
	mov	r1, r8
	cmp	r1, #0
	beq	.L8060706	@cond_branch
	mov	r4, #0x0
	mov	r2, #0xe0
	lsl	r2, r2, #0x13
	sub	r1, r1, #0x2
	mov	r0, #0x1
	NEG	r0, r0
	ldr	r3, .L8060760
	mov	r9, r3
	ldr	r7, .L8060760 + 32
	ldr	r3, .L8060760 + 36
	cmp	r1, r0
	beq	.L80606F6	@cond_branch
	add	r6, r0, #0
.L80606E0:
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
	bne	.L80606E0	@cond_branch
.L80606F6:
	str	r4, [r5]
	mov	r0, #0x0
	str	r0, [r5, #0x4]
	str	r2, [r5, #0x8]
	str	r0, [r7]
	mov	r1, r9
	ldr	r0, [r1]
	str	r0, [r3]
.L8060706:
	mov	r0, sl
	ldr	r3, [r0]
	cmp	r3, #0
	beq	.L8060740	@cond_branch
	ldr	r0, .L8060760 + 40
	str	r3, [r0]
	ldr	r0, .L8060760 + 44
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
.L806072E:
	add	r2, r0, #0
	add	r2, r2, #0x8
	str	r2, [r0, #0x4]
	add	r0, r2, #0
	sub	r1, r1, #0x1
	cmp	r1, r4
	bne	.L806072E	@cond_branch
	mov	r0, #0x0
	str	r0, [r2, #0x4]
.L8060740:
	mov	r1, #0xe0
	lsl	r1, r1, #0x13
	mov	r2, #0x80
	lsl	r2, r2, #0x3
	ldr	r0, .L8060760 + 8
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
.L8060760:
	.align	2, 0

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
