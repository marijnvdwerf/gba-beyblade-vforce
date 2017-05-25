	.include "asm/common.inc"

	thumb_func_start sub_804A234
sub_804A234:
	ldr	r1, .L1
	mov	r0, #0x90
	strh	r0, [r1]
	sub	r1, r1, #0x8
	mov	r0, #0x3f
	strh	r0, [r1]
	add	r1, r1, #0x2
	mov	r0, #0x1f
	strh	r0, [r1]
	ldr	r0, .L1 + 4
	mov	r1, #0x0
	strh	r1, [r0]
	add	r0, r0, #0x4
	strh	r1, [r0]
	mov	r2, #0x80
	lsl	r2, r2, #0x13
	ldrh	r0, [r2]
	mov	r3, #0x80
	lsl	r3, r3, #0x6
	add	r1, r3, #0
	orr	r0, r0, r1
	strh	r0, [r2]
	bx	lr
.L2:
	.align	2, 0
.L1:
	.4byte	0x4000050
	.4byte	0x4000040
	thumb_func_end sub_804A234

.align 2, 0 @ Don't pad with nop.
