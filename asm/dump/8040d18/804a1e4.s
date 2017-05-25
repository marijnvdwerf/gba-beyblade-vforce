	.include "asm/common.inc"

	thumb_func_start sub_804A1E4
sub_804A1E4:
	push	{r4, r5, r6, lr}
	mov	r6, r8
	push	{r6}
	add	r6, r0, #0
	bl	sub_8061E44
	add	r5, r0, #0
	asr	r5, r5, #0x8
	mov	r0, #0x8
	add	r0, r0, r5
	mov	r8, r0
	add	r0, r6, #0
	bl	sub_8061D54
	add	r4, r0, #0
	asr	r4, r4, #0x8
	add	r0, r6, #0
	bl	sub_8061E08
	asr	r0, r0, #0x8
	ldr	r1, .L1
	lsl	r4, r4, #0x8
	add	r0, r0, #0x1
	add	r4, r4, r0
	strh	r4, [r1]
	ldr	r0, .L1 + 4
	lsl	r5, r5, #0x8
	mov	r1, r8
	orr	r5, r5, r1
	strh	r5, [r0]
	pop	{r3}
	mov	r8, r3
	pop	{r4, r5, r6}
	pop	{r0}
	bx	r0
.L2:
	.align	2, 0
.L1:
	.4byte	0x4000040
	.4byte	0x4000044
	thumb_func_end sub_804A1E4

.align 2, 0 @ Don't pad with nop.
