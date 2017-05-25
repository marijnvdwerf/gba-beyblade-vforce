	.include "asm/common.inc"

	thumb_func_start sub_8055BC0
sub_8055BC0:
	add	r3, r0, #0
	lsl	r1, r1, #0x18
	lsl	r2, r2, #0x18
	lsr	r2, r2, #0x18
	cmp	r1, #0
	beq	.L1	@cond_branch
	cmp	r2, #0
	beq	.L2	@cond_branch
	mov	r0, #0x4
	ldrh	r1, [r3, #0x2a]
	orr	r0, r0, r1
	strh	r0, [r3, #0x2a]
	b	.L4
.L2:
	ldr	r0, .L5
	ldrh	r1, [r3, #0x2a]
	and	r0, r0, r1
	strh	r0, [r3, #0x2a]
	b	.L4
.L6:
	.align	2, 0
.L5:
	.4byte	0xfffb
.L1:
	cmp	r2, #0
	beq	.L7	@cond_branch
	mov	r0, #0x4
	ldrh	r1, [r3, #0x28]
	orr	r0, r0, r1
	b	.L8
.L7:
	ldr	r0, .L9
	ldrh	r1, [r3, #0x28]
	and	r0, r0, r1
.L8:
	strh	r0, [r3, #0x28]
.L4:
	bx	lr
.L10:
	.align	2, 0
.L9:
	.4byte	0xfffb
	thumb_func_end sub_8055BC0

.align 2, 0 @ Don't pad with nop.
