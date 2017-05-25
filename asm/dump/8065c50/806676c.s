	.include "asm/common.inc"

	thumb_func_start sub_806676C
sub_806676C:
	push	{r4, r5, r6, lr}
	add	sp, sp, #0xffffffd8
	str	r0, [sp, #0x20]
	str	r1, [sp, #0x24]
	add	r0, sp, #0x20
	mov	r1, sp
	bl	sub_80663B0
	add	r0, sp, #0x24
	add	r5, sp, #0x10
	add	r1, r5, #0
	bl	sub_80663B0
	mov	r4, sp
	mov	r0, #0x0
	ldr	r3, [sp]
	cmp	r3, #0x1
	bhi	.L1	@cond_branch
	mov	r0, #0x1
.L1:
	cmp	r0, #0
	beq	.L2	@cond_branch
	mov	r1, sp
	b	.L17
.L2:
	mov	r0, #0x0
	ldr	r2, [sp, #0x10]
	add	r6, r2, #0
	cmp	r2, #0x1
	bhi	.L4	@cond_branch
	mov	r0, #0x1
.L4:
	cmp	r0, #0
	beq	.L5	@cond_branch
	add	r1, r5, #0
	b	.L17
.L5:
	ldr	r0, [sp, #0x4]
	ldr	r1, [sp, #0x14]
	EOR	r0, r1
	str	r0, [sp, #0x4]
	mov	r0, #0x0
	cmp	r3, #0x4
	bne	.L7	@cond_branch
	mov	r0, #0x1
.L7:
	cmp	r0, #0
	bne	.L8	@cond_branch
	mov	r0, #0x0
	cmp	r3, #0x2
	bne	.L9	@cond_branch
	mov	r0, #0x1
.L9:
	cmp	r0, #0
	beq	.L10	@cond_branch
.L8:
	ldr	r0, [r4]
	add	r1, r4, #0
	cmp	r0, r6
	bne	.L17	@cond_branch
	ldr	r1, .L13
	b	.L17
.L14:
	.align	2, 0
.L13:
	.4byte	0x3000db8
.L10:
	mov	r1, #0x0
	cmp	r2, #0x4
	bne	.L15	@cond_branch
	mov	r1, #0x1
.L15:
	cmp	r1, #0
	beq	.L16	@cond_branch
	str	r0, [sp, #0xc]
	str	r0, [sp, #0x8]
	mov	r1, sp
	b	.L17
.L16:
	mov	r0, #0x0
	cmp	r2, #0x2
	bne	.L18	@cond_branch
	mov	r0, #0x1
.L18:
	cmp	r0, #0
	beq	.L19	@cond_branch
	mov	r0, #0x4
	str	r0, [r4]
	b	.L20
.L19:
	ldr	r1, [r4, #0x8]
	ldr	r0, [sp, #0x18]
	sub	r0, r1, r0
	str	r0, [r4, #0x8]
	ldr	r2, [r4, #0xc]
	ldr	r3, [sp, #0x1c]
	cmp	r2, r3
	bcs	.L21	@cond_branch
	lsl	r2, r2, #0x1
	sub	r0, r0, #0x1
	str	r0, [r4, #0x8]
.L21:
	mov	r0, #0x80
	lsl	r0, r0, #0x17
	mov	r1, #0x0
.L23:
	cmp	r2, r3
	bcc	.L22	@cond_branch
	orr	r1, r1, r0
	sub	r2, r2, r3
.L22:
	lsr	r0, r0, #0x1
	lsl	r2, r2, #0x1
	cmp	r0, #0
	bne	.L23	@cond_branch
	mov	r0, #0x7f
	and	r0, r0, r1
	cmp	r0, #0x40
	bne	.L26	@cond_branch
	mov	r0, #0x80
	and	r0, r0, r1
	cmp	r0, #0
	bne	.L25	@cond_branch
	cmp	r2, #0
	beq	.L26	@cond_branch
.L25:
	add	r1, r1, #0x40
.L26:
	str	r1, [r4, #0xc]
.L20:
	add	r1, r4, #0
.L17:
	add	r0, r1, #0
	bl	sub_80662F8
	add	sp, sp, #0x28
	pop	{r4, r5, r6, pc}
	thumb_func_end sub_806676C

.align 2, 0 @ Don't pad with nop.
