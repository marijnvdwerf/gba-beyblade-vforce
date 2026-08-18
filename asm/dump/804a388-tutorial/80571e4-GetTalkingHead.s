	.include "asm/common.inc"

	thumb_func_start GetTalkingHead
GetTalkingHead:
	add	r1, r0, #0
	lsl	r0, r1, #0x2
	add	r0, r0, r1
	lsl	r0, r0, #0x3
	ldr	r1, .L80571F4
	add	r0, r0, r1
	bx	lr
.L80571F2:
	.align	2, 0
.L80571F4:
	.4byte	0x807a5c0
	thumb_func_end GetTalkingHead

.align 2, 0 @ Don't pad with nop.
