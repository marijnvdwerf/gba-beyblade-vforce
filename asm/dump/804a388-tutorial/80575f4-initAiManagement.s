	.include "asm/common.inc"

	thumb_func_start initAiManagement
initAiManagement:
	push	{r4, r5, r6, r7, lr}
	add	sp, sp, #0xfffffff8
	ldr	r0, .L3
	ldr	r6, [r0]
	ldr	r0, .L3 + 4
	add	r7, r6, r0
	bl	getSomeLevelID
	mov	r1, #0xd0
	mul	r1, r1, r0
	ldr	r0, .L3 + 8
	add	r5, r1, r0
	ldr	r1, [r5, #0x38]
	str	r1, [r7]
	cmp	r1, #0
	bne	.L1	@cond_branch
	ldr	r0, .L3 + 12
	bl	printf
	b	.L2
.L4:
	.align	2, 0
.L3:
	.4byte	0x3000fb0
	.4byte	0xcbc
	.4byte	0x8075b4c
	.4byte	0x872c99c
.L1:
	mov	r2, #0xcc
	lsl	r2, r2, #0x4
	add	r4, r6, r2
	add	r0, r4, #0
	bl	getLevelGeometryAddresses
	ldr	r1, [r5, #0x3c]
	cmp	r1, #0
	beq	.L5	@cond_branch
	add	r0, r4, #0
	bl	StoreMetadataAddr
.L5:
	ldr	r3, .L7
	add	r0, r6, r3
	mov	r3, #0xa0
	lsl	r3, r3, #0x4
	mov	r1, #0x80
	lsl	r1, r1, #0x2
	str	r1, [sp]
	mov	r1, #0x20
	str	r1, [sp, #0x4]
	add	r1, r4, #0
	mov	r2, #0x5
	bl	initQuadTree
	ldr	r1, .L7 + 4
	add	r0, r6, r1
	ldr	r2, .L7 + 8
	mov	r1, #0x0
	mov	r3, #0x0
	bl	sub_805E50C
	ldr	r0, .L7 + 12
	ldr	r2, .L7 + 16
	add	r1, r6, r2
	ldr	r3, [r0]
	mov	r0, #0x0
	mov	r2, #0x80
	bl	call_via_r3
	ldr	r4, [r7, #0x10]
	mov	r5, #0x0
	b	.L6
.L8:
	.align	2, 0
.L7:
	.4byte	0xddc
	.4byte	0xeb4
	.4byte	fn_aiStubFunc + 1
	.4byte	0x807d970
	.4byte	0xe34
.L18:
	ldrb	r3, [r4, #0xf]
	cmp	r3, #0x93
	bne	.L15	@cond_branch
	ldrh	r0, [r4, #0x16]
	cmp	r0, #0x1f
	bls	.L10	@cond_branch
	ldrh	r1, [r4, #0x16]
	ldr	r0, .L12
	mov	r2, #0x20
	bl	printf
	b	.L15
.L13:
	.align	2, 0
.L12:
	.4byte	0x872c9e4
.L10:
	ldrh	r2, [r4, #0x16]
	lsl	r0, r2, #0x2
	mov	r3, #0xbc
	lsl	r3, r3, #0x1
	add	r1, r7, r3
	add	r1, r1, r0
	ldr	r0, [r1]
	cmp	r0, #0
	beq	.L14	@cond_branch
	ldr	r0, .L16
	add	r1, r2, #0
	bl	printf
	b	.L15
.L17:
	.align	2, 0
.L16:
	.4byte	0x872ca48
.L14:
	str	r4, [r1]
.L15:
	add	r4, r4, #0x20
	add	r5, r5, #0x1
.L6:
	ldr	r0, [r7, #0x4]
	ldr	r0, [r0, #0x8]
	cmp	r5, r0
	blt	.L18	@cond_branch
.L2:
	add	sp, sp, #0x8
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
	thumb_func_end initAiManagement

.align 2, 0 @ Don't pad with nop.
