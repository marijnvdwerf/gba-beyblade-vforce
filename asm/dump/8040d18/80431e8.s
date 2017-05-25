	.include "asm/common.inc"

	thumb_func_start sub_80431E8
sub_80431E8:
	lsl	r0, r0, #0x18
	lsr	r2, r0, #0x18
	cmp	r2, #0x1
	beq	.L1	@cond_branch
	cmp	r2, #0x1
	ble	.L5	@cond_branch
	cmp	r2, #0x2
	beq	.L3	@cond_branch
	cmp	r2, #0x3
	beq	.L4	@cond_branch
	b	.L5
.L1:
	ldr	r1, .L7
	mov	r0, #0x81
	lsl	r0, r0, #0x10
	b	.L12
.L8:
	.align	2, 0
.L7:
	.4byte	0x4000108
.L3:
	ldr	r1, .L10
	mov	r0, #0x82
	lsl	r0, r0, #0x10
	b	.L12
.L11:
	.align	2, 0
.L10:
	.4byte	0x4000108
.L4:
	ldr	r1, .L13
	mov	r0, #0x83
	lsl	r0, r0, #0x10
	b	.L12
.L14:
	.align	2, 0
.L13:
	.4byte	0x4000108
.L5:
	ldr	r1, .L15
	mov	r0, #0x80
	lsl	r0, r0, #0x10
.L12:
	str	r0, [r1]
	ldr	r0, .L15 + 4
	strb	r2, [r0]
	bx	lr
.L16:
	.align	2, 0
.L15:
	.4byte	0x4000108
	.4byte	0x3000150
	thumb_func_end sub_80431E8

.align 2, 0 @ Don't pad with nop.
