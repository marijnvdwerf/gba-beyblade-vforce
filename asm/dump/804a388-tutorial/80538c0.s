	.include "asm/common.inc"

	thumb_func_start sub_80538C0
sub_80538C0:
	push	{r4, r5, lr}
	mov	r4, #0x0
	ldr	r1, .L80538E8
	ldr	r0, [r1]
	mov	r2, #0x86
	lsl	r2, r2, #0x3
	add	r0, r0, r2
	ldr	r0, [r0]
	add	r0, r0, #0x1
	cmp	r4, r0
	bge	.L8053914	@cond_branch
	ldr	r5, .L80538E8 + 4
.L80538D8:
	cmp	r4, #0
	beq	.L80538F4	@cond_branch
	ldr	r0, [r1]
	ldr	r1, .L80538E8 + 8
	add	r0, r0, r1
	ldr	r0, [r0]
	add	r0, r0, r5
	b	.L80538F8
.L80538E8:
	.align	2, 0

	.4byte	0x3000fb0
	.4byte	0xfffffbd8
	.4byte	0x42c
.L80538F4:
	ldr	r0, .L805391C
	ldr	r0, [r0]
.L80538F8:
	bl	sub_804B4A4
	mov	r2, #0x85
	lsl	r2, r2, #0x3
	add	r5, r5, r2
	add	r4, r4, #0x1
	ldr	r1, .L805391C
	ldr	r0, [r1]
	add	r2, r2, #0x8
	add	r0, r0, r2
	ldr	r0, [r0]
	add	r0, r0, #0x1
	cmp	r4, r0
	blt	.L80538D8	@cond_branch
.L8053914:
	pop	{r4, r5}
	pop	{r0}
	bx	r0
.L805391A:
	.align	2, 0
.L805391C:
	.4byte	0x3000fb0
	thumb_func_end sub_80538C0

.align 2, 0 @ Don't pad with nop.
