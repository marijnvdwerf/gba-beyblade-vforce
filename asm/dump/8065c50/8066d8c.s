	.include "asm/common.inc"

	thumb_func_start sub_8066D8C
sub_8066D8C:
	push	{r4, r5, r6, r7, lr}
	add	sp, sp, #0xfffffff8
	add	r2, r0, #0
	add	r6, r1, #0
	ldr	r1, [r2, #0x4]
	str	r1, [sp]
	ldr	r0, [r2]
	str	r0, [sp, #0x4]
	mov	r2, sp
	add	r4, r1, #0
	lsl	r0, r0, #0xc
	lsr	r5, r0, #0xc
	ldrh	r3, [r2, #0x6]
	lsl	r0, r3, #0x11
	lsr	r3, r0, #0x15
	ldrb	r2, [r2, #0x7]
	lsr	r0, r2, #0x7
	str	r0, [r6, #0x4]
	cmp	r3, #0
	bne	.L1	@cond_branch
	orr	r1, r1, r5
	cmp	r1, #0
	bne	.L2	@cond_branch
	mov	r0, #0x2
	str	r0, [r6]
	b	.L16
.L2:
	ldr	r0, .L7
	str	r0, [r6, #0x8]
	lsr	r3, r4, #0x18
	lsl	r2, r5, #0x8
	add	r1, r3, #0
	orr	r1, r1, r2
	lsl	r0, r4, #0x8
	add	r5, r1, #0
	add	r4, r0, #0
	mov	r0, #0x3
	str	r0, [r6]
	ldr	r0, .L7 + 4
	cmp	r5, r0
	bhi	.L15	@cond_branch
	add	r7, r0, #0
.L5:
	lsr	r3, r4, #0x1f
	lsl	r2, r5, #0x1
	add	r1, r3, #0
	orr	r1, r1, r2
	lsl	r0, r4, #0x1
	add	r5, r1, #0
	add	r4, r0, #0
	ldr	r0, [r6, #0x8]
	sub	r0, r0, #0x1
	str	r0, [r6, #0x8]
	cmp	r5, r7
	bls	.L5	@cond_branch
	b	.L15
.L8:
	.align	2, 0
.L7:
	.4byte	0xfffffc02
	.4byte	0xfffffff
.L1:
	ldr	r0, .L12
	cmp	r3, r0
	bne	.L9	@cond_branch
	orr	r1, r1, r5
	cmp	r1, #0
	bne	.L10	@cond_branch
	mov	r0, #0x4
	str	r0, [r6]
	b	.L16
.L13:
	.align	2, 0
.L12:
	.4byte	0x7ff
.L10:
	mov	r2, #0x80
	lsl	r2, r2, #0xc
	mov	r0, #0x0
	add	r1, r5, #0
	and	r1, r1, r2
	orr	r1, r1, r0
	cmp	r1, #0
	beq	.L14	@cond_branch
	mov	r0, #0x1
	str	r0, [r6]
	b	.L15
.L14:
	str	r1, [r6]
.L15:
	str	r4, [r6, #0xc]
	str	r5, [r6, #0x10]
	b	.L16
.L9:
	ldr	r1, .L17
	add	r0, r3, r1
	str	r0, [r6, #0x8]
	mov	r0, #0x3
	str	r0, [r6]
	lsr	r3, r4, #0x18
	lsl	r2, r5, #0x8
	add	r1, r3, #0
	orr	r1, r1, r2
	lsl	r0, r4, #0x8
	ldr	r2, .L17 + 4
	ldr	r3, .L17 + 8
	orr	r1, r1, r3
	str	r0, [r6, #0xc]
	str	r1, [r6, #0x10]
.L16:
	add	sp, sp, #0x8
	pop	{r4, r5, r6, r7, pc}
.L18:
	.align	2, 0
.L17:
	.4byte	0xfffffc01
	.4byte	0x0
	.4byte	0x10000000
	thumb_func_end sub_8066D8C

.align 2, 0 @ Don't pad with nop.
