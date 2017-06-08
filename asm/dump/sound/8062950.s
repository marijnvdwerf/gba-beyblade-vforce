	.include "asm/common.inc"

	thumb_func_start sub_8062950
sub_8062950:
	push	{r4, r5, r6, lr}
	mov	r4, #0x0
	ldsh	r3, [r2, r4]
	lsl	r3, r3, #0x2
	add	r3, r3, r1
	ldr	r4, [r3]
	mov	r5, #0x0
	mov	r6, #0x1
	strb	r6, [r0, #0x16]
	str	r4, [r0]
	mov	r3, #0x0
	strh	r5, [r0, #0x14]
	strb	r3, [r0, #0x17]
	mov	r3, #0x80
	lsl	r3, r3, #0x1
	strh	r3, [r0, #0x10]
	add	r4, r4, #0x10
	str	r4, [r0, #0x4]
	ldr	r3, _1
	ldr	r3, [r3]
	ldr	r3, [r3]
	str	r3, [r0, #0x8]
	str	r5, [r0, #0xc]
	str	r1, [r0, #0x1c]
	str	r2, [r0, #0x20]
	strh	r6, [r0, #0x24]
	pop	{r4, r5, r6}
	pop	{r0}
	bx	r0
_2:
	.align	2, 0
_1:
	.word	_soundTables
	thumb_func_end sub_8062950

.align 2, 0 @ Don't pad with nop.
