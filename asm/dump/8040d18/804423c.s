	.include "asm/common.inc"

	thumb_func_start sub_804423C
sub_804423C:
	push	{r4, r5, r6, lr}
	mov	r6, r8
	push	{r6}
	add	r6, r0, #0
	mov	r8, r1
	ldr	r0, [r6]
	asr	r1, r1, #0x8
	mov	r8, r1
	mov	r5, r8
	add	r5, r5, #0x18
	lsl	r5, r5, #0x10
	asr	r5, r5, #0x10
	ldr	r2, [r0, #0x4]
	lsl	r2, r2, #0x8
	asr	r2, r2, #0x10
	add	r1, r5, #0
	bl	sub_8061844
	ldr	r0, [r6, #0x4]
	mov	r4, r8
	add	r4, r4, #0x80
	lsl	r4, r4, #0x10
	asr	r4, r4, #0x10
	ldr	r2, [r0, #0x4]
	lsl	r2, r2, #0x8
	asr	r2, r2, #0x10
	add	r1, r4, #0
	bl	sub_8061844
	ldr	r0, [r6, #0x8]
	ldr	r2, [r0, #0x4]
	lsl	r2, r2, #0x8
	asr	r2, r2, #0x10
	add	r1, r5, #0
	bl	sub_8061844
	ldr	r0, [r6, #0xc]
	ldr	r2, [r0, #0x4]
	lsl	r2, r2, #0x8
	asr	r2, r2, #0x10
	add	r1, r4, #0
	bl	sub_8061844
	ldr	r0, [r6, #0x10]
	ldr	r2, [r0, #0x4]
	lsl	r2, r2, #0x8
	asr	r2, r2, #0x10
	add	r1, r5, #0
	bl	sub_8061844
	ldr	r0, [r6, #0x14]
	ldr	r2, [r0, #0x4]
	lsl	r2, r2, #0x8
	asr	r2, r2, #0x10
	add	r1, r4, #0
	bl	sub_8061844
	ldr	r0, [r6, #0x18]
	ldr	r2, [r0, #0x4]
	lsl	r2, r2, #0x8
	asr	r2, r2, #0x10
	add	r1, r5, #0
	bl	sub_8061844
	ldr	r0, [r6, #0x1c]
	ldr	r2, [r0, #0x4]
	lsl	r2, r2, #0x8
	asr	r2, r2, #0x10
	add	r1, r4, #0
	bl	sub_8061844
	ldr	r0, [r6, #0x20]
	mov	r1, r8
	lsl	r1, r1, #0x10
	asr	r1, r1, #0x10
	mov	r8, r1
	ldr	r2, [r0, #0x4]
	lsl	r2, r2, #0x8
	asr	r2, r2, #0x10
	bl	sub_8061844
	ldr	r0, [r6, #0x24]
	ldr	r2, [r0, #0x4]
	lsl	r2, r2, #0x8
	asr	r2, r2, #0x10
	mov	r1, r8
	bl	sub_8061844
	ldr	r4, [r6, #0x24]
	bl	sub_8057C40
	asr	r0, r0, #0x4
	add	r0, r0, #0x4
	mov	r1, #0x8
	and	r0, r0, r1
	mov	r1, #0xf
	cmp	r0, #0
	beq	.L1	@cond_branch
	mov	r1, #0xe
.L1:
	add	r0, r4, #0
	bl	sub_806185C
	pop	{r3}
	mov	r8, r3
	pop	{r4, r5, r6}
	pop	{r0}
	bx	r0
	thumb_func_end sub_804423C

.align 2, 0 @ Don't pad with nop.
