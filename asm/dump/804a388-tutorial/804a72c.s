	.include "asm/common.inc"

	thumb_func_start sub_804A72C
sub_804A72C:
	ldr	r0, .L804A73C
	ldr	r0, [r0]
	ldr	r1, .L804A73C + 4
	add	r0, r0, r1
	mov	r1, #0x0
	str	r1, [r0]
	bx	lr
.L804A73A:
	.align	2, 0
.L804A73C:
	.4byte	_gameData
	.4byte	0x13fc
	thumb_func_end sub_804A72C

.align 2, 0 @ Don't pad with nop.
