	.include "asm/common.inc"

	thumb_func_start allocateSoundTables
allocateSoundTables:
	push	{r4, r5, r6, r7, lr}
	mov	r7, sl
	mov	r6, r9
	mov	r5, r8
	push	{r5, r6, r7}
	add	sp, sp, #0xfffffffc
	mov	r8, r0
	add	r4, r1, #0
	bl	sub_806234C
	cmp	r4, #0x10
	bls	.L1	@cond_branch
	mov	r4, #0x10
.L1:
	ldr	r0, .L5
	cmp	r8, r0
	bls	.L2	@cond_branch
	mov	r8, r0
.L2:
	ldr	r1, .L5 + 4
	mov	r0, r8
	str	r0, [r1]
	mov	r0, #0x1
	str	r0, [r1, #0x4]
	mov	r2, #0x0
	str	r2, [r1, #0x8]
	ldr	r6, .L5 + 8
	mov	r9, r6
	mov	r0, r8
	mov	r1, #0x28
	bl	sub_80661C0
	add	r0, r0, #0xf
	ldr	r2, .L5 + 12
	add	r1, r2, #0
	and	r0, r0, r1
	strh	r0, [r6]
	NEG	r0, r0
	ldr	r6, .L5 + 16
	strh	r0, [r6]
	mov	r0, r9
	ldrh	r0, [r0]
	lsl	r1, r0, #0x1
	mov	r2, r9
	ldrh	r2, [r2]
	add	r1, r1, r2
	lsl	r0, r4, #0x2
	add	r0, r0, r4
	lsl	r0, r0, #0x3
	add	r5, r1, r0
	add	r0, r5, #0
	bl	fastAllocate
	ldr	r6, .L5 + 20
	str	r0, [r6]
	cmp	r0, #0
	bne	.L3	@cond_branch
	ldr	r0, .L5 + 24
	add	r1, r5, #0
	bl	printf
.L3:
	ldr	r0, .L5 + 28
	mov	sl, r0
	ldr	r0, [r6]
	ldr	r0, [r0]
	mov	r1, sl
	str	r0, [r1]
	mov	r6, #0x88
	lsl	r6, r6, #0x3
	add	r0, r6, #0
	bl	slowAllocate
	ldr	r7, .L5 + 32
	str	r0, [r7]
	cmp	r0, #0
	bne	.L4	@cond_branch
	ldr	r0, .L5 + 36
	add	r1, r6, #0
	bl	printf
.L4:
	ldr	r1, .L5 + 40
	ldr	r0, [r7]
	ldr	r0, [r0]
	str	r0, [r1]
	ldr	r1, .L5 + 44
	mov	r2, #0x80
	lsl	r2, r2, #0x2
	add	r0, r0, r2
	str	r0, [r1]
	ldr	r0, .L5 + 48
	mov	r6, sl
	ldr	r3, [r6]
	mov	r2, r9
	ldrh	r2, [r2]
	add	r1, r2, r3
	str	r1, [r0]
	ldr	r0, .L5 + 52
	strb	r4, [r0]
	ldr	r2, .L5 + 56
	mov	r4, r9
	ldrh	r4, [r4]
	lsl	r0, r4, #0x1
	add	r1, r1, r0
	str	r1, [r2]
	mov	r6, #0x0
	str	r6, [sp]
	ldr	r2, .L5 + 60
	mov	r0, sp
	str	r0, [r2]
	str	r3, [r2, #0x4]
	lsr	r0, r5, #0x2
	mov	r1, #0x85
	lsl	r1, r1, #0x18
	orr	r0, r0, r1
	str	r0, [r2, #0x8]
	ldr	r0, [r2, #0x8]
	mov	r0, r8
	bl	sub_80623A8
	ldr	r1, .L5 + 64
	mov	r0, #0x80
	strh	r0, [r1]
	sub	r1, r1, #0x2
	ldr	r2, .L5 + 68
	add	r0, r2, #0
	strh	r0, [r1]
	add	r1, r1, #0x3a
	mov	r4, sl
	ldr	r0, [r4]
	str	r0, [r1]
	add	r1, r1, #0x4
	ldr	r0, .L5 + 72
	str	r0, [r1]
	add	r1, r1, #0x4
	mov	r0, #0xb6
	lsl	r0, r0, #0x18
	str	r0, [r1]
	ldr	r2, .L5 + 76
	ldr	r6, .L5 + 16
	ldrh	r0, [r6]
	sub	r0, r0, #0x2
	mov	r1, #0xc4
	lsl	r1, r1, #0x10
	orr	r0, r0, r1
	str	r0, [r2]
	ldr	r4, .L5 + 80
	ldr	r0, .L5 + 84
	mov	r1, r8
	bl	sub_80661C0
	mov	r1, #0x80
	lsl	r1, r1, #0x9
	sub	r1, r1, r0
	mov	r0, #0x80
	lsl	r0, r0, #0x10
	orr	r1, r1, r0
	str	r1, [r4]
	ldr	r0, .L5 + 88
	mov	r1, #0x0
	str	r1, [r0]
	ldr	r0, .L5 + 92
	str	r1, [r0]
	add	sp, sp, #0x4
	pop	{r3, r4, r5}
	mov	r8, r3
	mov	r9, r4
	mov	sl, r5
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L6:
	.align	2, 0
.L5:
	.4byte	0xabea
	.4byte	0x3005e40
	.4byte	0x3005e4c
	.4byte	0xfff0
	.4byte	0x3005e18
	.4byte	0x3005e2c
	.4byte	0x8755d90
	.4byte	0x3005e1c
	.4byte	0x3005e30
	.4byte	0x8755dc4
	.4byte	0x3000d98
	.4byte	0x3005e28
	.4byte	0x3005e50
	.4byte	0x3005e04
	.4byte	0x3005e24
	.4byte	0x40000d4
	.4byte	0x4000084
	.4byte	0xb04
	.4byte	0x40000a0
	.4byte	0x4000104
	.4byte	0x4000100
	.4byte	0x1000ae0
	.4byte	0x3005e00
	.4byte	0x3005e0c
	thumb_func_end allocateSoundTables

.align 2, 0 @ Don't pad with nop.
