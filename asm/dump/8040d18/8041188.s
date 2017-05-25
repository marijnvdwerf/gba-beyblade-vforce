	.include "asm/common.inc"

	thumb_func_start sub_8041188
sub_8041188:
	push	{r4, r5, r6, r7, lr}
	mov	r7, r9
	mov	r6, r8
	push	{r6, r7}
	add	r5, r0, #0
	mov	r8, r1
	add	r7, r2, #0
	mov	r9, r3
	bl	getLanguage
	add	r4, r0, #0
	mov	r1, r8
	ldrb	r0, [r1, #0x1c]
	cmp	r0, #0
	beq	.L3	@cond_branch
	mov	r0, #0x2
	ldrh	r2, [r7]
	and	r0, r0, r2
	cmp	r0, #0
	bne	.L3	@cond_branch
	mov	r0, #0x4
	bl	sub_8051780
	cmp	r0, #0
	bne	.L3	@cond_branch
	ldr	r0, [r5, #0x10]
	bl	sub_8061228
	ldr	r0, [r5, #0x14]
	bl	sub_8061228
	ldr	r0, [r5, #0x18]
	bl	sub_8061228
	ldr	r0, [r5, #0xc]
	lsl	r2, r4, #0x2
	mov	r1, r8
	add	r1, r1, #0x54
	add	r1, r1, r2
	ldr	r1, [r1]
	mov	r2, #0xf
	bl	sub_8061660
	b	.L6
.L3:
	ldr	r0, [r5, #0xc]
	bl	sub_8061228
	mov	r0, #0x4
	bl	sub_8051780
	cmp	r0, #0
	beq	.L5	@cond_branch
	ldr	r0, [r5, #0x10]
	bl	sub_8061228
	ldr	r0, [r5, #0x14]
	bl	sub_8061228
	ldr	r0, [r5, #0x18]
	bl	sub_8061228
	b	.L6
.L5:
	ldr	r0, [r5, #0x10]
	ldr	r6, .L7
	lsl	r4, r4, #0x2
	add	r1, r6, #0
	add	r1, r1, #0x14
	add	r1, r4, r1
	ldr	r1, [r1]
	mov	r2, #0xe
	bl	sub_8061660
	ldr	r0, [r5, #0x10]
	ldr	r1, [r7, #0x4]
	mov	r2, #0xf
	bl	printTime
	ldr	r0, [r5, #0x14]
	add	r1, r6, #0
	add	r1, r1, #0x8c
	add	r1, r4, r1
	ldr	r1, [r1]
	mov	r2, #0xe
	bl	sub_8061660
	ldr	r0, [r5, #0x14]
	ldr	r1, [r7, #0x8]
	mov	r2, #0xf
	bl	printTime
	ldr	r0, [r5, #0x18]
	add	r1, r6, #0
	add	r1, r1, #0xa0
	add	r4, r4, r1
	ldr	r1, [r4]
	mov	r2, #0xe
	bl	sub_8061660
	ldr	r4, [r5, #0x18]
	mov	r0, r9
	bl	sub_80518C8
	add	r1, r0, #0
	add	r0, r4, #0
	mov	r2, #0xf
	bl	showNumber
	ldr	r0, [r5, #0x18]
	ldr	r1, .L7 + 4
	mov	r2, #0xf
	bl	showString
	ldr	r0, [r5, #0x18]
	mov	r2, r8
	ldrb	r1, [r2, #0x1]
	mov	r2, #0xf
	bl	showNumber
.L6:
	pop	{r3, r4}
	mov	r8, r3
	mov	r9, r4
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L8:
	.align	2, 0
.L7:
	.4byte	0x806e97c
	.4byte	0x86fcf54
	thumb_func_end sub_8041188

.align 2, 0 @ Don't pad with nop.
