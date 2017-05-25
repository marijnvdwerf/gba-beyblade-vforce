	.include "asm/common.inc"

	thumb_func_start allocateActorHeaps
allocateActorHeaps:
	push	{r4, r5, r6, lr}
	add	sp, sp, #0xfffffffc
	ldr	r0, .L3
	mov	r4, #0x0
	str	r4, [r0]
	ldr	r0, .L3 + 4
	str	r4, [r0]
	ldr	r0, .L3 + 8
	str	r4, [r0]
	mov	r0, #0xc4
	lsl	r0, r0, #0x8
	bl	slowAllocate
	add	r6, r0, #0
	mov	r0, #0xa0
	lsl	r0, r0, #0x5
	bl	slowAllocate
	add	r5, r0, #0
	cmp	r6, #0
	bne	.L1	@cond_branch
	ldr	r0, .L3 + 12
	bl	nullsub_8
.L1:
	cmp	r5, #0
	bne	.L2	@cond_branch
	ldr	r0, .L3 + 16
	bl	nullsub_8
.L2:
	ldr	r1, .L3 + 20
	ldr	r0, [r6]
	str	r0, [r1]
	ldr	r0, .L3 + 24
	ldr	r1, [r5]
	str	r1, [r0]
	ldr	r0, .L3 + 28
	str	r4, [r0]
	str	r4, [sp]
	ldr	r0, .L3 + 32
	mov	r2, sp
	str	r2, [r0]
	str	r1, [r0, #0x4]
	ldr	r1, .L3 + 36
	str	r1, [r0, #0x8]
	ldr	r0, [r0, #0x8]
	add	sp, sp, #0x4
	pop	{r4, r5, r6}
	pop	{r0}
	bx	r0
.L4:
	.align	2, 0
.L3:
	.4byte	0x3005e64
	.4byte	0x3005e5c
	.4byte	0x3005e60
	.4byte	0x8755e24
	.4byte	0x8755e54
	.4byte	0x3005e68
	.4byte	0x3005e54
	.4byte	0x3005e58
	.4byte	0x40000d4
	.4byte	0x85000500
	thumb_func_end allocateActorHeaps

.align 2, 0 @ Don't pad with nop.
