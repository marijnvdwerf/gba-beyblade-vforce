	.include "asm/common.inc"

	thumb_func_start sub_804AB64
sub_804AB64:
	ldr	r0, [r0, #0x20]
	add	r0, r0, #0x20
	lsl	r3, r2, #0x3
	add	r0, r0, r3
	strh	r2, [r1, #0x16]
	ldr	r3, [r1, #0x18]
	ldrh	r2, [r0]
	strh	r2, [r1, #0x12]
	ldrh	r2, [r0]
	strh	r2, [r3, #0x18]
	ldrh	r2, [r0, #0x2]
	strh	r2, [r1, #0x14]
	ldrh	r2, [r0, #0x4]
	strh	r2, [r1, #0xe]
	ldrh	r0, [r0, #0x4]
	strh	r0, [r1, #0x10]
	bx	lr
	thumb_func_end sub_804AB64

.align 2, 0 @ Don't pad with nop.
