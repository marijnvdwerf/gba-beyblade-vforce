	.include "asm/common.inc"

	thumb_func_start sub_8043DB8
sub_8043DB8:
	push	{r4, r5, r6, r7, lr}
	mov	r7, sl
	mov	r6, r9
	mov	r5, r8
	push	{r5, r6, r7}
	add	r5, r0, #0
	mov	r9, r1
	add	r7, r2, #0
	add	r4, r3, #0
	bl	getLevelDescription2
	mov	sl, r0
	mov	r0, #0xff
	mov	r8, r0
	mov	r1, r8
	and	r1, r1, r4
	mov	r8, r1
	lsr	r4, r4, #0x8
	bl	getLanguage
	add	r6, r0, #0
	mov	r0, #0x1
	and	r0, r0, r4
	cmp	r0, #0
	beq	.L3	@cond_branch
	ldr	r0, [r5]
	ldr	r2, .L4
	lsl	r1, r6, #0x2
	add	r1, r1, r2
	ldr	r1, [r1]
	mov	r2, #0xe
	bl	sub_8061660
	ldr	r1, [r7]
	cmp	r1, #0
	beq	.L2	@cond_branch
	ldr	r0, [r5, #0x4]
	mov	r2, r8
	mul	r2, r2, r1
	add	r1, r2, #0
	lsr	r1, r1, #0x5
	mov	r2, #0xf
	bl	sub_8061C48
	b	.L3
.L5:
	.align	2, 0
.L4:
	.4byte	0x806e97c
.L2:
	ldr	r0, [r5, #0x4]
	ldr	r1, .L14
	mov	r2, #0xf
	bl	sub_8061660
.L3:
	mov	r0, #0x2
	and	r0, r0, r4
	cmp	r0, #0
	beq	.L6	@cond_branch
	ldr	r0, [r5, #0x8]
	ldr	r1, .L14 + 4
	lsl	r2, r6, #0x2
	add	r1, r1, #0x14
	add	r2, r2, r1
	ldr	r1, [r2]
	mov	r2, #0xe
	bl	sub_8061660
	ldr	r0, [r5, #0xc]
	mov	r2, r9
	ldr	r1, [r2, #0x4]
	mov	r2, r8
	mul	r2, r2, r1
	add	r1, r2, #0
	lsr	r1, r1, #0x5
	mov	r2, #0xf
	bl	sub_8061C48
.L6:
	mov	r0, #0x4
	mov	r9, r0
	add	r0, r4, #0
	mov	r1, r9
	and	r0, r0, r1
	cmp	r0, #0
	beq	.L7	@cond_branch
	ldr	r0, [r5, #0x10]
	ldr	r1, .L14 + 4
	lsl	r2, r6, #0x2
	add	r1, r1, #0x28
	add	r2, r2, r1
	ldr	r1, [r2]
	mov	r2, #0xe
	bl	sub_8061660
	ldr	r0, [r5, #0x14]
	ldr	r1, [r7, #0x4]
	mov	r2, r8
	mul	r2, r2, r1
	add	r1, r2, #0
	lsr	r1, r1, #0x5
	mov	r2, #0xf
	bl	showNumber_2
.L7:
	mov	r0, #0x8
	and	r0, r0, r4
	cmp	r0, #0
	beq	.L8	@cond_branch
	ldr	r0, [r5, #0x18]
	ldr	r1, .L14 + 4
	lsl	r2, r6, #0x2
	add	r1, r1, #0x3c
	add	r2, r2, r1
	ldr	r1, [r2]
	mov	r2, #0xe
	bl	sub_8061660
	ldr	r0, [r5, #0x1c]
	ldr	r1, [r7, #0x8]
	mov	r2, r8
	mul	r2, r2, r1
	add	r1, r2, #0
	lsr	r1, r1, #0x5
	mov	r2, #0xf
	bl	showNumber_2
	ldr	r0, [r5, #0x1c]
	ldr	r1, .L14 + 8
	mov	r2, #0xf
	bl	showString
	ldr	r0, [r5, #0x1c]
	mov	r2, sl
	ldrb	r1, [r2, #0x1]
	mov	r2, #0xf
	bl	showNumber
.L8:
	mov	r0, #0x10
	and	r0, r0, r4
	cmp	r0, #0
	beq	.L10	@cond_branch
	mov	r0, r9
	ldrh	r1, [r7, #0xc]
	and	r0, r0, r1
	cmp	r0, #0
	beq	.L10	@cond_branch
	ldr	r0, [r5, #0x20]
	ldr	r1, .L14 + 4
	lsl	r2, r6, #0x2
	add	r1, r1, #0x50
	add	r2, r2, r1
	ldr	r1, [r2]
	mov	r2, #0xe
	bl	sub_8061660
.L10:
	mov	r0, #0x20
	and	r4, r4, r0
	cmp	r4, #0
	beq	.L13	@cond_branch
	mov	r0, #0x1
	ldrh	r7, [r7, #0xc]
	and	r0, r0, r7
	cmp	r0, #0
	beq	.L12	@cond_branch
	ldr	r0, [r5, #0x24]
	ldr	r1, .L14 + 4
	lsl	r2, r6, #0x2
	add	r1, r1, #0x64
	add	r2, r2, r1
	ldr	r1, [r2]
	mov	r2, #0xe
	bl	sub_8061660
	b	.L13
.L15:
	.align	2, 0
.L14:
	.4byte	0x86fd468
	.4byte	0x806e97c
	.4byte	0x86fd46c
.L12:
	ldr	r0, [r5, #0x24]
	ldr	r1, .L16
	lsl	r2, r6, #0x2
	add	r1, r1, #0x78
	add	r2, r2, r1
	ldr	r1, [r2]
	mov	r2, #0xe
	bl	sub_8061660
.L13:
	pop	{r3, r4, r5}
	mov	r8, r3
	mov	r9, r4
	mov	sl, r5
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L17:
	.align	2, 0
.L16:
	.4byte	0x806e97c
	thumb_func_end sub_8043DB8

.align 2, 0 @ Don't pad with nop.
