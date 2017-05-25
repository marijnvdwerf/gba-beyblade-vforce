	.include "asm/common.inc"

	thumb_func_start sub_80578E0
sub_80578E0:
	add	sp, sp, #0xfffffffc
	mov	r2, #0x0
	str	r2, [sp]
	ldr	r0, .L1
	mov	r1, sp
	str	r1, [r0]
	mov	r1, #0x80
	lsl	r1, r1, #0x12
	str	r1, [r0, #0x4]
	ldr	r1, .L1 + 4
	str	r1, [r0, #0x8]
	ldr	r1, [r0, #0x8]
	str	r2, [sp]
	mov	r1, sp
	str	r1, [r0]
	mov	r1, #0xc0
	lsl	r1, r1, #0x12
	str	r1, [r0, #0x4]
	ldr	r1, .L1 + 8
	str	r1, [r0, #0x8]
	ldr	r0, [r0, #0x8]
	add	sp, sp, #0x4
	bx	lr
.L2:
	.align	2, 0
.L1:
	.4byte	0x40000d4
	.4byte	0x85010000
	.4byte	0x85001f80
	thumb_func_end sub_80578E0

.align 2, 0 @ Don't pad with nop.
