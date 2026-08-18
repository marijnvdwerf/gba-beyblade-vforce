	.include "asm/common.inc"

	thumb_func_start sub_8061E44
sub_8061E44:
	add	r1, r0, #0
	ldr	r0, [r1, #0x1c]
	cmp	r0, #0
	beq	.L8061E52	@cond_branch
	ldr	r0, [r1, #0x14]
	ldr	r0, [r0, #0xc]
	b	.L8061E54
.L8061E52:
	mov	r0, #0x0
.L8061E54:
	bx	lr
	thumb_func_end sub_8061E44

.align 2, 0 @ Don't pad with nop.
