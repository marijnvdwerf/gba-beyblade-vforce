	.include "asm/common.inc"

	thumb_func_start sub_8062910
sub_8062910:
	push	{r4, lr}
	add	r3, r0, #0
	mov	r4, #0x0
	mov	r0, #0x1
	strb	r0, [r3, #0x16]
	str	r1, [r3]
	mov	r0, #0x0
	strh	r4, [r3, #0x14]
	strb	r0, [r3, #0x17]
	mov	r0, #0x80
	lsl	r0, r0, #0x1
	strh	r0, [r3, #0x10]
	add	r1, r1, #0x10
	str	r1, [r3, #0x4]
	cmp	r2, #0x7f
	bls	_1	@cond_branch
	mov	r2, #0x7f
_1:
	ldr	r0, _2
	ldr	r1, [r0]
	lsl	r0, r2, #0x2
	add	r0, r0, r1
	ldr	r0, [r0]
	str	r0, [r3, #0x8]
	str	r4, [r3, #0xc]
	str	r4, [r3, #0x1c]
	str	r4, [r3, #0x20]
	strh	r4, [r3, #0x24]
	pop	{r4}
	pop	{r0}
	bx	r0
_3:
	.align	2, 0
_2:
	.word	_soundTables
	thumb_func_end sub_8062910

.align 2, 0 @ Don't pad with nop.
