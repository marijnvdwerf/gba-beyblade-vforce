	.include "asm/common.inc"

	thumb_func_start sub_8055734
sub_8055734:
	push	{r4, r5, r6, r7, lr}
	add	sp, sp, #0xfffffffc
	add	r3, r0, #0
	add	r4, r1, #0
	add	r7, r2, #0
	ldr	r0, .L2
	ldr	r0, [r0]
	ldr	r1, .L2 + 4
	add	r6, r0, r1
	ldr	r5, [r0]
	ldr	r0, .L2 + 8
	add	r2, r0, #0
	cmp	r3, #0x8
	bhi	.L30	@cond_branch
	lsl	r0, r3, #0x2
	ldr	r1, .L2 + 12
	add	r0, r0, r1
	ldr	r0, [r0]
	mov	pc, r0
.L3:
	.align	2, 0
.L2:
	.4byte	0x3000fb0
	.4byte	0x1084
	.4byte	0x8078a08
	.4byte	.L4
.L4:
	.4byte	.L5
	.4byte	.L6
	.4byte	.L7
	.4byte	.L8
	.4byte	.L13
	.4byte	.L10
	.4byte	.L11
	.4byte	.L12
	.4byte	.L13
.L5:
	add	r0, r2, #0
	b	.L30
.L6:
	ldr	r0, .L16
	b	.L30
.L17:
	.align	2, 0
.L16:
	.4byte	0x8078a98
.L7:
	ldr	r0, .L19
	b	.L30
.L20:
	.align	2, 0
.L19:
	.4byte	0x8078b28
.L8:
	ldr	r0, .L22
	b	.L30
.L23:
	.align	2, 0
.L22:
	.4byte	0x8078bb8
.L10:
	ldr	r0, .L25
	b	.L30
.L26:
	.align	2, 0
.L25:
	.4byte	0x8078cd8
.L11:
	ldr	r0, .L28
	b	.L30
.L29:
	.align	2, 0
.L28:
	.4byte	0x8078d68
.L12:
	ldr	r0, .L31
	b	.L30
.L32:
	.align	2, 0
.L31:
	.4byte	0x8078df8
.L13:
	ldr	r0, .L35
.L30:
	cmp	r4, #0
	beq	.L33	@cond_branch
	ldr	r1, [r4, #0x4]
	ldr	r2, [r4, #0x8]
	ldr	r3, [r4, #0xc]
	str	r0, [sp]
	add	r0, r6, #0
	bl	sub_804C3D4
	b	.L34
.L36:
	.align	2, 0
.L35:
	.4byte	0x8078c48
.L33:
	ldr	r1, [r5, #0x4]
	ldr	r2, [r5, #0x8]
	ldr	r3, [r5, #0xc]
	str	r0, [sp]
	add	r0, r6, #0
	bl	sub_804C3D4
.L34:
	cmp	r7, #0
	bne	.L37	@cond_branch
	cmp	r4, #0
	beq	.L38	@cond_branch
	ldr	r1, [r4, #0x4]
	ldr	r2, [r4, #0x8]
	ldr	r3, [r4, #0xc]
	b	.L39
.L38:
	ldr	r1, [r5, #0x4]
	ldr	r2, [r5, #0x8]
	ldr	r3, [r5, #0xc]
.L39:
	add	r0, r6, #0
	bl	sub_804C34C
	b	.L40
.L37:
	ldr	r1, [r7, #0x4]
	ldr	r2, [r7, #0x8]
	ldr	r3, [r7, #0xc]
	add	r0, r6, #0
	bl	sub_804C34C
.L40:
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
