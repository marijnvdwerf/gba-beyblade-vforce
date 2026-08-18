	.include "asm/common.inc"

	thumb_func_start sub_8050E80
sub_8050E80:
	push	{r4, r5, r6, r7, lr}
	add	r6, r0, #0
	ldr	r2, [r6, #0x4]
	lsl	r0, r2, #0x3
	sub	r0, r0, r2
	lsl	r0, r0, #0x2
	ldr	r1, [r6, #0x28]
	add	r4, r1, r0
	add	r7, r2, #1
	mov	r0, #0x1
	ldrh	r1, [r6, #0x3c]
	and	r0, r0, r1
	cmp	r0, #0
	bne	.L8050F02	@cond_branch
	mov	r0, #0x7
	bl	sub_804ABFC
	ldr	r0, [r6]
	cmp	r7, r0
	blt	.L8050EAA	@cond_branch
	mov	r7, #0x0
.L8050EAA:
	lsl	r0, r7, #0x3
	sub	r0, r0, r7
	lsl	r0, r0, #0x2
	ldr	r1, [r6, #0x28]
	add	r5, r1, r0
	ldr	r0, [r5, #0x4]
	cmp	r0, #0
	beq	.L8050EC0	@cond_branch
	mov	r1, #0x1
	bl	sub_8061078
.L8050EC0:
	ldr	r0, [r4, #0x4]
	cmp	r0, #0
	beq	.L8050ECC	@cond_branch
	mov	r1, #0x2
	bl	sub_8061078
.L8050ECC:
	ldr	r0, [r4]
	ldr	r0, [r0, #0x20]
	str	r0, [r4, #0x14]
	ldr	r4, [r5]
	ldr	r0, [r4, #0x24]
	str	r0, [r5, #0x14]
	ldr	r0, [r6, #0xc]
	add	r1, r7, #0
	mul	r1, r1, r0
	ldr	r0, .L8050F08
	sub	r0, r0, r1
	str	r0, [r6, #0x14]
	str	r7, [r6, #0x4]
	add	r5, r6, #0
	add	r5, r5, #0x40
	bl	getLanguage
	lsl	r0, r0, #0x2
	add	r4, r4, #0x4
	add	r4, r4, r0
	ldr	r1, [r4]
	ldr	r0, [r6, #0x2c]
	ldr	r0, [r0]
	ldrb	r2, [r0, #0xa]
	add	r0, r5, #0
	bl	sub_8061660
.L8050F02:
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L8050F08:
	.align	2, 0

	.4byte	0xffff
	thumb_func_end sub_8050E80

.align 2, 0 @ Don't pad with nop.
