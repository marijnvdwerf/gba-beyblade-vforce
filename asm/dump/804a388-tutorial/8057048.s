	.include "asm/common.inc"

	thumb_func_start sub_8057048
sub_8057048:
	push	{r4, lr}
	add	r4, r0, #0
	bl	getLanguage
	ldr	r1, .L8057064
	lsl	r0, r0, #0x2
	add	r0, r0, r1
	ldr	r0, [r0]
	lsl	r4, r4, #0x2
	add	r4, r4, r0
	ldr	r0, [r4]
	pop	{r4}
	pop	{r1}
	bx	r1
.L8057064:
	.align	2, 0

	.4byte	ItemNames
	thumb_func_end sub_8057048

.align 2, 0 @ Don't pad with nop.
