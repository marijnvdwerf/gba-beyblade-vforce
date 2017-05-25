	.include "asm/common.inc"

	thumb_func_start sub_8057984
sub_8057984:
	push	{r4, r5, lr}
	mov	r4, #0x0
	ldr	r5, .L2
.L1:
	ldmia	r5!, {r2}
	ldr	r0, .L2 + 4
	add	r1, r4, #0
	bl	printf
	add	r4, r4, #0x1
	cmp	r4, #0xd
	ble	.L1	@cond_branch
	pop	{r4, r5}
	pop	{r0}
	bx	r0
.L3:
	.align	2, 0
.L2:
	.4byte	0x3001110
	.4byte	0x872cb2c
	thumb_func_end sub_8057984

.align 2, 0 @ Don't pad with nop.
