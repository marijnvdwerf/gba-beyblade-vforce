	.include "asm/common.inc"

	thumb_func_start sub_8059FD0
sub_8059FD0:
	add	r2, r0, #0
	cmp	r1, #0
	bge	.L8059FDA	@cond_branch
	NEG	r1, r1
	NEG	r2, r2
.L8059FDA:
	asr	r0, r1, #0x4
	mov	r3, #0xc
	cmp	r0, #0
	beq	.L8059FE4	@cond_branch
	mov	r3, #0x10
.L8059FE4:
	ldr	r0, .L8059FF4
	lsl	r1, r1, #0x1
	add	r1, r1, r0
	ldrh	r1, [r1]
	add	r0, r1, #0
	mul	r0, r0, r2
	ASR	r0, r3
	bx	lr
.L8059FF4:
	.align	2, 0

	.4byte	0x874d1c0
	thumb_func_end sub_8059FD0

.align 2, 0 @ Don't pad with nop.
