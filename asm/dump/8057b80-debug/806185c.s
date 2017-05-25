	.include "asm/common.inc"

	thumb_func_start sub_806185C
sub_806185C:
	push	{r4, r5, r6, lr}
	lsl	r1, r1, #0x18
	lsr	r6, r1, #0x18
	ldr	r5, [r0, #0x14]
	ldr	r4, [r0, #0x1c]
	b	.L1
.L2:
	add	r0, r5, #0
	add	r1, r6, #0
	bl	sub_8061168
	ldr	r5, [r5, #0x4]
.L1:
	add	r0, r4, #0
	sub	r4, r4, #0x1
	cmp	r0, #0
	bne	.L2	@cond_branch
	pop	{r4, r5, r6}
	pop	{r0}
	bx	r0
	thumb_func_end sub_806185C

.align 2, 0 @ Don't pad with nop.
