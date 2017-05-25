	.include "asm/common.inc"

	thumb_func_start sub_8059904
sub_8059904:
	push	{r4, r5, lr}
	add	r4, r1, #0
	ldr	r3, [r4, #0xc]
	lsl	r3, r3, #0x7
	ldr	r1, [r4, #0x4]
	add	r1, r1, r3
	ldr	r2, [r0, #0xc]
	mov	r5, #0xb0
	lsl	r5, r5, #0x7
	add	r2, r2, r5
	sub	r1, r1, r2
	ldr	r2, [r4, #0x8]
	add	r2, r2, r3
	ldr	r3, [r0, #0x10]
	mov	r4, #0xb0
	lsl	r4, r4, #0x6
	add	r3, r3, r4
	sub	r2, r2, r3
	bl	sub_80596AC
	pop	{r4, r5}
	pop	{r0}
	bx	r0
	thumb_func_end sub_8059904

.align 2, 0 @ Don't pad with nop.
