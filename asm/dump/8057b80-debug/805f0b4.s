	.include "asm/common.inc"

	thumb_func_start sub_805F0B4
sub_805F0B4:
	push	{r4, r5, r6, r7, lr}
	add	r4, r0, #0
	add	r5, r1, #0
	add	r6, r2, #0
	ldr	r0, [sp, #0x14]
	lsl	r0, r0, #0x18
	lsr	r7, r0, #0x18
	str	r5, [r4]
	ldr	r0, [r5, #0x8]
	add	r0, r5, r0
	str	r0, [r4, #0x4]
	ldr	r0, [r5, #0xc]
	add	r0, r5, r0
	str	r0, [r4, #0x8]
	ldr	r0, [r5, #0x14]
	add	r0, r5, r0
	str	r0, [r4, #0x24]
	ldr	r0, [r5, #0x1c]
	mov	r1, #0x0
	cmp	r0, #0
	beq	.L805F0E0	@cond_branch
	add	r1, r5, r0
.L805F0E0:
	str	r1, [r4, #0x64]
	ldr	r0, [r4, #0xc]
	cmp	r0, #0
	beq	.L805F0EE	@cond_branch
	add	r0, r4, #0
	bl	sub_805F1F4
.L805F0EE:
	cmp	r6, #0
	beq	.L805F0FA	@cond_branch
	str	r6, [r4, #0x1c]
	ldr	r0, [r6, #0x8]
	add	r0, r6, r0
	b	.L805F0FE
.L805F0FA:
	str	r5, [r4, #0x1c]
	ldr	r0, [r4, #0x4]
.L805F0FE:
	str	r0, [r4, #0x20]
	cmp	r6, #0
	beq	.L805F10C	@cond_branch
	ldr	r0, [r4]
	ldr	r0, [r0]
	add	r0, r6, r0
	b	.L805F112
.L805F10C:
	ldr	r0, [r4]
	ldr	r0, [r0]
	add	r0, r5, r0
.L805F112:
	str	r0, [r4, #0x14]
	cmp	r6, #0
	bne	.L805F14E	@cond_branch
	cmp	r7, #0
	bne	.L805F128	@cond_branch
	ldr	r0, [r4]
	ldrh	r0, [r0, #0x4]
	lsl	r0, r0, #0x4
	bl	fastAllocate
	b	.L805F132
.L805F128:
	ldr	r0, [r4]
	ldrh	r0, [r0, #0x4]
	lsl	r0, r0, #0x4
	bl	slowAllocate
.L805F132:
	str	r0, [r4, #0xc]
	ldr	r2, [r4, #0xc]
	ldr	r0, [r4]
	ldrh	r0, [r0, #0x4]
	lsl	r1, r0, #0x5
	ldr	r0, [r2]
	add	r0, r0, r1
	str	r0, [r4, #0x4]
	mov	r1, #0x1
	neg	r1, r1
	add	r0, r4, #0
	bl	sub_805F3A8
	b	.L805F16A
.L805F14E:
	cmp	r7, #0
	bne	.L805F15E	@cond_branch
	ldr	r0, [r4]
	ldrh	r0, [r0, #0x4]
	lsl	r0, r0, #0x4
	bl	fastAllocate
	b	.L805F168
.L805F15E:
	ldr	r0, [r4]
	ldrh	r0, [r0, #0x4]
	lsl	r0, r0, #0x4
	bl	slowAllocate
.L805F168:
	str	r0, [r4, #0xc]
.L805F16A:
	ldr	r5, [r4, #0xc]
	cmp	r5, #0
	bne	.L805F184	@cond_branch
	ldr	r0, .L805F180
	ldr	r1, [r4]
	ldrh	r1, [r1, #0x4]
	lsl	r1, r1, #0x5
	bl	printf
	str	r5, [r4, #0x10]
	b	.L805F192
.L805F180:
	.align	2, 0

	.4byte	Str_875566C
.L805F184:
	ldr	r0, [r5]
	str	r0, [r4, #0x10]
	ldr	r1, [r4]
	ldrh	r1, [r1, #0x4]
	lsl	r1, r1, #0x4
	add	r0, r0, r1
	str	r0, [r4, #0x18]
.L805F192:
	mov	r0, #0x0
	strh	r0, [r4, #0x2a]
	ldr	r2, .L805F1E0
	add	r1, r2, #0
	ldrh	r2, [r4, #0x28]
	orr	r2, r2, r1
	strh	r2, [r4, #0x28]
	ldrh	r2, [r4, #0x30]
	orr	r1, r1, r2
	strh	r1, [r4, #0x30]
	strh	r0, [r4, #0x2c]
	strh	r0, [r4, #0x2e]
	add	r1, r4, #0
	add	r1, r1, #0x44
	strh	r0, [r1]
	strh	r0, [r4, #0x32]
	strh	r0, [r4, #0x3c]
	strh	r0, [r4, #0x3e]
	sub	r1, r1, #0x4
	strh	r0, [r1]
	add	r1, r1, #0x28
	strh	r0, [r1]
	strh	r0, [r4, #0x38]
	sub	r1, r1, #0x10
	strh	r0, [r1]
	strh	r0, [r4, #0x3a]
	sub	r1, r1, #0x6
	strh	r0, [r1]
	str	r0, [r4, #0x6c]
	str	r0, [r4, #0x70]
	mov	r0, #0x2c
	ldsh	r1, [r4, r0]
	add	r0, r4, #0
	bl	sub_805F378
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L805F1DE:
	.align	2, 0
.L805F1E0:
	.4byte	0xffff
	thumb_func_end sub_805F0B4

.align 2, 0 @ Don't pad with nop.
