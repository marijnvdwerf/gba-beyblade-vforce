	.include "asm/common.inc"

	thumb_func_start sub_80464C0
sub_80464C0:
	push	{r4, r5, lr}
	add	r5, r0, #0
	add	r4, r1, #0
	ldr	r1, [r5]
	mov	r2, #0x80
	lsl	r2, r2, #0x6
	add	r0, r4, r2
	str	r0, [r1, #0x8]
	ldr	r0, [r5, #0x4]
	asr	r4, r4, #0x8
	add	r1, r4, #0
	add	r1, r1, #0x54
	lsl	r1, r1, #0x10
	asr	r1, r1, #0x10
	ldr	r2, [r0, #0x4]
	lsl	r2, r2, #0x8
	asr	r2, r2, #0x10
	bl	sub_8061844
	ldr	r0, [r5, #0x8]
	add	r4, r4, #0x70
	lsl	r4, r4, #0x10
	asr	r4, r4, #0x10
	ldr	r2, [r0, #0x4]
	lsl	r2, r2, #0x8
	asr	r2, r2, #0x10
	add	r1, r4, #0
	bl	sub_8061844
	pop	{r4, r5}
	pop	{r0}
	bx	r0
	thumb_func_end sub_80464C0

.align 2, 0 @ Don't pad with nop.
