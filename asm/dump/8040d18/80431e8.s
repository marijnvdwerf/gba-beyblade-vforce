	.include "asm/common.inc"

	thumb_func_start sub_80431E8
sub_80431E8:
	lsl	r0, r0, #0x18
	lsr	r2, r0, #0x18
	cmp	r2, #0x1
	beq	.L80431FE	@cond_branch
	cmp	r2, #0x1
	ble	.L8043224	@cond_branch
	cmp	r2, #0x2
	beq	.L804320C	@cond_branch
	cmp	r2, #0x3
	beq	.L8043218	@cond_branch
	b	.L8043224
.L80431FE:
	ldr	r1, .L8043208
	mov	r0, #0x81
	lsl	r0, r0, #0x10
	b	.L804322A
.L8043206:
	.align	2, 0
.L8043208:
	.4byte	0x4000108
.L804320C:
	ldr	r1, .L8043214
	mov	r0, #0x82
	lsl	r0, r0, #0x10
	b	.L804322A
.L8043214:
	.align	2, 0

	.4byte	0x4000108
.L8043218:
	ldr	r1, .L8043220
	mov	r0, #0x83
	lsl	r0, r0, #0x10
	b	.L804322A
.L8043220:
	.align	2, 0

	.4byte	0x4000108
.L8043224:
	ldr	r1, .L8043234
	mov	r0, #0x80
	lsl	r0, r0, #0x10
.L804322A:
	str	r0, [r1]
	ldr	r0, .L8043234 + 4
	strb	r2, [r0]
	bx	lr
.L8043232:
	.align	2, 0
.L8043234:
	.4byte	0x4000108
	.4byte	_unk3000150
	thumb_func_end sub_80431E8

.align 2, 0 @ Don't pad with nop.
