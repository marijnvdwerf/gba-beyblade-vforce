	.include "asm/common.inc"

	thumb_func_start sub_806417C
sub_806417C:
	add	r0, r0, #0xba
	ldrh	r0, [r0]
	lsr	r0, r0, #0x2
	mov	r1, #0x1
	and	r0, r0, r1
	bx	lr
	thumb_func_end sub_806417C

.align 2, 0 @ Don't pad with nop.
