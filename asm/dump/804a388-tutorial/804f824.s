	.include "asm/common.inc"

	thumb_func_start sub_804F824
sub_804F824:
	add	r1, r0, #0
	ldr	r0, .L804F840
	ldr	r0, [r0]
	ldr	r2, .L804F840 + 4
	cmp	r1, r2
	ble	.L804F832	@cond_branch
	add	r1, r2, #0
.L804F832:
	cmp	r1, #0
	bge	.L804F838	@cond_branch
	mov	r1, #0x0
.L804F838:
	ldr	r2, .L804F840 + 8
	add	r0, r0, r2
	strh	r1, [r0]
	bx	lr
.L804F840:
	.align	2, 0

	.4byte	_gameData
	.4byte	0xffff
	.4byte	0x107a
	thumb_func_end sub_804F824

.align 2, 0 @ Don't pad with nop.
