	.include "asm/common.inc"

	thumb_func_start sub_8055734
sub_8055734:
	push	{r4, r5, r6, r7, lr}
	add	sp, sp, #0xfffffffc
	add	r3, r0, #0
	add	r4, r1, #0
	add	r7, r2, #0
	ldr	r0, .L805575C
	ldr	r0, [r0]
	ldr	r1, .L805575C + 4
	add	r6, r0, r1
	ldr	r5, [r0]
	ldr	r0, .L805575C + 8
	add	r2, r0, #0
	cmp	r3, #0x8
	bhi	.L80557C6	@cond_branch
	lsl	r0, r3, #0x2
	ldr	r1, .L805575C + 12
	add	r0, r0, r1
	ldr	r0, [r0]
	mov	pc, r0
.L805575A:
	.align	2, 0
.L805575C:
	.4byte	_gameData
	.4byte	0x1084
	.4byte	0x8078a08
	.4byte	.L805576C
.L805576C:
	.4byte	.L8055790
	.4byte	.L8055794
	.4byte	.L805579C
	.4byte	.L80557A4
	.4byte	.L80557C4
	.4byte	.L80557AC
	.4byte	.L80557B4
	.4byte	.L80557BC
	.4byte	.L80557C4
.L8055790:
	add	r0, r2, #0
	b	.L80557C6
.L8055794:
	ldr	r0, .L8055798
	b	.L80557C6
.L8055798:
	.align	2, 0

	.4byte	0x8078a98
.L805579C:
	ldr	r0, .L80557A0
	b	.L80557C6
.L80557A0:
	.align	2, 0

	.4byte	0x8078b28
.L80557A4:
	ldr	r0, .L80557A8
	b	.L80557C6
.L80557A8:
	.align	2, 0

	.4byte	0x8078bb8
.L80557AC:
	ldr	r0, .L80557B0
	b	.L80557C6
.L80557B0:
	.align	2, 0

	.4byte	0x8078cd8
.L80557B4:
	ldr	r0, .L80557B8
	b	.L80557C6
.L80557B8:
	.align	2, 0

	.4byte	0x8078d68
.L80557BC:
	ldr	r0, .L80557C0
	b	.L80557C6
.L80557C0:
	.align	2, 0

	.4byte	0x8078df8
.L80557C4:
	ldr	r0, .L80557DC
.L80557C6:
	cmp	r4, #0
	beq	.L80557E0	@cond_branch
	ldr	r1, [r4, #0x4]
	ldr	r2, [r4, #0x8]
	ldr	r3, [r4, #0xc]
	str	r0, [sp]
	add	r0, r6, #0
	bl	sub_804C3D4
	b	.L80557EE
.L80557DA:
	.align	2, 0
.L80557DC:
	.4byte	0x8078c48
.L80557E0:
	ldr	r1, [r5, #0x4]
	ldr	r2, [r5, #0x8]
	ldr	r3, [r5, #0xc]
	str	r0, [sp]
	add	r0, r6, #0
	bl	sub_804C3D4
.L80557EE:
	cmp	r7, #0
	bne	.L805580C	@cond_branch
	cmp	r4, #0
	beq	.L80557FE	@cond_branch
	ldr	r1, [r4, #0x4]
	ldr	r2, [r4, #0x8]
	ldr	r3, [r4, #0xc]
	b	.L8055804
.L80557FE:
	ldr	r1, [r5, #0x4]
	ldr	r2, [r5, #0x8]
	ldr	r3, [r5, #0xc]
.L8055804:
	add	r0, r6, #0
	bl	sub_804C34C
	b	.L8055818
.L805580C:
	ldr	r1, [r7, #0x4]
	ldr	r2, [r7, #0x8]
	ldr	r3, [r7, #0xc]
	add	r0, r6, #0
	bl	sub_804C34C
.L8055818:
	add	r0, r6, #0
	mov	r1, #0x0
	mov	r2, #0x0
	mov	r3, #0x0
	bl	sub_804C354
	add	sp, sp, #0x4
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
	thumb_func_end sub_8055734

.align 2, 0 @ Don't pad with nop.
