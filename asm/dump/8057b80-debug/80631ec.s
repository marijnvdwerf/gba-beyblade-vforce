	.include "asm/common.inc"

	thumb_func_start sub_80631EC
sub_80631EC:
	push	{r4, r5, lr}
	add	r4, r0, #0
	add	r5, r1, #0
	add	r1, r2, #0
	mov	r2, #0x8
	ldsh	r0, [r4, r2]
	cmp	r1, r0
	bge	.L1	@cond_branch
	ldr	r3, .L2
	ldrh	r2, [r4, #0x6]
	mul	r1, r1, r2
	lsl	r1, r1, #0x1
	ldr	r0, [r4, #0xc]
	add	r0, r0, r1
	ldrh	r4, [r4, #0x4]
	lsl	r1, r4, #0x1
	add	r1, r5, r1
	lsl	r2, r2, #0x1
	ldr	r3, [r3]
	bl	_call_via_r3
.L1:
	pop	{r4, r5}
	pop	{r0}
	bx	r0
.L3:
	.align	2, 0
.L2:
	.4byte	0x807d974
	thumb_func_end sub_80631EC

.align 2, 0 @ Don't pad with nop.
