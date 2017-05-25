	.include "asm/common.inc"

	thumb_func_start InitStuff_SetDispStat
InitStuff_SetDispStat:
	lsl	r0, r0, #0x10
	lsr	r0, r0, #0x10
	ldr	r2, .L2
	mov	r1, #0x1
	strh	r1, [r2]
	ldr	r1, .L2 + 4
	mov	r2, #0x0
	strh	r2, [r1]
	add	r1, r1, #0x2
	strh	r2, [r1]
	ldr	r1, .L2 + 8
	strh	r0, [r1]
	add	r1, r1, #0xd0
	ldr	r0, .L2 + 12
	str	r0, [r1]
	ldr	r0, .L2 + 16
	str	r0, [r1, #0x4]
	ldr	r0, .L2 + 20
	str	r0, [r1, #0x8]
	ldr	r0, [r1, #0x8]
	mov	r0, #0xd
.L1:
	sub	r0, r0, #0x1
	cmp	r0, #0
	bge	.L1	@cond_branch
	bx	lr
.L3:
	.align	2, 0
.L2:
	.4byte	0x4000208
	.4byte	0x4000200
	.4byte	0x4000004
	.4byte	0x872caf4
	.4byte	0x3000df0
	.4byte	0x8400000e
	thumb_func_end InitStuff_SetDispStat

.align 2, 0 @ Don't pad with nop.
