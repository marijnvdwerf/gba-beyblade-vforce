	.include "asm/common.inc"

	thumb_func_start sub_8057FAC
sub_8057FAC:
	push	{r4, r5, r6, r7, lr}
	mov	r7, r8
	push	{r7}
	add	r6, r0, #0
	mov	r8, r1
	add	r4, r2, #0
	add	r5, r3, #0
	ldr	r7, [sp, #0x18]
	mov	r2, #0xc4
	bl	sub_8067A2C
	lsl	r4, r4, #0x8
	str	r4, [r6, #0x4]
	lsl	r5, r5, #0x8
	str	r5, [r6, #0x8]
	str	r7, [r6, #0xc]
	mov	r0, r8
	str	r0, [r6, #0x6c]
	pop	{r3}
	mov	r8, r3
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
	thumb_func_end sub_8057FAC

.align 2, 0 @ Don't pad with nop.
