	.include "asm/common.inc"

	thumb_func_start sub_804F824
sub_804F824:
	add	r1, r0, #0
	ldr	r0, .L3
	ldr	r0, [r0]
	ldr	r2, .L3 + 4
	cmp	r1, r2
	ble	.L1	@cond_branch
	add	r1, r2, #0
.L1:
	cmp	r1, #0
	bge	.L2	@cond_branch
	mov	r1, #0x0
.L2:
	ldr	r2, .L3 + 8
	add	r0, r0, r2
	strh	r1, [r0]
	bx	lr
.L4:
	.align	2, 0
.L3:
	.4byte	0x3000fb0
	.4byte	0xffff
	.4byte	0x107a
	thumb_func_end sub_804F824

.align 2, 0 @ Don't pad with nop.
