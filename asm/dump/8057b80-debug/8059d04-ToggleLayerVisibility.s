	.include "asm/common.inc"

	thumb_func_start ToggleLayerVisibility
ToggleLayerVisibility:
	lsl	r0, r0, #0x18
	lsr	r0, r0, #0x18
	add	r2, r0, #0
	lsl	r1, r1, #0x18
	cmp	r1, #0
	beq	.L1	@cond_branch
	cmp	r0, #0x1
	beq	.L2	@cond_branch
	cmp	r0, #0x1
	bgt	.L3	@cond_branch
	cmp	r0, #0
	beq	.L4	@cond_branch
	b	.L19
.L3:
	cmp	r0, #0x2
	beq	.L6	@cond_branch
	cmp	r0, #0x3
	beq	.L7	@cond_branch
	b	.L19
.L4:
	mov	r0, #0x80
	lsl	r0, r0, #0x13
	ldrh	r1, [r0]
	mov	r3, #0x80
	lsl	r3, r3, #0x1
	b	.L11
.L2:
	mov	r0, #0x80
	lsl	r0, r0, #0x13
	ldrh	r1, [r0]
	mov	r3, #0x80
	lsl	r3, r3, #0x2
	b	.L11
.L6:
	mov	r0, #0x80
	lsl	r0, r0, #0x13
	ldrh	r1, [r0]
	mov	r3, #0x80
	lsl	r3, r3, #0x3
	b	.L11
.L7:
	mov	r0, #0x80
	lsl	r0, r0, #0x13
	ldrh	r1, [r0]
	mov	r3, #0x80
	lsl	r3, r3, #0x4
.L11:
	add	r2, r3, #0
	orr	r1, r1, r2
	strh	r1, [r0]
	b	.L19
.L1:
	cmp	r0, #0x1
	beq	.L13	@cond_branch
	cmp	r0, #0x1
	bgt	.L14	@cond_branch
	cmp	r0, #0
	beq	.L15	@cond_branch
	b	.L19
.L14:
	cmp	r2, #0x2
	beq	.L17	@cond_branch
	cmp	r2, #0x3
	beq	.L18	@cond_branch
	b	.L19
.L15:
	mov	r2, #0x80
	lsl	r2, r2, #0x13
	ldrh	r1, [r2]
	ldr	r0, .L21
	b	.L26
.L22:
	.align	2, 0
.L21:
	.4byte	0xfeff
.L13:
	mov	r2, #0x80
	lsl	r2, r2, #0x13
	ldrh	r1, [r2]
	ldr	r0, .L24
	b	.L26
.L25:
	.align	2, 0
.L24:
	.4byte	0xfdff
.L17:
	mov	r2, #0x80
	lsl	r2, r2, #0x13
	ldrh	r1, [r2]
	ldr	r0, .L27
	b	.L26
.L28:
	.align	2, 0
.L27:
	.4byte	0xfbff
.L18:
	mov	r2, #0x80
	lsl	r2, r2, #0x13
	ldrh	r1, [r2]
	ldr	r0, .L29
.L26:
	and	r0, r0, r1
	strh	r0, [r2]
.L19:
	bx	lr
.L30:
	.align	2, 0
.L29:
	.4byte	0xf7ff
	thumb_func_end ToggleLayerVisibility

.align 2, 0 @ Don't pad with nop.
