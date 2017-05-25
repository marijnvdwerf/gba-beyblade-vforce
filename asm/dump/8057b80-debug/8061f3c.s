	.include "asm/common.inc"

	thumb_func_start sub_8061F3C
sub_8061F3C:
	push	{r4, r5, r6, r7, lr}
	mov	r7, sl
	mov	r6, r9
	mov	r5, r8
	push	{r5, r6, r7}
	add	sp, sp, #0xffffffdc
	str	r0, [sp, #0xc]
	add	r4, r2, #0
	add	r7, r3, #0
	lsl	r1, r1, #0x18
	lsr	r1, r1, #0x18
	str	r1, [sp, #0x10]
	mov	r0, #0x80
	lsl	r0, r0, #0x4
	mov	r9, r0
	bl	slowAllocate
	str	r0, [sp, #0x14]
	cmp	r0, #0
	bne	.L1	@cond_branch
	b	.L2
.L1:
	ldr	r5, [r0]
	mov	r1, #0x1
	mov	sl, r1
	add	r6, r4, #0
	ldr	r0, .L4
	ldr	r3, [r0]
	mov	r0, #0x0
	add	r1, r5, #0
	mov	r2, r9
	bl	call_via_r3
	b	.L141
.L5:
	.align	2, 0
.L4:
	.4byte	0x807d970
.L145:
	mov	r2, sl
	cmp	r2, #0
	beq	.L6	@cond_branch
	ldrb	r1, [r6]
	cmp	r1, #0x25
	bne	.L7	@cond_branch
	mov	r0, #0x0
	str	r0, [sp, #0x20]
	mov	r1, #0x0
	str	r1, [sp, #0x18]
	mov	r8, r1
	mov	r2, #0x0
	str	r2, [sp, #0x1c]
	mov	sl, r2
	b	.L143
.L7:
	add	r0, r5, #0
	bl	sub_8061E94
	add	r5, r0, #0
	b	.L143
.L6:
	ldrb	r0, [r6]
	add	r1, r0, #0
	sub	r1, r1, #0x25
	add	r2, r0, #0
	cmp	r1, #0x53
	bls	.L10	@cond_branch
	b	.L97
.L10:
	lsl	r0, r1, #0x2
	ldr	r1, .L13
	add	r0, r0, r1
	ldr	r0, [r0]
	mov	pc, r0
.L14:
	.align	2, 0
.L13:
	.4byte	.L12
.L12:
	.4byte	.L15
	.4byte	.L97
	.4byte	.L97
	.4byte	.L97
	.4byte	.L97
	.4byte	.L97
	.4byte	.L97
	.4byte	.L97
	.4byte	.L97
	.4byte	.L97
	.4byte	.L97
	.4byte	.L97
	.4byte	.L97
	.4byte	.L97
	.4byte	.L97
	.4byte	.L97
	.4byte	.L97
	.4byte	.L97
	.4byte	.L97
	.4byte	.L97
	.4byte	.L97
	.4byte	.L97
	.4byte	.L97
	.4byte	.L97
	.4byte	.L97
	.4byte	.L97
	.4byte	.L97
	.4byte	.L97
	.4byte	.L97
	.4byte	.L97
	.4byte	.L77
	.4byte	.L97
	.4byte	.L97
	.4byte	.L97
	.4byte	.L97
	.4byte	.L97
	.4byte	.L97
	.4byte	.L97
	.4byte	.L97
	.4byte	.L97
	.4byte	.L97
	.4byte	.L97
	.4byte	.L97
	.4byte	.L97
	.4byte	.L97
	.4byte	.L97
	.4byte	.L93
	.4byte	.L97
	.4byte	.L97
	.4byte	.L97
	.4byte	.L97
	.4byte	.L98
	.4byte	.L97
	.4byte	.L97
	.4byte	.L97
	.4byte	.L97
	.4byte	.L97
	.4byte	.L97
	.4byte	.L97
	.4byte	.L97
	.4byte	.L97
	.4byte	.L97
	.4byte	.L77
	.4byte	.L83
	.4byte	.L97
	.4byte	.L97
	.4byte	.L97
	.4byte	.L97
	.4byte	.L83
	.4byte	.L97
	.4byte	.L97
	.4byte	.L97
	.4byte	.L97
	.4byte	.L97
	.4byte	.L89
	.4byte	.L97
	.4byte	.L97
	.4byte	.L97
	.4byte	.L93
	.4byte	.L97
	.4byte	.L95
	.4byte	.L97
	.4byte	.L97
	.4byte	.L98
.L77:
	add	r7, r7, #0x4
	sub	r0, r7, #4
	ldrb	r1, [r0]
	add	r0, r5, #0
	b	.L99
.L83:
	add	r7, r7, #0x4
	sub	r0, r7, #4
	ldr	r4, [r0]
	cmp	r4, #0
	bge	.L100	@cond_branch
	add	r0, r5, #0
	mov	r1, #0x2d
	bl	sub_8061E94
	add	r5, r0, #0
	NEG	r4, r4
	b	.L102
.L100:
	ldr	r0, [sp, #0x1c]
	cmp	r0, #0
	beq	.L102	@cond_branch
	add	r0, r5, #0
	mov	r1, #0x2b
	bl	sub_8061E94
	add	r5, r0, #0
.L102:
	mov	r1, r8
	str	r1, [sp]
	mov	r0, #0x0
	str	r0, [sp, #0x4]
	mov	r0, #0x4
	str	r0, [sp, #0x8]
	add	r0, r5, #0
	add	r1, r4, #0
	mov	r2, #0xa
	b	.L106
.L89:
	ldr	r2, [sp, #0x20]
	cmp	r2, #0
	beq	.L104	@cond_branch
	add	r0, r5, #0
	mov	r1, #0x30
	bl	sub_8061E94
	add	r5, r0, #0
.L104:
	add	r7, r7, #0x4
	sub	r0, r7, #4
	ldr	r1, [r0]
	mov	r0, r8
	str	r0, [sp]
	mov	r0, #0x0
	str	r0, [sp, #0x4]
	str	r0, [sp, #0x8]
	add	r0, r5, #0
	mov	r2, #0x8
	b	.L106
.L95:
	add	r7, r7, #0x4
	sub	r0, r7, #4
	ldr	r1, [r0]
	mov	r2, r8
	str	r2, [sp]
	mov	r0, #0x0
	str	r0, [sp, #0x4]
	str	r0, [sp, #0x8]
	add	r0, r5, #0
	mov	r2, #0xa
	b	.L106
.L98:
	ldr	r0, [sp, #0x20]
	cmp	r0, #0
	beq	.L107	@cond_branch
	add	r0, r5, #0
	mov	r1, #0x30
	bl	sub_8061E94
	add	r5, r0, #0
	ldrb	r1, [r6]
	bl	sub_8061E94
	add	r5, r0, #0
.L107:
	add	r7, r7, #0x4
	sub	r0, r7, #4
	ldr	r1, [r0]
	mov	r2, r8
	str	r2, [sp]
	mov	r0, #0x0
	ldrb	r2, [r6]
	cmp	r2, #0x58
	bne	.L108	@cond_branch
	mov	r0, #0x1
.L108:
	str	r0, [sp, #0x4]
	mov	r0, #0x0
	str	r0, [sp, #0x8]
	add	r0, r5, #0
	mov	r2, #0x10
.L106:
	ldr	r3, [sp, #0x18]
	bl	sub_8061E9C
	add	r5, r0, #0
	b	.L113
.L93:
	add	r7, r7, #0x4
	sub	r0, r7, #4
	ldr	r4, [r0]
	ldrb	r0, [r4]
	cmp	r0, #0
	beq	.L113	@cond_branch
.L111:
	ldrb	r1, [r4]
	add	r4, r4, #0x1
	add	r0, r5, #0
	bl	sub_8061E94
	add	r5, r0, #0
	ldrb	r0, [r4]
	cmp	r0, #0
	bne	.L111	@cond_branch
	b	.L113
.L15:
	add	r0, r5, #0
	add	r1, r2, #0
.L99:
	bl	sub_8061E94
	add	r5, r0, #0
	b	.L113
.L97:
	add	r0, r2, #0
	sub	r0, r0, #0x23
	cmp	r0, #0x16
	bhi	.L130	@cond_branch
	lsl	r0, r0, #0x2
	ldr	r1, .L116
	add	r0, r0, r1
	ldr	r0, [r0]
	mov	pc, r0
.L117:
	.align	2, 0
.L116:
	.4byte	.L115
.L115:
	.4byte	.L118
	.4byte	.L130
	.4byte	.L130
	.4byte	.L130
	.4byte	.L130
	.4byte	.L130
	.4byte	.L130
	.4byte	.L130
	.4byte	.L126
	.4byte	.L130
	.4byte	.L130
	.4byte	.L130
	.4byte	.L130
	.4byte	.L131
	.4byte	.L140
	.4byte	.L140
	.4byte	.L140
	.4byte	.L140
	.4byte	.L140
	.4byte	.L140
	.4byte	.L140
	.4byte	.L140
	.4byte	.L140
.L118:
	mov	r0, #0x1
	str	r0, [sp, #0x20]
.L143:
	add	r6, r6, #0x1
	b	.L141
.L126:
	mov	r1, #0x1
	str	r1, [sp, #0x1c]
	b	.L143
.L131:
	mov	r0, #0x1
	str	r0, [sp, #0x18]
.L140:
	mov	r1, r8
	lsl	r0, r1, #0x2
	ADD r0, r8
	lsl	r0, r0, #0x1
	mov	r8, r0
	sub	r0, r0, #0x30
	add	r0, r0, r2
	mov	r8, r0
	b	.L143
.L130:
	add	r6, r6, #0x1
.L113:
	add	r6, r6, #0x1
	mov	r2, #0x1
	mov	sl, r2
.L141:
	ldrb	r0, [r6]
	cmp	r0, #0
	beq	.L144	@cond_branch
	b	.L145
.L144:
	ldr	r0, [sp, #0x14]
	ldr	r1, [r0]
	ldr	r0, [sp, #0xc]
	ldr	r2, [sp, #0x10]
	bl	sub_8061660
	ldr	r0, [sp, #0x14]
	bl	deallocateBlock
.L2:
	add	sp, sp, #0x24
	pop	{r3, r4, r5}
	mov	r8, r3
	mov	r9, r4
	mov	sl, r5
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
	thumb_func_end sub_8061F3C

.align 2, 0 @ Don't pad with nop.
