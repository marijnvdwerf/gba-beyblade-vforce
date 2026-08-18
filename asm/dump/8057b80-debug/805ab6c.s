	.include "asm/common.inc"

	thumb_func_start sub_805AB6C
sub_805AB6C:
	push	{r4, r5, r6, lr}
	ldr	r0, .L805AB7C
	ldrh	r4, [r0]
	mov	r6, #0x0
	ldr	r0, .L805AB7C + 4
	ldr	r0, [r0]
	ldr	r5, [r0]
	b	.L805AB9C
.L805AB7C:
	.align	2, 0

	.4byte	0x3005db8
	.4byte	0x3005dbc
.L805AB84:
	ldrh	r1, [r5]
	ldr	r0, .L805ABAC
	bl	printf
	add	r6, r6, #0x1
	cmp	r6, #0x1e
	bne	.L805AB9A	@cond_branch
	mov	r6, #0x0
	ldr	r0, .L805ABAC + 4
	bl	printf
.L805AB9A:
	add	r5, r5, #0x2
.L805AB9C:
	add	r0, r4, #0
	sub	r4, r4, #0x1
	cmp	r0, #0
	bne	.L805AB84	@cond_branch
	pop	{r4, r5, r6}
	pop	{r0}
	bx	r0
.L805ABAA:
	.align	2, 0
.L805ABAC:
	.4byte	0x875533c
	.4byte	0x8755344
	thumb_func_end sub_805AB6C

.align 2, 0 @ Don't pad with nop.
