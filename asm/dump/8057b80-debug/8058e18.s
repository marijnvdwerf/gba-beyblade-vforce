	.include "asm/common.inc"

	thumb_func_start sub_8058E18
sub_8058E18:
	push	{r4, r5, r6, r7, lr}
	mov	r7, r8
	push	{r7}
	add	sp, sp, #0xfffffff4
	mov	ip, r0
	str	r1, [r0, #0x68]
	ldr	r4, [r1, #0x4]
	add	r4, r1, r4
	str	r4, [r0, #0x6c]
	ldr	r0, [r1, #0x8]
	mov	r2, ip
	str	r0, [r2, #0x74]
	ldr	r0, [r1, #0xc]
	add	r0, r1, r0
	str	r0, [r2, #0x70]
	ldr	r0, [r1, #0x10]
	str	r0, [r2, #0x78]
	mov	r1, ip
	add	r1, r1, #0x5e
	ldrb	r5, [r1]
	lsl	r0, r5, #0x1
	add	r0, r0, r5
	lsl	r0, r0, #0x3
	ldr	r1, .L4
	add	r6, r0, r1
	str	r6, [r2, #0x8]
	mov	r1, #0x0
	str	r1, [r6, #0x10]
	str	r1, [r6, #0x14]
	str	r1, [r6]
	mov	r0, #0x5f
	ADD r0, ip
	mov	r8, r0
	mov	r3, #0x1
	add	r0, r3, #0
	mov	r2, r8
	ldrb	r2, [r2]
	LSL	r0, r2
	sub	r0, r0, #0x1
	str	r0, [r6, #0x8]
	str	r1, [r6, #0x4]
	mov	r5, ip
	add	r5, r5, #0x60
	add	r0, r3, #0
	ldrb	r1, [r5]
	LSL	r0, r1
	sub	r0, r0, #0x1
	str	r0, [r6, #0xc]
	ldr	r2, .L4 + 4
	str	r4, [r2]
	mov	r0, ip
	add	r0, r0, #0x5d
	ldrb	r0, [r0]
	lsl	r0, r0, #0xe
	mov	r1, #0xc0
	lsl	r1, r1, #0x13
	add	r0, r0, r1
	str	r0, [r2, #0x4]
	mov	r1, ip
	ldr	r0, [r1, #0x74]
	lsr	r0, r0, #0x2
	mov	r1, #0x84
	lsl	r1, r1, #0x18
	orr	r0, r0, r1
	str	r0, [r2, #0x8]
	ldr	r0, [r2, #0x8]
	add	r7, r3, #0
	mov	r2, r8
	ldrb	r2, [r2]
	LSL	r7, r2
	add	r4, r3, #0
	ldrb	r5, [r5]
	LSL	r4, r5
	mov	r5, ip
	ldr	r0, [r5]
	cmp	r0, r7
	bge	.L1	@cond_branch
	add	r7, r0, #0
.L1:
	mov	r1, ip
	ldr	r0, [r1, #0x4]
	cmp	r0, r4
	bge	.L2	@cond_branch
	add	r4, r0, #0
.L2:
	mov	r1, ip
	add	r1, r1, #0x64
	mov	r0, #0x2
	ldrh	r1, [r1]
	and	r0, r0, r1
	cmp	r0, #0
	bne	.L3	@cond_branch
	ldr	r1, [r6]
	ldr	r2, [r6, #0x4]
	ldr	r3, [r6, #0x10]
	ldr	r0, [r6, #0x14]
	str	r0, [sp]
	str	r7, [sp, #0x4]
	str	r4, [sp, #0x8]
	mov	r0, ip
	bl	sub_8059310
.L3:
	add	sp, sp, #0xc
	pop	{r3}
	mov	r8, r3
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L5:
	.align	2, 0
.L4:
	.4byte	0x3000ca0
	.4byte	0x40000d4
	thumb_func_end sub_8058E18

.align 2, 0 @ Don't pad with nop.
