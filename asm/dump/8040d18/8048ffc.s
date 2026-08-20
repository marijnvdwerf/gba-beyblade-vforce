	.include "asm/common.inc"

	thumb_func_start sub_8048FFC
sub_8048FFC:
	ldr	r0, .L8049010
	ldr	r1, [r0, #0xc]
	add	r1, r1, #0xec
	mov	r0, #0x1
	ldrh	r1, [r1]
	and	r0, r0, r1
	cmp	r0, #0
	bne	.L8049014	@cond_branch
	mov	r0, #0x0
	b	.L8049016
.L8049010:
	.align	2, 0

	.4byte	_unk3000BE0
.L8049014:
	mov	r0, #0x1
.L8049016:
	bx	lr
	thumb_func_end sub_8048FFC

.align 2, 0 @ Don't pad with nop.
