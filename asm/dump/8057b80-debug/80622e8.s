	.include "asm/common.inc"

	thumb_func_start sub_80622E8
sub_80622E8:
	push	{r4, r5, lr}
	add	sp, sp, #0xfffffff4
	add	r5, r1, #0
	ldr	r1, [r0, #0x24]
	ldr	r2, [r0, #0x20]
	ldr	r3, [r0]
	lsl	r3, r3, #0x8
	asr	r3, r3, #0x10
	ldr	r4, [r0, #0x4]
	lsl	r4, r4, #0x8
	asr	r4, r4, #0x10
	str	r4, [sp]
	ldrh	r4, [r0, #0xc]
	str	r4, [sp, #0x4]
	ldrh	r0, [r0, #0x8]
	str	r0, [sp, #0x8]
	add	r0, r5, #0
	bl	allocFont
	add	sp, sp, #0xc
	pop	{r4, r5}
	pop	{r0}
	bx	r0
	thumb_func_end sub_80622E8

.align 2, 0 @ Don't pad with nop.
