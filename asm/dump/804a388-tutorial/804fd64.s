	.include "asm/common.inc"

	thumb_func_start sub_804FD64
sub_804FD64:
	push	{r4, r5, r6, lr}
	ldr	r0, .L804FDF4
	ldr	r5, [r0]
	mov	r0, #0xf5
	lsl	r0, r0, #0x4
	add	r6, r5, r0
	ldr	r1, .L804FDF4 + 4
	add	r4, r5, r1
	mov	r0, #0x2
	ldrh	r1, [r4]
	and	r0, r0, r1
	cmp	r0, #0
	beq	.L804FD94	@cond_branch
	add	r0, r6, #0
	bl	sub_8061228
	ldr	r1, .L804FDF4 + 8
	add	r0, r5, r1
	bl	sub_8050584
	ldr	r0, .L804FDF4 + 12
	ldrh	r1, [r4]
	and	r0, r0, r1
	strh	r0, [r4]
.L804FD94:
	mov	r0, #0x4
	ldrh	r1, [r4]
	and	r0, r0, r1
	cmp	r0, #0
	beq	.L804FDB8	@cond_branch
	mov	r1, #0xf8
	lsl	r1, r1, #0x4
	add	r0, r5, r1
	bl	sub_8061228
	ldr	r1, .L804FDF4 + 16
	add	r0, r5, r1
	bl	sub_8050584
	ldr	r0, .L804FDF4 + 20
	ldrh	r1, [r4]
	and	r0, r0, r1
	strh	r0, [r4]
.L804FDB8:
	mov	r0, #0x10
	ldrh	r1, [r4]
	and	r0, r0, r1
	cmp	r0, #0
	beq	.L804FDD0	@cond_branch
	add	r0, r6, #0
	bl	sub_8061228
	ldr	r0, .L804FDF4 + 24
	ldrh	r1, [r4]
	and	r0, r0, r1
	strh	r0, [r4]
.L804FDD0:
	mov	r0, #0x20
	ldrh	r1, [r4]
	and	r0, r0, r1
	cmp	r0, #0
	beq	.L804FDEC	@cond_branch
	mov	r1, #0xf8
	lsl	r1, r1, #0x4
	add	r0, r5, r1
	bl	sub_8061228
	ldr	r0, .L804FDF4 + 28
	ldrh	r1, [r4]
	and	r0, r0, r1
	strh	r0, [r4]
.L804FDEC:
	pop	{r4, r5, r6}
	pop	{r0}
	bx	r0
.L804FDF2:
	.align	2, 0
.L804FDF4:
	.4byte	_gameData
	.4byte	0x105e
	.4byte	0x1010
	.4byte	0xfffd
	.4byte	0x1028
	.4byte	0xfffb
	.4byte	0xffef
	.4byte	0xffdf
	thumb_func_end sub_804FD64

.align 2, 0 @ Don't pad with nop.
