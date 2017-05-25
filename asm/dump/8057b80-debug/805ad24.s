	.include "asm/common.inc"

	thumb_func_start sub_805AD24
sub_805AD24:
	push	{r4, r5, r6, r7, lr}
	mov	r7, sl
	mov	r6, r9
	mov	r5, r8
	push	{r5, r6, r7}
	add	r7, r0, #0
	ldr	r0, [sp, #0x20]
	ldr	r4, [sp, #0x2c]
	mov	ip, r4
	ldr	r4, [sp, #0x30]
	mov	r8, r4
	ldr	r4, [sp, #0x34]
	mov	r9, r4
	ldr	r4, [sp, #0x38]
	mov	sl, r4
	ldr	r4, [sp, #0x3c]
	ldr	r5, [sp, #0x40]
	ldr	r6, [sp, #0x44]
	str	r1, [r7]
	str	r2, [r7, #0x4]
	mov	r1, #0x0
	str	r1, [r7, #0x10]
	str	r1, [r7, #0xc]
	str	r3, [r7, #0x1c]
	str	r0, [r7, #0x20]
	mov	r0, #0x0
	mov	r2, sp
	ldrh	r2, [r2, #0x28]
	strh	r2, [r7, #0xa]
	strb	r0, [r7, #0x9]
	str	r1, [r7, #0x24]
	str	r4, [r7, #0x30]
	str	r5, [r7, #0x34]
	add	r0, r7, #0
	add	r0, r0, #0x2c
	mov	r3, r8
	strb	r3, [r0]
	add	r0, r0, #0x1
	mov	r4, r9
	strb	r4, [r0]
	add	r0, r0, #0x1
	mov	r2, ip
	strb	r2, [r0]
	add	r0, r0, #0x1
	mov	r3, sl
	strb	r3, [r0]
	ldr	r4, [sp, #0x24]
	str	r4, [r7, #0x28]
	str	r1, [r7, #0xc]
	str	r1, [r7, #0x18]
	str	r1, [r7, #0x14]
	strb	r6, [r7, #0x8]
	pop	{r3, r4, r5}
	mov	r8, r3
	mov	r9, r4
	mov	sl, r5
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
	thumb_func_end sub_805AD24

.align 2, 0 @ Don't pad with nop.
