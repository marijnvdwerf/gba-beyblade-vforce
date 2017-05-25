	.include "asm/common.inc"

	thumb_func_start sub_805893C
sub_805893C:
	ldr	r1, [r0]
	ldr	r0, [r1]
	lsl	r2, r0, #0x1
	mov	r0, #0x2
	and	r0, r0, r2
	cmp	r0, #0
	beq	.L1	@cond_branch
	add	r2, r2, #0x2
.L1:
	mov	r0, #0x10
	ldrb	r3, [r1, #0x7]
	and	r0, r0, r3
	cmp	r0, #0
	beq	.L2	@cond_branch
	ldr	r0, [r1, #0x8]
	lsl	r0, r0, #0x3
	add	r0, r0, #0x20
	add	r0, r1, r0
	add	r0, r0, r2
	b	.L3
.L2:
	mov	r0, #0x0
.L3:
	bx	lr
	thumb_func_end sub_805893C

.align 2, 0 @ Don't pad with nop.
