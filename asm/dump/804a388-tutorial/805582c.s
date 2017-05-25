	.include "asm/common.inc"

	thumb_func_start sub_805582C
sub_805582C:
	push	{r4, r5, r6, r7, lr}
	mov	r7, r9
	mov	r6, r8
	push	{r6, r7}
	add	sp, sp, #0xfffffffc
	add	r4, r1, #0
	mov	r8, r2
	mov	r9, r3
	ldr	r0, .L3
	ldr	r0, [r0]
	ldr	r1, .L3 + 4
	add	r6, r0, r1
	ldr	r7, .L3 + 8
	ldr	r5, [r0]
	cmp	r4, #0
	beq	.L1	@cond_branch
	ldr	r1, [r4, #0x4]
	ldr	r2, [r4, #0x8]
	ldr	r3, [r4, #0xc]
	str	r7, [sp]
	add	r0, r6, #0
	bl	sub_804C3D4
	b	.L2
.L4:
	.align	2, 0
.L3:
	.4byte	0x3000fb0
	.4byte	0x1084
	.4byte	0x8078e88
.L1:
	ldr	r1, [r5, #0x4]
	ldr	r2, [r5, #0x8]
	ldr	r3, [r5, #0xc]
	str	r7, [sp]
	add	r0, r6, #0
	bl	sub_804C3D4
.L2:
	ldr	r1, [r5, #0x4]
	ldr	r2, [r5, #0x8]
	ldr	r3, [r5, #0xc]
	add	r0, r6, #0
	bl	sub_804C34C
	add	r0, r6, #0
	mov	r1, r8
	mov	r2, r9
	ldr	r3, [sp, #0x20]
	bl	sub_804C354
	add	sp, sp, #0x4
	pop	{r3, r4}
	mov	r8, r3
	mov	r9, r4
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
	thumb_func_end sub_805582C

.align 2, 0 @ Don't pad with nop.
