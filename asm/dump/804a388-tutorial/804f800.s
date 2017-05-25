	.include "asm/common.inc"

	thumb_func_start sub_804F800
sub_804F800:
	add	r1, r0, #0
	ldr	r0, .L3
	ldr	r0, [r0]
	cmp	r1, #0
	bge	.L1	@cond_branch
	mov	r1, #0x0
.L1:
	cmp	r1, #0x5
	ble	.L2	@cond_branch
	mov	r1, #0x5
.L2:
	ldr	r2, .L3 + 4
	add	r0, r0, r2
	strb	r1, [r0]
	bx	lr
.L4:
	.align	2, 0
.L3:
	.4byte	0x3000fb0
	.4byte	0x107c
	thumb_func_end sub_804F800

.align 2, 0 @ Don't pad with nop.
