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
	bne	.L8061F66	@cond_branch
	b	.L80622BE
.L8061F66:
	ldr	r5, [r0]
	mov	r1, #0x1
	mov	sl, r1
	add	r6, r4, #0
	ldr	r0, .L8061F80
	ldr	r3, [r0]
	mov	r0, #0x0
	add	r1, r5, #0
	mov	r2, r9
	bl	_call_via_r3
	b	.L80622A4
.L8061F7E:
	.align	2, 0
.L8061F80:
	.4byte	__fastMemoryClearARM
.L8061F84:
	mov	r2, sl
	cmp	r2, #0
	beq	.L8061FAC	@cond_branch
	ldrb	r1, [r6]
	cmp	r1, #0x25
	bne	.L8061FA2	@cond_branch
	mov	r0, #0x0
	str	r0, [sp, #0x20]
	mov	r1, #0x0
	str	r1, [sp, #0x18]
	mov	r8, r1
	mov	r2, #0x0
	str	r2, [sp, #0x1c]
	mov	sl, r2
	b	.L806227C
.L8061FA2:
	add	r0, r5, #0
	bl	sub_8061E94
	add	r5, r0, #0
	b	.L806227C
.L8061FAC:
	ldrb	r0, [r6]
	add	r1, r0, #0
	sub	r1, r1, #0x25
	add	r2, r0, #0
	cmp	r1, #0x53
	bls	.L8061FBA	@cond_branch
	b	.L8062206
.L8061FBA:
	lsl	r0, r1, #0x2
	ldr	r1, .L8061FC4
	add	r0, r0, r1
	ldr	r0, [r0]
	mov	pc, r0
.L8061FC4:
	.align	2, 0

	.4byte	.L8061FC8
.L8061FC8:
	.4byte	.L80621FA
	.4byte	.L8062206
	.4byte	.L8062206
	.4byte	.L8062206
	.4byte	.L8062206
	.4byte	.L8062206
	.4byte	.L8062206
	.4byte	.L8062206
	.4byte	.L8062206
	.4byte	.L8062206
	.4byte	.L8062206
	.4byte	.L8062206
	.4byte	.L8062206
	.4byte	.L8062206
	.4byte	.L8062206
	.4byte	.L8062206
	.4byte	.L8062206
	.4byte	.L8062206
	.4byte	.L8062206
	.4byte	.L8062206
	.4byte	.L8062206
	.4byte	.L8062206
	.4byte	.L8062206
	.4byte	.L8062206
	.4byte	.L8062206
	.4byte	.L8062206
	.4byte	.L8062206
	.4byte	.L8062206
	.4byte	.L8062206
	.4byte	.L8062206
	.4byte	.L8062118
	.4byte	.L8062206
	.4byte	.L8062206
	.4byte	.L8062206
	.4byte	.L8062206
	.4byte	.L8062206
	.4byte	.L8062206
	.4byte	.L8062206
	.4byte	.L8062206
	.4byte	.L8062206
	.4byte	.L8062206
	.4byte	.L8062206
	.4byte	.L8062206
	.4byte	.L8062206
	.4byte	.L8062206
	.4byte	.L8062206
	.4byte	.L80621DA
	.4byte	.L8062206
	.4byte	.L8062206
	.4byte	.L8062206
	.4byte	.L8062206
	.4byte	.L806219A
	.4byte	.L8062206
	.4byte	.L8062206
	.4byte	.L8062206
	.4byte	.L8062206
	.4byte	.L8062206
	.4byte	.L8062206
	.4byte	.L8062206
	.4byte	.L8062206
	.4byte	.L8062206
	.4byte	.L8062206
	.4byte	.L8062118
	.4byte	.L8062122
	.4byte	.L8062206
	.4byte	.L8062206
	.4byte	.L8062206
	.4byte	.L8062206
	.4byte	.L8062122
	.4byte	.L8062206
	.4byte	.L8062206
	.4byte	.L8062206
	.4byte	.L8062206
	.4byte	.L8062206
	.4byte	.L806215E
	.4byte	.L8062206
	.4byte	.L8062206
	.4byte	.L8062206
	.4byte	.L80621DA
	.4byte	.L8062206
	.4byte	.L8062184
	.4byte	.L8062206
	.4byte	.L8062206
	.4byte	.L806219A
.L8062118:
	add	r7, r7, #0x4
	sub	r0, r7, #4
	ldrb	r1, [r0]
	add	r0, r5, #0
	b	.L80621FE
.L8062122:
	add	r7, r7, #0x4
	sub	r0, r7, #4
	ldr	r4, [r0]
	cmp	r4, #0
	bge	.L806213A	@cond_branch
	add	r0, r5, #0
	mov	r1, #0x2d
	bl	sub_8061E94
	add	r5, r0, #0
	NEG	r4, r4
	b	.L806214A
.L806213A:
	ldr	r0, [sp, #0x1c]
	cmp	r0, #0
	beq	.L806214A	@cond_branch
	add	r0, r5, #0
	mov	r1, #0x2b
	bl	sub_8061E94
	add	r5, r0, #0
.L806214A:
	mov	r1, r8
	str	r1, [sp]
	mov	r0, #0x0
	str	r0, [sp, #0x4]
	mov	r0, #0x4
	str	r0, [sp, #0x8]
	add	r0, r5, #0
	add	r1, r4, #0
	mov	r2, #0xa
	b	.L80621D0
.L806215E:
	ldr	r2, [sp, #0x20]
	cmp	r2, #0
	beq	.L806216E	@cond_branch
	add	r0, r5, #0
	mov	r1, #0x30
	bl	sub_8061E94
	add	r5, r0, #0
.L806216E:
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
	b	.L80621D0
.L8062184:
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
	b	.L80621D0
.L806219A:
	ldr	r0, [sp, #0x20]
	cmp	r0, #0
	beq	.L80621B2	@cond_branch
	add	r0, r5, #0
	mov	r1, #0x30
	bl	sub_8061E94
	add	r5, r0, #0
	ldrb	r1, [r6]
	bl	sub_8061E94
	add	r5, r0, #0
.L80621B2:
	add	r7, r7, #0x4
	sub	r0, r7, #4
	ldr	r1, [r0]
	mov	r2, r8
	str	r2, [sp]
	mov	r0, #0x0
	ldrb	r2, [r6]
	cmp	r2, #0x58
	bne	.L80621C6	@cond_branch
	mov	r0, #0x1
.L80621C6:
	str	r0, [sp, #0x4]
	mov	r0, #0x0
	str	r0, [sp, #0x8]
	add	r0, r5, #0
	mov	r2, #0x10
.L80621D0:
	ldr	r3, [sp, #0x18]
	bl	sub_8061E9C
	add	r5, r0, #0
	b	.L806229E
.L80621DA:
	add	r7, r7, #0x4
	sub	r0, r7, #4
	ldr	r4, [r0]
	ldrb	r0, [r4]
	cmp	r0, #0
	beq	.L806229E	@cond_branch
.L80621E6:
	ldrb	r1, [r4]
	add	r4, r4, #0x1
	add	r0, r5, #0
	bl	sub_8061E94
	add	r5, r0, #0
	ldrb	r0, [r4]
	cmp	r0, #0
	bne	.L80621E6	@cond_branch
	b	.L806229E
.L80621FA:
	add	r0, r5, #0
	add	r1, r2, #0
.L80621FE:
	bl	sub_8061E94
	add	r5, r0, #0
	b	.L806229E
.L8062206:
	add	r0, r2, #0
	sub	r0, r0, #0x23
	cmp	r0, #0x16
	bhi	.L806229C	@cond_branch
	lsl	r0, r0, #0x2
	ldr	r1, .L8062218
	add	r0, r0, r1
	ldr	r0, [r0]
	mov	pc, r0
.L8062218:
	.align	2, 0

	.4byte	.L806221C
.L806221C:
	.4byte	.L8062278
	.4byte	.L806229C
	.4byte	.L806229C
	.4byte	.L806229C
	.4byte	.L806229C
	.4byte	.L806229C
	.4byte	.L806229C
	.4byte	.L806229C
	.4byte	.L8062280
	.4byte	.L806229C
	.4byte	.L806229C
	.4byte	.L806229C
	.4byte	.L806229C
	.4byte	.L8062286
	.4byte	.L806228A
	.4byte	.L806228A
	.4byte	.L806228A
	.4byte	.L806228A
	.4byte	.L806228A
	.4byte	.L806228A
	.4byte	.L806228A
	.4byte	.L806228A
	.4byte	.L806228A
.L8062278:
	mov	r0, #0x1
	str	r0, [sp, #0x20]
.L806227C:
	add	r6, r6, #0x1
	b	.L80622A4
.L8062280:
	mov	r1, #0x1
	str	r1, [sp, #0x1c]
	b	.L806227C
.L8062286:
	mov	r0, #0x1
	str	r0, [sp, #0x18]
.L806228A:
	mov	r1, r8
	lsl	r0, r1, #0x2
	ADD r0, r8
	lsl	r0, r0, #0x1
	mov	r8, r0
	sub	r0, r0, #0x30
	add	r0, r0, r2
	mov	r8, r0
	b	.L806227C
.L806229C:
	add	r6, r6, #0x1
.L806229E:
	add	r6, r6, #0x1
	mov	r2, #0x1
	mov	sl, r2
.L80622A4:
	ldrb	r0, [r6]
	cmp	r0, #0
	beq	.L80622AC	@cond_branch
	b	.L8061F84
.L80622AC:
	ldr	r0, [sp, #0x14]
	ldr	r1, [r0]
	ldr	r0, [sp, #0xc]
	ldr	r2, [sp, #0x10]
	bl	sub_8061660
	ldr	r0, [sp, #0x14]
	bl	deallocateBlock
.L80622BE:
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
