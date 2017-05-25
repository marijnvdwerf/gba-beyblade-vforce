	.include "asm/common.inc"

	thumb_func_start sub_8049A24
sub_8049A24:
	push	{r4, r5, r6, lr}
	mov	r0, #0x0
	bl	sub_8049344
	ldr	r1, .L2
	mov	r0, #0x0
	strh	r0, [r1]
	ldr	r5, .L2 + 4
	add	r0, r5, #0
	bl	sub_80508A4
	ldr	r0, .L2 + 8
	add	r6, r5, r0
	ldr	r0, [r6]
	ldr	r0, [r0]
	lsl	r1, r0, #0x5
	add	r1, r1, r0
	lsl	r1, r1, #0x2
	ldr	r4, .L2 + 12
	add	r1, r1, r4
	add	r0, r5, #0
	mov	r2, #0x0
	bl	sub_80508CC
	ldr	r0, [r6]
	ldr	r1, [r0]
	lsl	r0, r1, #0x5
	add	r0, r0, r1
	lsl	r0, r0, #0x2
	add	r4, r4, #0x7c
	add	r0, r0, r4
	ldr	r0, [r0]
	cmp	r0, #0
	beq	.L1	@cond_branch
	bl	loadPalette2
.L1:
	pop	{r4, r5, r6}
	pop	{r0}
	bx	r0
.L3:
	.align	2, 0
.L2:
	.4byte	0x4000054
	.4byte	0x3000be0
	.4byte	0xfffffb24
	.4byte	0x806a828
	thumb_func_end sub_8049A24

.align 2, 0 @ Don't pad with nop.
