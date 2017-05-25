	.include "asm/common.inc"

	thumb_func_start sub_8066150
sub_8066150:
	push	{r4, r5, r6, r7, lr}
	add	sp, sp, #0xfffffff0
	str	r0, [sp]
	str	r1, [sp, #0x4]
	str	r2, [sp, #0x8]
	str	r3, [sp, #0xc]
	ldr	r3, [sp]
	ldr	r0, .L2
	mov	ip, r0
	add	r2, r3, #0
	and	r2, r2, r0
	lsr	r3, r3, #0x10
	ldr	r1, [sp, #0x8]
	add	r0, r1, #0
	mov	r4, ip
	and	r0, r0, r4
	lsr	r1, r1, #0x10
	add	r5, r2, #0
	mul	r5, r5, r0
	add	r4, r2, #0
	mul	r4, r4, r1
	add	r2, r3, #0
	mul	r2, r2, r0
	mul	r3, r3, r1
	lsr	r0, r5, #0x10
	add	r4, r4, r0
	add	r4, r4, r2
	cmp	r4, r2
	bcs	.L1	@cond_branch
	mov	r0, #0x80
	lsl	r0, r0, #0x9
	add	r3, r3, r0
.L1:
	lsr	r0, r4, #0x10
	add	r7, r3, r0
	mov	r1, ip
	and	r4, r4, r1
	lsl	r0, r4, #0x10
	and	r5, r5, r1
	add	r6, r0, #0
	orr	r6, r6, r5
	add	r1, r7, #0
	add	r0, r6, #0
	ldr	r3, [sp]
	ldr	r4, [sp, #0xc]
	add	r2, r3, #0
	mul	r2, r2, r4
	ldr	r5, [sp, #0x4]
	ldr	r4, [sp, #0x8]
	add	r3, r5, #0
	mul	r3, r3, r4
	add	r2, r2, r3
	add	r1, r7, r2
	add	sp, sp, #0x10
	pop	{r4, r5, r6, r7, pc}
.L3:
	.align	2, 0
.L2:
	.4byte	0xffff
	thumb_func_end sub_8066150

.align 2, 0 @ Don't pad with nop.
