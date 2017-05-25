	.include "asm/common.inc"

	thumb_func_start sub_80501F8
sub_80501F8:
	push	{r4, r5, lr}
	mov	ip, r1
	mov	r2, #0x8e
	lsl	r2, r2, #0x2
	ADD r2, ip
	mov	r1, #0x0
	ldsh	r5, [r0, r1]
	lsl	r5, r5, #0x8
	mov	r3, #0x2
	ldsh	r4, [r0, r3]
	lsl	r4, r4, #0x8
	mov	r1, #0x4
	ldsh	r3, [r0, r1]
	lsl	r3, r3, #0x8
	ldr	r1, [r2, #0x4]
	sub	r1, r5, r1
	str	r1, [r2, #0x40]
	ldr	r1, [r2, #0x8]
	sub	r1, r4, r1
	str	r1, [r2, #0x44]
	ldr	r1, [r2, #0xc]
	sub	r1, r3, r1
	str	r1, [r2, #0x48]
	str	r5, [r2, #0x4]
	str	r4, [r2, #0x8]
	str	r3, [r2, #0xc]
	ldrh	r3, [r0, #0x6]
	lsl	r1, r3, #0x16
	lsr	r1, r1, #0x16
	strh	r1, [r2, #0x22]
	mov	r1, #0x8
	ldrb	r0, [r0, #0xc]
	and	r1, r1, r0
	lsl	r1, r1, #0x18
	lsr	r1, r1, #0x18
	mov	r0, #0xf3
	lsl	r0, r0, #0x2
	ADD r0, ip
	strh	r1, [r0]
	pop	{r4, r5}
	pop	{r0}
	bx	r0
	thumb_func_end sub_80501F8

.align 2, 0 @ Don't pad with nop.
