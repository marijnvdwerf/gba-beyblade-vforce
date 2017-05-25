	.include "asm/common.inc"

	thumb_func_start sub_805F848
sub_805F848:
	mov	r2, #0x28
	ldsh	r1, [r0, r2]
	lsl	r1, r1, #0x3
	ldr	r2, [r0, #0x24]
	add	r2, r2, r1
	mov	r1, #0x9
	NEG	r1, r1
	ldrh	r3, [r0, #0x32]
	and	r1, r1, r3
	strh	r1, [r0, #0x32]
	ldrh	r1, [r2, #0x4]
	strh	r1, [r0, #0x3a]
	bx	lr
	thumb_func_end sub_805F848

.align 2, 0 @ Don't pad with nop.
