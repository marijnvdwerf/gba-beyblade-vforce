	.include "asm/common.inc"

	thumb_func_start sub_804AECC
sub_804AECC:
	push	{r4, lr}
	add	r3, r0, #0
	ldr	r0, .L2
	ldr	r2, [r0]
	ldr	r1, .L2 + 4
	add	r0, r2, r1
	mov	r4, #0x0
	ldsh	r1, [r0, r4]
	mov	r0, #0x1
	NEG	r0, r0
	cmp	r1, r0
	beq	.L1	@cond_branch
	ldr	r1, .L2 + 8
	add	r0, r2, r1
	ldr	r0, [r0]
	add	r1, r3, #0
	bl	Sound_8062AF4
.L1:
	pop	{r4}
	pop	{r0}
	bx	r0
.L3:
	.align	2, 0
.L2:
	.4byte	0x3000fb0
	.4byte	0xc24
	.4byte	0xc28
	thumb_func_end sub_804AECC

.align 2, 0 @ Don't pad with nop.
