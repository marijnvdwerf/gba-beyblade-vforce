	.include "asm/common.inc"

	thumb_func_start sub_806114C
sub_806114C:
	ldr	r0, [r0, #0x10]
	asr	r0, r0, #0xa
	mov	r1, #0x3
	and	r0, r0, r1
	bx	lr
	thumb_func_end sub_806114C

.align 2, 0 @ Don't pad with nop.
