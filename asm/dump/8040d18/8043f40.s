	.include "asm/common.inc"

	thumb_func_start sub_8043F40
sub_8043F40:
	push	{r4, r5, r6, r7, lr}
	mov	r7, r8
	push	{r7}
	add	r7, r0, #0
	mov	r8, r1
	add	r6, r2, #0
	ldr	r0, [r7]
	asr	r6, r6, #0x8
	add	r5, r6, #0
	add	r5, r5, #0x12
	lsl	r5, r5, #0x10
	asr	r5, r5, #0x10
	ldr	r2, [r0, #0x4]
	lsl	r2, r2, #0x8
	asr	r2, r2, #0x10
	add	r1, r5, #0
	bl	sub_8061844
	ldr	r0, [r7, #0x4]
	add	r4, r6, #0
	add	r4, r4, #0x80
	lsl	r4, r4, #0x10
	asr	r4, r4, #0x10
	ldr	r2, [r0, #0x4]
	lsl	r2, r2, #0x8
	asr	r2, r2, #0x10
	add	r1, r4, #0
	bl	sub_8061844
	ldr	r0, [r7, #0x8]
	ldr	r2, [r0, #0x4]
	lsl	r2, r2, #0x8
	asr	r2, r2, #0x10
	add	r1, r5, #0
	bl	sub_8061844
	ldr	r0, [r7, #0xc]
	ldr	r2, [r0, #0x4]
	lsl	r2, r2, #0x8
	asr	r2, r2, #0x10
	add	r1, r4, #0
	bl	sub_8061844
	ldr	r0, [r7, #0x10]
	ldr	r2, [r0, #0x4]
	lsl	r2, r2, #0x8
	asr	r2, r2, #0x10
	add	r1, r5, #0
	bl	sub_8061844
	ldr	r0, [r7, #0x14]
	ldr	r2, [r0, #0x4]
	lsl	r2, r2, #0x8
	asr	r2, r2, #0x10
	add	r1, r4, #0
	bl	sub_8061844
	ldr	r0, [r7, #0x18]
	ldr	r2, [r0, #0x4]
	lsl	r2, r2, #0x8
	asr	r2, r2, #0x10
	add	r1, r5, #0
	bl	sub_8061844
	ldr	r0, [r7, #0x1c]
	ldr	r2, [r0, #0x4]
	lsl	r2, r2, #0x8
	asr	r2, r2, #0x10
	add	r1, r4, #0
	bl	sub_8061844
	ldr	r0, [r7, #0x20]
	lsl	r6, r6, #0x10
	asr	r6, r6, #0x10
	ldr	r2, [r0, #0x4]
	lsl	r2, r2, #0x8
	asr	r2, r2, #0x10
	add	r1, r6, #0
	bl	sub_8061844
	ldr	r0, [r7, #0x24]
	ldr	r2, [r0, #0x4]
	lsl	r2, r2, #0x8
	asr	r2, r2, #0x10
	add	r1, r6, #0
	bl	sub_8061844
	mov	r0, #0x4
	mov	r1, r8
	ldrh	r1, [r1, #0xc]
	and	r0, r0, r1
	cmp	r0, #0
	beq	.L1	@cond_branch
	ldr	r4, [r7, #0x8]
	bl	sub_8057C40
	asr	r0, r0, #0x4
	add	r0, r0, #0x4
	mov	r5, #0x8
	and	r0, r0, r5
	mov	r1, #0xf
	cmp	r0, #0
	beq	.L2	@cond_branch
	mov	r1, #0xe
.L2:
	add	r0, r4, #0
	bl	sub_806185C
	ldr	r4, [r7, #0xc]
	bl	sub_8057C40
	asr	r0, r0, #0x4
	add	r0, r0, #0x4
	and	r0, r0, r5
	mov	r1, #0xf
	cmp	r0, #0
	beq	.L3	@cond_branch
	mov	r1, #0xd
.L3:
	add	r0, r4, #0
	bl	sub_806185C
.L1:
	ldr	r4, [r7, #0x24]
	bl	sub_8057C40
	asr	r0, r0, #0x4
	mov	r1, #0x8
	and	r0, r0, r1
	mov	r1, #0xf
	cmp	r0, #0
	beq	.L4	@cond_branch
	mov	r1, #0xe
.L4:
	add	r0, r4, #0
	bl	sub_806185C
	pop	{r3}
	mov	r8, r3
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
	thumb_func_end sub_8043F40

.align 2, 0 @ Don't pad with nop.
