	.include "asm/common.inc"

	thumb_func_start sub_805BDBC
sub_805BDBC:
	push	{r4, r5, r6, r7, lr}
	mov	r7, sl
	mov	r6, r9
	mov	r5, r8
	push	{r5, r6, r7}
	add	sp, sp, #0xffffffc8
	str	r0, [sp, #0x10]
	str	r1, [sp, #0x14]
	ldr	r0, [r0, #0x2c]
	mov	r8, r0
	ldr	r2, [sp, #0x10]
	ldrh	r2, [r2, #0x3a]
	lsl	r1, r2, #0x2
	ldr	r3, [sp, #0x10]
	ldr	r0, [r3, #0x30]
	add	r0, r0, r1
	str	r0, [r3, #0x34]
	str	r0, [sp, #0x24]
	mov	r1, #0x0
	ldrh	r4, [r3, #0x38]
	cmp	r1, r4
	blt	.L15	@cond_branch
	b	.L14
.L15:
	mov	r7, r8
	ldrh	r0, [r7, #0x28]
	cmp	r0, #0
	bne	.L3	@cond_branch
	str	r0, [r7, #0x14]
	strh	r0, [r7, #0x2a]
	mov	r0, #0x2c
	ADD r8, r0
	add	r1, r1, #0x1
	str	r1, [sp, #0x2c]
	b	.L4
.L3:
	ldr	r2, [sp, #0x24]
	mov	r3, r8
	str	r2, [r3, #0x14]
	mov	r4, #0x0
	str	r4, [sp, #0x20]
	mov	r7, #0x0
	str	r7, [sp, #0x18]
	ldr	r2, [sp, #0x14]
	ldr	r0, [r2]
	ldr	r0, [r0, #0x4]
	add	r3, r3, #0x2c
	str	r3, [sp, #0x28]
	add	r1, r1, #0x1
	str	r1, [sp, #0x2c]
	cmp	r4, r0
	bge	.L5	@cond_branch
.L13:
	ldr	r3, [sp, #0x18]
	lsl	r1, r3, #0x2
	ldr	r0, [sp, #0x14]
	add	r0, r0, #0x14
	add	r0, r0, r1
	ldr	r0, [r0]
	mov	sl, r0
	ldr	r0, [r0, #0x20]
	lsl	r0, r0, #0x4
	ldr	r4, [sp, #0x14]
	ldr	r1, [r4, #0x4]
	add	r2, r1, r0
	mov	r7, #0x1
	str	r7, [sp, #0x1c]
	mov	r1, sl
	ldr	r0, [r1]
	add	r3, r3, #0x1
	str	r3, [sp, #0x30]
	cmp	r7, r0
	bge	.L6	@cond_branch
	add	r1, r1, #0x24
	str	r1, [sp, #0x34]
.L12:
	ldr	r3, [sp, #0x34]
	ldr	r1, [r3]
	lsl	r1, r1, #0x4
	ldr	r4, [sp, #0x14]
	ldr	r0, [r4, #0x4]
	add	r0, r0, r1
	mov	r9, r0
	ldr	r1, [r2]
	ldr	r0, [r0]
	cmp	r1, r0
	bge	.L7	@cond_branch
	add	r6, r1, #0
	sub	r6, r6, #0x10
	add	r0, r0, #0x10
	mov	ip, r0
	b	.L8
.L7:
	add	r6, r0, #0
	sub	r6, r6, #0x10
	add	r1, r1, #0x10
	mov	ip, r1
.L8:
	ldr	r1, [r2, #0x4]
	mov	r7, r9
	ldr	r0, [r7, #0x4]
	cmp	r1, r0
	bge	.L9	@cond_branch
	add	r4, r1, #0
	sub	r4, r4, #0x10
	add	r5, r0, #0
	b	.L10
.L9:
	add	r4, r0, #0
	sub	r4, r4, #0x10
	add	r5, r1, #0
.L10:
	add	r5, r5, #0x10
	mov	r1, r8
	ldr	r0, [r1, #0x18]
	ldr	r1, [r1, #0x1c]
	mov	r3, r8
	ldr	r2, [r3, #0x20]
	ldr	r3, [r3, #0x24]
	str	r6, [sp]
	str	r4, [sp, #0x4]
	mov	r4, ip
	str	r4, [sp, #0x8]
	str	r5, [sp, #0xc]
	bl	sub_805BF18
	lsl	r0, r0, #0x18
	cmp	r0, #0
	beq	.L11	@cond_branch
	mov	r7, sl
	ldr	r0, [sp, #0x24]
	str	r7, [r0]
	ldr	r0, [sp, #0x1c]
	sub	r0, r0, #0x1
	ldr	r1, [sp, #0x24]
	strh	r0, [r1, #0x4]
	mov	r2, sp
	ldrh	r2, [r2, #0x18]
	strh	r2, [r1, #0x6]
	add	r1, r1, #0x8
	str	r1, [sp, #0x24]
	ldr	r3, [sp, #0x20]
	add	r3, r3, #0x1
	str	r3, [sp, #0x20]
.L11:
	mov	r2, r9
	ldr	r4, [sp, #0x34]
	add	r4, r4, #0x4
	str	r4, [sp, #0x34]
	ldr	r7, [sp, #0x1c]
	add	r7, r7, #0x1
	str	r7, [sp, #0x1c]
	mov	r1, sl
	ldr	r0, [r1]
	cmp	r7, r0
	blt	.L12	@cond_branch
.L6:
	ldr	r2, [sp, #0x30]
	str	r2, [sp, #0x18]
	ldr	r3, [sp, #0x14]
	ldr	r0, [r3]
	ldr	r0, [r0, #0x4]
	cmp	r2, r0
	blt	.L13	@cond_branch
.L5:
	mov	r4, sp
	ldrh	r7, [r4, #0x20]
	mov	r4, r8
	strh	r7, [r4, #0x2a]
	ldr	r0, [sp, #0x28]
	mov	r8, r0
.L4:
	ldr	r1, [sp, #0x2c]
	ldr	r2, [sp, #0x10]
	ldrh	r2, [r2, #0x38]
	cmp	r1, r2
	bge	.L14	@cond_branch
	b	.L15
.L14:
	add	sp, sp, #0x38
	pop	{r3, r4, r5}
	mov	r8, r3
	mov	r9, r4
	mov	sl, r5
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
	thumb_func_end sub_805BDBC

.align 2, 0 @ Don't pad with nop.
