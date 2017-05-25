	.include "asm/common.inc"

	thumb_func_start actor_80585F8
actor_80585F8:
	push	{r4, lr}
	mov	ip, r0
	ldr	r4, [sp, #0x8]
	add	r0, r0, #0xa8
	strh	r1, [r0]
	add	r0, r0, #0x2
	strh	r2, [r0]
	add	r0, r0, #0x2
	strh	r3, [r0]
	add	r0, r0, #0x2
	strh	r4, [r0]
	pop	{r4}
	pop	{r0}
	bx	r0
	thumb_func_end actor_80585F8

.align 2, 0 @ Don't pad with nop.
