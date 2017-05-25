	.include "asm/common.inc"

	thumb_func_start sub_8049074
sub_8049074:
	push	{r4, r5, r6, lr}
	add	r6, r0, #0
	ldr	r4, .L1
	add	r0, r4, #0
	add	r0, r0, #0x8c
	add	r5, r4, #0
	add	r5, r5, #0x84
	ldr	r0, [r0]
	ldr	r1, [r5]
	sub	r0, r0, r1
	mov	r1, #0x80
	bl	sub_80491E0
	lsl	r0, r0, #0x5
	ldr	r1, [r5]
	add	r1, r1, r0
	str	r1, [r5]
	add	r0, r4, #0
	add	r0, r0, #0x90
	add	r4, r4, #0x88
	ldr	r0, [r0]
	ldr	r1, [r4]
	sub	r0, r0, r1
	mov	r1, #0x80
	bl	sub_80491E0
	lsl	r0, r0, #0x5
	ldr	r2, [r4]
	add	r2, r2, r0
	str	r2, [r4]
	ldr	r0, [r5]
	asr	r0, r0, #0x8
	add	r1, r6, #0
	add	r1, r1, #0x48
	strh	r0, [r1]
	asr	r2, r2, #0x8
	add	r6, r6, #0x4a
	strh	r2, [r6]
	pop	{r4, r5, r6}
	pop	{r0}
	bx	r0
.L2:
	.align	2, 0
.L1:
	.4byte	0x3000650
	thumb_func_end sub_8049074

.align 2, 0 @ Don't pad with nop.
