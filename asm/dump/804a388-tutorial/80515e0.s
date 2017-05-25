	.include "asm/common.inc"

	thumb_func_start sub_80515E0
sub_80515E0:
	push	{r4, r5, lr}
	ldr	r0, .L1
	ldr	r4, [r0]
	ldr	r0, .L1 + 4
	add	r4, r4, r0
	ldr	r5, .L1 + 8
	bl	sub_8062694
	mov	r0, #0x0
	add	r1, r4, #0
	add	r2, r5, #0
	bl	sub_8057568
	add	r4, r0, #0
	lsl	r4, r4, #0x18
	lsr	r4, r4, #0x18
	bl	sub_80626E0
	add	r0, r4, #0
	pop	{r4, r5}
	pop	{r1}
	bx	r1
.L2:
	.align	2, 0
.L1:
	.4byte	0x3000f48
	.4byte	0x6fc
	.4byte	0x564
	thumb_func_end sub_80515E0

.align 2, 0 @ Don't pad with nop.
