	.include "asm/common.inc"

	thumb_func_start sub_804F800
sub_804F800:
	add	r1, r0, #0
	ldr	r0, .L804F81C
	ldr	r0, [r0]
	cmp	r1, #0
	bge	.L804F80C	@cond_branch
	mov	r1, #0x0
.L804F80C:
	cmp	r1, #0x5
	ble	.L804F812	@cond_branch
	mov	r1, #0x5
.L804F812:
	ldr	r2, .L804F81C + 4
	add	r0, r0, r2
	strb	r1, [r0]
	bx	lr
.L804F81A:
	.align	2, 0
.L804F81C:
	.4byte	_gameData
	.4byte	0x107c
	thumb_func_end sub_804F800

.align 2, 0 @ Don't pad with nop.
