	.include "asm/common.inc"

	thumb_func_start sub_804903C
sub_804903C:
	ldr	r3, .L1
	mov	ip, r3
	add	r3, r3, #0x8c
	lsl	r1, r1, #0x8
	str	r1, [r3]
	mov	r1, ip
	add	r1, r1, #0x90
	lsl	r2, r2, #0x8
	str	r2, [r1]
	mov	r2, ip
	add	r2, r2, #0x84
	add	r1, r0, #0
	add	r1, r1, #0x48
	mov	r3, #0x0
	ldsh	r1, [r1, r3]
	lsl	r1, r1, #0x8
	str	r1, [r2]
	mov	r1, ip
	add	r1, r1, #0x88
	add	r0, r0, #0x4a
	mov	r2, #0x0
	ldsh	r0, [r0, r2]
	lsl	r0, r0, #0x8
	str	r0, [r1]
	bx	lr
.L2:
	.align	2, 0
.L1:
	.4byte	0x3000650
	thumb_func_end sub_804903C

.align 2, 0 @ Don't pad with nop.
