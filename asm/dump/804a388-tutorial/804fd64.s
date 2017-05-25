	.include "asm/common.inc"

	thumb_func_start sub_804FD64
sub_804FD64:
	push	{r4, r5, r6, lr}
	ldr	r0, .L5
	ldr	r5, [r0]
	mov	r0, #0xf5
	lsl	r0, r0, #0x4
	add	r6, r5, r0
	ldr	r1, .L5 + 4
	add	r4, r5, r1
	mov	r0, #0x2
	ldrh	r1, [r4]
	and	r0, r0, r1
	cmp	r0, #0
	beq	.L1	@cond_branch
	add	r0, r6, #0
	bl	sub_8061228
	ldr	r1, .L5 + 8
	add	r0, r5, r1
	bl	sub_8050584
	ldr	r0, .L5 + 12
	ldrh	r1, [r4]
	and	r0, r0, r1
	strh	r0, [r4]
.L1:
	mov	r0, #0x4
	ldrh	r1, [r4]
	and	r0, r0, r1
	cmp	r0, #0
	beq	.L2	@cond_branch
	mov	r1, #0xf8
	lsl	r1, r1, #0x4
	add	r0, r5, r1
	bl	sub_8061228
	ldr	r1, .L5 + 16
	add	r0, r5, r1
	bl	sub_8050584
	ldr	r0, .L5 + 20
	ldrh	r1, [r4]
	and	r0, r0, r1
	strh	r0, [r4]
.L2:
	mov	r0, #0x10
	ldrh	r1, [r4]
	and	r0, r0, r1
	cmp	r0, #0
	beq	.L3	@cond_branch
	add	r0, r6, #0
	bl	sub_8061228
	ldr	r0, .L5 + 24
	ldrh	r1, [r4]
	and	r0, r0, r1
	strh	r0, [r4]
.L3:
	mov	r0, #0x20
	ldrh	r1, [r4]
	and	r0, r0, r1
	cmp	r0, #0
	beq	.L4	@cond_branch
	mov	r1, #0xf8
	lsl	r1, r1, #0x4
	add	r0, r5, r1
	bl	sub_8061228
	ldr	r0, .L5 + 28
	ldrh	r1, [r4]
	and	r0, r0, r1
	strh	r0, [r4]
.L4:
	pop	{r4, r5, r6}
	pop	{r0}
	bx	r0
.L6:
	.align	2, 0
.L5:
	.4byte	0x3000fb0
	.4byte	0x105e
	.4byte	0x1010
	.4byte	0xfffd
	.4byte	0x1028
	.4byte	0xfffb
	.4byte	0xffef
	.4byte	0xffdf
	thumb_func_end sub_804FD64

.align 2, 0 @ Don't pad with nop.
