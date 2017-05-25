	.include "asm/common.inc"

	thumb_func_start sub_804BF3C
sub_804BF3C:
	push	{r4, r5, r6, r7, lr}
	mov	r7, r9
	mov	r6, r8
	push	{r6, r7}
	add	sp, sp, #0xfffffff4
	mov	ip, r0
	mov	r0, #0xf0
	lsl	r0, r0, #0x2
	ADD r0, ip
	ldr	r7, [r0]
	mov	r0, #0xbc
	lsl	r0, r0, #0x2
	ADD r0, ip
	ldr	r1, [r0]
	mov	r0, #0x9d
	lsl	r0, r0, #0x2
	ADD r0, ip
	ldr	r2, [r0]
	mov	r6, #0xf6
	lsl	r6, r6, #0x2
	ADD r6, ip
	cmp	r1, #0
	bne	.L1	@cond_branch
	b	.L2
.L1:
	ldr	r0, [r1, #0x8]
	ldr	r4, [r2, #0xc]
	add	r0, r0, r4
	asr	r0, r0, #0xb
	mov	r9, r0
	ldr	r1, [r1, #0xc]
	ldr	r3, [r2, #0x10]
	add	r0, r1, r3
	asr	r0, r0, #0xb
	mov	r8, r0
	asr	r0, r4, #0xb
	mov	r2, r9
	sub	r0, r2, r0
	asr	r2, r3, #0xb
	mov	r5, r8
	sub	r2, r5, r2
	lsl	r0, r0, #0xb
	mov	r5, #0xe0
	lsl	r5, r5, #0x3
	and	r4, r4, r5
	sub	r4, r0, r4
	lsl	r2, r2, #0xb
	and	r3, r3, r5
	sub	r2, r2, r3
	ldr	r0, .L8
	ADD r0, ip
	sub	r1, r1, r2
	asr	r1, r1, #0x8
	add	r1, r1, #0x8
	ldrh	r0, [r0]
	add	r1, r0, r1
	asr	r5, r1, #0x3
	cmp	r5, #0x4
	ble	.L3	@cond_branch
	mov	r5, #0x4
.L3:
	str	r4, [r7, #0x8]
	str	r2, [r7, #0xc]
	ldr	r0, [r6]
	cmp	r9, r0
	bne	.L4	@cond_branch
	ldr	r0, [r6, #0x4]
	cmp	r8, r0
	beq	.L5	@cond_branch
.L4:
	ldr	r0, [r6, #0xc]
	sub	r7, r0, r5
	ldr	r0, .L8 + 4
	ldr	r0, [r0]
	ldr	r1, .L8 + 8
	add	r0, r0, r1
	str	r5, [sp]
	mov	r1, #0xe0
	lsl	r1, r1, #0x1
	ADD r1, ip
	ldrb	r1, [r1]
	sub	r1, r1, #0x1
	str	r1, [sp, #0x4]
	mov	r4, #0xf5
	lsl	r4, r4, #0x2
	ADD r4, ip
	ldr	r1, [r4]
	str	r1, [sp, #0x8]
	mov	r1, r9
	mov	r2, r8
	mov	r3, #0x4
	bl	sub_805EF18
	cmp	r7, #0
	ble	.L14	@cond_branch
	ldr	r3, .L8 + 12
	lsl	r0, r5, #0x7
	ldr	r1, [r4]
	add	r1, r1, r0
	lsl	r2, r7, #0x7
	ldr	r3, [r3]
	mov	r0, #0x0
	bl	call_via_r3
	b	.L14
.L9:
	.align	2, 0
.L8:
	.4byte	0x3ca
	.4byte	0x3000fb0
	.4byte	0x434
	.4byte	0x807d970
.L5:
	ldr	r4, [r6, #0xc]
	cmp	r5, r4
	ble	.L10	@cond_branch
	sub	r1, r5, r4
	ldr	r0, .L12
	ldr	r0, [r0]
	ldr	r2, .L12 + 4
	add	r0, r0, r2
	mov	r3, r8
	add	r2, r3, r4
	str	r1, [sp]
	mov	r1, #0xe0
	lsl	r1, r1, #0x1
	ADD r1, ip
	ldrb	r1, [r1]
	sub	r1, r1, #0x1
	str	r1, [sp, #0x4]
	mov	r1, #0xf5
	lsl	r1, r1, #0x2
	ADD r1, ip
	lsl	r3, r4, #0x7
	ldr	r1, [r1]
	add	r1, r1, r3
	str	r1, [sp, #0x8]
	mov	r1, r9
	mov	r3, #0x4
	bl	sub_805EF18
	b	.L14
.L13:
	.align	2, 0
.L12:
	.4byte	0x3000fb0
	.4byte	0x434
.L10:
	cmp	r5, r4
	bge	.L14	@cond_branch
	ldr	r3, .L15
	mov	r0, #0xf5
	lsl	r0, r0, #0x2
	ADD r0, ip
	lsl	r2, r5, #0x7
	ldr	r1, [r0]
	add	r1, r1, r2
	sub	r2, r4, r5
	lsl	r2, r2, #0x7
	ldr	r3, [r3]
	mov	r0, #0x0
	bl	call_via_r3
.L14:
	mov	r0, r9
	str	r0, [r6]
	mov	r1, r8
	str	r1, [r6, #0x4]
	str	r5, [r6, #0xc]
.L2:
	add	sp, sp, #0xc
	pop	{r3, r4}
	mov	r8, r3
	mov	r9, r4
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L16:
	.align	2, 0
.L15:
	.4byte	0x807d970
	thumb_func_end sub_804BF3C

.align 2, 0 @ Don't pad with nop.
