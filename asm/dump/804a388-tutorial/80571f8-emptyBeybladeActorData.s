	.include "asm/common.inc"

	thumb_func_start emptyBeybladeActorData
emptyBeybladeActorData:
	ldr	r0, .L2
	ldr	r0, [r0]
	ldr	r1, .L2 + 4
	add	r2, r0, r1
	ldr	r1, .L2 + 8
	add	r0, r0, r1
	mov	r1, #0xe
	strh	r1, [r0]
	mov	r1, #0x0
	mov	r0, #0x3b
.L1:
	str	r1, [r2]
	strb	r1, [r2, #0x4]
	add	r2, r2, #0x8
	sub	r0, r0, #0x1
	cmp	r0, #0
	bge	.L1	@cond_branch
	bx	lr
.L3:
	.align	2, 0
.L2:
	.4byte	0x3000fb0
	.4byte	0x1110
	.4byte	0x12f0
	thumb_func_end emptyBeybladeActorData

.align 2, 0 @ Don't pad with nop.
