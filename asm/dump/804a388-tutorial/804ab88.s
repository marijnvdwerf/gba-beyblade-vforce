	.include "asm/common.inc"

	thumb_func_start sub_804AB88
sub_804AB88:
	add	r3, r0, #0
	add	r2, r1, #0
	cmp	r2, #0
	bge	.L804AB92	@cond_branch
	NEG	r2, r2
.L804AB92:
	cmp	r2, #0x80
	bgt	.L804AB9C	@cond_branch
	asr	r0, r1, #0x1
	NEG	r0, r0
	b	.L804ABA0
.L804AB9C:
	asr	r0, r3, #0x1
	add	r3, r1, #0
.L804ABA0:
	ldr	r1, .L804ABC8
	lsl	r0, r0, #0x10
	asr	r0, r0, #0x10
	add	r0, r0, #0x80
	add	r0, r0, r1
	ldrb	r1, [r0]
	cmp	r3, #0
	bge	.L804ABB4	@cond_branch
	mov	r0, #0xff
	sub	r1, r0, r1
.L804ABB4:
	cmp	r2, #0x80
	ble	.L804ABC2	@cond_branch
	add	r1, r1, #0x40
	cmp	r1, #0xff
	ble	.L804ABC2	@cond_branch
	ldr	r0, .L804ABC8 + 4
	add	r1, r1, r0
.L804ABC2:
	add	r0, r1, #0
	bx	lr
.L804ABC6:
	.align	2, 0
.L804ABC8:
	.4byte	Unk_874CEBC
	.4byte	0xffffff00
	thumb_func_end sub_804AB88

.align 2, 0 @ Don't pad with nop.
