	.include "asm/common.inc"

	thumb_func_start sub_8057878
sub_8057878:
	add	r3, r0, #0
	add	r2, r1, #0
	cmp	r2, #0
	bge	.L8057882	@cond_branch
	NEG	r2, r2
.L8057882:
	cmp	r2, #0x80
	bgt	.L805788C	@cond_branch
	asr	r0, r1, #0x1
	NEG	r0, r0
	b	.L8057890
.L805788C:
	asr	r0, r3, #0x1
	add	r3, r1, #0
.L8057890:
	ldr	r1, .L80578B8
	lsl	r0, r0, #0x10
	asr	r0, r0, #0x10
	add	r0, r0, #0x80
	add	r0, r0, r1
	ldrb	r1, [r0]
	cmp	r3, #0
	bge	.L80578A4	@cond_branch
	mov	r0, #0xff
	sub	r1, r0, r1
.L80578A4:
	cmp	r2, #0x80
	ble	.L80578B2	@cond_branch
	add	r1, r1, #0x40
	cmp	r1, #0xff
	ble	.L80578B2	@cond_branch
	ldr	r0, .L80578B8 + 4
	add	r1, r1, r0
.L80578B2:
	add	r0, r1, #0
	bx	lr
.L80578B6:
	.align	2, 0
.L80578B8:
	.4byte	0x874cebc
	.4byte	0xffffff00
	thumb_func_end sub_8057878

.align 2, 0 @ Don't pad with nop.
