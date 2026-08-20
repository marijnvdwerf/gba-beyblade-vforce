	.include "asm/common.inc"

	thumb_func_start sub_80573FC
sub_80573FC:
	push	{r4, lr}
	add	r4, r0, #0
	bl	getLanguage
	ldr	r1, .L8057418
	lsl	r0, r0, #0x2
	add	r0, r0, r1
	ldr	r0, [r0]
	lsl	r4, r4, #0x2
	add	r4, r4, r0
	ldr	r0, [r4]
	pop	{r4}
	pop	{r1}
	bx	r1
.L8057418:
	.align	2, 0

	.4byte	_807C49C
	thumb_func_end sub_80573FC

.align 2, 0 @ Don't pad with nop.
