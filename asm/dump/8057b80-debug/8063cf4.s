	.include "asm/common.inc"

	thumb_func_start sub_8063CF4
sub_8063CF4:
	push	{r4, lr}
	add	r2, r0, #0
	add	r0, r0, #0xac
	mov	r1, #0x0
	str	r1, [r0]
	add	r0, r0, #0x4
	str	r1, [r0]
	add	r0, r0, #0xe
	strb	r1, [r0]
	add	r3, r2, #0
	add	r3, r3, #0xbc
	ldrh	r0, [r3]
	add	r0, r0, #0x1
	strh	r0, [r3]
	add	r0, r2, #0
	add	r0, r0, #0xc0
	strb	r1, [r0]
	add	r1, r2, #0
	add	r1, r1, #0xc8
	add	r0, r0, #0x2c
	ldr	r0, [r0]
	str	r0, [r1]
	add	r0, r2, #0
	add	r0, r0, #0xe8
	ldr	r4, [r0]
	cmp	r4, #0
	beq	.L1	@cond_branch
	ldrh	r1, [r3]
	add	r0, r2, #0
	bl	_call_via_r4
.L1:
	pop	{r4}
	pop	{r0}
	bx	r0
	thumb_func_end sub_8063CF4

.align 2, 0 @ Don't pad with nop.
