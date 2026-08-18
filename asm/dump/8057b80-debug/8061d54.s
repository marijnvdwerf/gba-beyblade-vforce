	.include "asm/common.inc"

	thumb_func_start sub_8061D54
sub_8061D54:
	add	r1, r0, #0
	ldr	r0, [r1, #0x1c]
	cmp	r0, #0
	beq	.L8061D62	@cond_branch
	ldr	r0, [r1, #0x14]
	ldr	r0, [r0, #0x8]
	b	.L8061D64
.L8061D62:
	mov	r0, #0x0
.L8061D64:
	bx	lr
	thumb_func_end sub_8061D54

.align 2, 0 @ Don't pad with nop.
