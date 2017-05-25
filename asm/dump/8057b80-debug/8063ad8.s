	.include "asm/common.inc"

	thumb_func_start sub_8063AD8
sub_8063AD8:
	push	{r4, r5, r6, r7, lr}
	mov	r7, r8
	push	{r7}
	add	sp, sp, #0xfffffff0
	add	r7, r0, #0
	lsl	r5, r1, #0x18
	lsr	r5, r5, #0x18
	mov	r0, #0xc8
	add	r0, r0, r7
	mov	r8, r0
	ldr	r6, [r0]
	add	r0, r6, #0
	bl	sub_8060A60
	ldr	r1, [r7, #0x4]
	add	r0, r7, #0
	add	r0, r0, #0xac
	add	r3, r7, #0
	add	r3, r3, #0x9c
	ldr	r2, [r0]
	ldr	r0, [r3]
	add	r2, r2, r0
	add	r0, r7, #0
	add	r0, r0, #0xb0
	add	r4, r7, #0
	add	r4, r4, #0xa0
	ldr	r3, [r0]
	ldr	r0, [r4]
	add	r3, r3, r0
	mov	r0, #0x0
	str	r0, [sp]
	str	r0, [sp, #0x4]
	str	r0, [sp, #0x8]
	str	r5, [sp, #0xc]
	add	r0, r6, #0
	bl	LoadSpriteSheet
	add	r0, r7, #0
	add	r0, r0, #0x14
	ldrb	r7, [r7, #0x13]
	add	r0, r7, r0
	ldrb	r1, [r0]
	add	r0, r6, #0
	bl	sub_8061168
	ldr	r0, [r6, #0x4]
	mov	r1, r8
	str	r0, [r1]
	add	sp, sp, #0x10
	pop	{r3}
	mov	r8, r3
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
	thumb_func_end sub_8063AD8

.align 2, 0 @ Don't pad with nop.
