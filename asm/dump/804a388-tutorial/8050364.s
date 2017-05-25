	.include "asm/common.inc"

	thumb_func_start sub_8050364
sub_8050364:
	ldr	r2, [r1, #0x8]
	str	r2, [r0, #0x10]
	ldr	r2, [r1, #0xc]
	str	r2, [r0, #0x14]
	ldr	r2, [r1]
	str	r2, [r0, #0x8]
	ldr	r2, [r1, #0x4]
	str	r2, [r0, #0xc]
	ldrh	r2, [r1, #0x18]
	strh	r2, [r0, #0x20]
	ldr	r2, [r1, #0x10]
	str	r2, [r0, #0x18]
	ldr	r1, [r1, #0x14]
	str	r1, [r0, #0x1c]
	bx	lr
	thumb_func_end sub_8050364

.align 2, 0 @ Don't pad with nop.
