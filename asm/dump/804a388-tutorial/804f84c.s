	.include "asm/common.inc"

	thumb_func_start sub_804F84C
sub_804F84C:
	lsl	r0, r0, #0x18
	ldr	r1, .L804F864
	ldr	r1, [r1]
	cmp	r0, #0
	beq	.L804F868	@cond_branch
	mov	r0, #0x84
	lsl	r0, r0, #0x5
	add	r1, r1, r0
	mov	r0, #0xa0
	lsl	r0, r0, #0x2
	b	.L804F870
.L804F862:
	.align	2, 0
.L804F864:
	.4byte	_gameData
.L804F868:
	mov	r0, #0x84
	lsl	r0, r0, #0x5
	add	r1, r1, r0
	ldr	r0, .L804F874
.L804F870:
	str	r0, [r1]
	bx	lr
.L804F874:
	.align	2, 0

	.4byte	0xffffd000
	thumb_func_end sub_804F84C

.align 2, 0 @ Don't pad with nop.
