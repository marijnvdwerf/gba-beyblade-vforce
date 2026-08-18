	.include "asm/common.inc"

	thumb_func_start sub_804AF5C
sub_804AF5C:
	push	{r4, r5, lr}
	ldr	r5, .L804AF8C
	ldr	r2, [r5]
	ldr	r4, .L804AF8C + 4
	add	r0, r2, r4
	mov	r3, #0x0
	ldsh	r1, [r0, r3]
	mov	r0, #0x1
	NEG	r0, r0
	cmp	r1, r0
	beq	.L804AF7C	@cond_branch
	ldr	r1, .L804AF8C + 8
	add	r0, r2, r1
	ldr	r0, [r0]
	bl	Sound_8062A90
.L804AF7C:
	ldr	r0, [r5]
	add	r0, r0, r4
	ldr	r1, .L804AF8C + 12
	strh	r1, [r0]
	pop	{r4, r5}
	pop	{r0}
	bx	r0
.L804AF8A:
	.align	2, 0
.L804AF8C:
	.4byte	0x3000fb0
	.4byte	0xc26
	.4byte	0xc2c
	.4byte	0xffff
	thumb_func_end sub_804AF5C

.align 2, 0 @ Don't pad with nop.
