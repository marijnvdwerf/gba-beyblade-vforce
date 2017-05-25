	.include "asm/common.inc"

	thumb_func_start sub_8056610
sub_8056610:
	push	{r4, r5, r6, r7, lr}
	add	r7, r1, #0
	add	r4, r2, #0
	add	r5, r3, #0
	ldr	r6, [r4]
	mov	r0, #0xda
	lsl	r0, r0, #0x1
	add	r2, r4, r0
	ldr	r1, [r5, #0x8]
	ldr	r0, [r2]
	cmp	r1, r0
	ble	.L1	@cond_branch
	str	r1, [r2]
.L1:
	mov	r0, #0x2
	ldrb	r1, [r5, #0xc]
	and	r0, r0, r1
	lsl	r0, r0, #0x18
	lsr	r1, r0, #0x18
	cmp	r1, #0
	bne	.L2	@cond_branch
	add	r0, r4, #0
	add	r0, r0, #0xe4
	str	r1, [r0]
	b	.L25
.L2:
	ldr	r0, [r6, #0xc]
	ldr	r1, [r6, #0x48]
	add	r0, r0, r1
	ldr	r1, [r5, #0x8]
	cmp	r0, r1
	ble	.L4	@cond_branch
	add	r1, r4, #0
	add	r1, r1, #0xe4
	mov	r0, #0x0
	str	r0, [r1]
	b	.L25
.L4:
	add	r2, r4, #0
	add	r2, r2, #0xe8
	ldr	r0, [r2]
	add	r1, r4, #0
	add	r1, r1, #0xe4
	cmp	r7, r0
	beq	.L6	@cond_branch
	ldr	r0, [r1]
	str	r0, [r2]
.L6:
	str	r7, [r1]
	add	r1, r4, #0
	add	r1, r1, #0xf0
	ldr	r0, .L12
	ldr	r0, [r0]
	str	r0, [r1]
	sub	r1, r1, #0x5c
	ldr	r0, [r6, #0x48]
	str	r0, [r1]
	ldrb	r0, [r7, #0xf]
	cmp	r0, #0x81
	beq	.L7	@cond_branch
	cmp	r0, #0x85
	beq	.L8	@cond_branch
	mov	r0, #0x1
	ldrb	r2, [r5, #0xc]
	and	r0, r0, r2
	cmp	r0, #0
	beq	.L9	@cond_branch
	mov	r0, #0xd
	ldsb	r0, [r5, r0]
	cmp	r0, #0
	blt	.L10	@cond_branch
	b	.L11
.L13:
	.align	2, 0
.L12:
	.4byte	0x3000e30
.L7:
	mov	r0, #0xb8
	lsl	r0, r0, #0x1
	add	r1, r4, r0
	ldr	r0, [r5, #0x18]
	str	r0, [r1]
	mov	r2, #0xba
	lsl	r2, r2, #0x1
	add	r1, r4, r2
	ldr	r0, [r5, #0x1c]
	str	r0, [r1]
	mov	r0, #0xb6
	lsl	r0, r0, #0x1
	add	r1, r4, r0
	ldr	r0, [r5, #0x14]
	str	r0, [r1]
	ldr	r0, [r5, #0x20]
	str	r0, [r4, #0x30]
	ldr	r0, [r5, #0x24]
	b	.L14
.L8:
	mov	r2, #0xb8
	lsl	r2, r2, #0x1
	add	r1, r4, r2
	ldr	r0, [r5, #0x18]
	str	r0, [r1]
	mov	r0, #0xba
	lsl	r0, r0, #0x1
	add	r1, r4, r0
	ldr	r0, [r5, #0x1c]
	str	r0, [r1]
	sub	r2, r2, #0x4
	add	r1, r4, r2
	ldr	r0, [r5, #0x14]
	str	r0, [r1]
	b	.L15
.L11:
	mov	r0, #0xb8
	lsl	r0, r0, #0x1
	add	r1, r4, r0
	mov	r0, #0xd
	ldsb	r0, [r5, r0]
	str	r0, [r1]
	mov	r2, #0xba
	lsl	r2, r2, #0x1
	add	r1, r4, r2
	ldr	r0, [r4, #0x28]
	asr	r0, r0, #0x8
	str	r0, [r1]
	mov	r0, #0xb6
	lsl	r0, r0, #0x1
	add	r1, r4, r0
	mov	r0, #0x0
	b	.L19
.L10:
	mov	r2, #0xb8
	lsl	r2, r2, #0x1
	add	r1, r4, r2
	mov	r0, #0xd
	ldsb	r0, [r5, r0]
	NEG	r0, r0
	str	r0, [r1]
	mov	r0, #0xba
	lsl	r0, r0, #0x1
	add	r1, r4, r0
	ldr	r0, [r4, #0x28]
	NEG	r0, r0
	asr	r0, r0, #0x8
	str	r0, [r1]
	sub	r2, r2, #0x4
	add	r1, r4, r2
	mov	r0, #0x80
	b	.L19
.L9:
	mov	r2, #0xe
	ldsb	r2, [r5, r2]
	NEG	r1, r2
	cmp	r1, #0
	blt	.L18	@cond_branch
	mov	r2, #0xb8
	lsl	r2, r2, #0x1
	add	r0, r4, r2
	str	r1, [r0]
	mov	r0, #0xba
	lsl	r0, r0, #0x1
	add	r1, r4, r0
	ldr	r0, [r4, #0x34]
	NEG	r0, r0
	asr	r0, r0, #0x8
	str	r0, [r1]
	sub	r2, r2, #0x4
	add	r1, r4, r2
	mov	r0, #0x40
	b	.L19
.L18:
	mov	r1, #0xb8
	lsl	r1, r1, #0x1
	add	r0, r4, r1
	str	r2, [r0]
	mov	r2, #0xba
	lsl	r2, r2, #0x1
	add	r1, r4, r2
	ldr	r0, [r4, #0x34]
	asr	r0, r0, #0x8
	str	r0, [r1]
	mov	r0, #0xb6
	lsl	r0, r0, #0x1
	add	r1, r4, r0
	mov	r0, #0xc0
.L19:
	str	r0, [r1]
	mov	r0, #0xd
	ldsb	r0, [r5, r0]
	lsl	r0, r0, #0x8
	str	r0, [r4, #0x30]
	mov	r0, #0xe
	ldsb	r0, [r5, r0]
	lsl	r0, r0, #0x8
.L14:
	str	r0, [r4, #0x3c]
.L15:
	mov	r0, #0x0
	str	r0, [r4, #0x74]
	add	r0, r4, #0
	add	r0, r0, #0xe0
	str	r7, [r0]
	ldr	r1, [r6, #0x48]
	ldr	r0, .L23
	cmp	r1, r0
	bge	.L20	@cond_branch
	mov	r0, #0x56
	mul	r0, r0, r1
	asr	r0, r0, #0x8
	NEG	r0, r0
	str	r0, [r6, #0x48]
	mov	r0, #0x3
	bl	sub_804ABFC
	mov	r1, #0x80
	lsl	r1, r1, #0x13
	add	r0, r4, #0
	bl	RiderHasFlag
	lsl	r0, r0, #0x18
	cmp	r0, #0
	bne	.L22	@cond_branch
	bl	sub_80558B8
	b	.L22
.L24:
	.align	2, 0
.L23:
	.4byte	0xfffffd00
.L20:
	add	r0, r4, #0
	mov	r1, #0x2
	bl	UnsetRiderFlag
.L22:
	ldr	r0, [r5, #0x8]
	str	r0, [r6, #0xc]
	add	r0, r4, #0
	mov	r1, #0x2
	bl	RiderHasFlag
	lsl	r0, r0, #0x18
	lsr	r0, r0, #0x18
	cmp	r0, #0
	bne	.L25	@cond_branch
	str	r0, [r6, #0x48]
	add	r0, r4, #0
	add	r1, r7, #0
	bl	sub_804E124
.L25:
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
	thumb_func_end sub_8056610

.align 2, 0 @ Don't pad with nop.
