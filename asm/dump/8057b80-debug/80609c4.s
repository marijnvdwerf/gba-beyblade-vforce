	.include "asm/common.inc"

	thumb_func_start sub_80609C4
sub_80609C4:
	lsl	r1, r1, #0x10
	lsr	r1, r1, #0x10
	mov	r2, #0x0
	cmp	r0, #0
	beq	.L2	@cond_branch
.L3:
	ldrh	r3, [r0, #0x22]
	cmp	r3, r1
	bcs	.L2	@cond_branch
	add	r2, r0, #0
	ldr	r0, [r2, #0x4]
	cmp	r0, #0
	bne	.L3	@cond_branch
.L2:
	add	r0, r2, #0
	bx	lr
	thumb_func_end sub_80609C4

.align 2, 0 @ Don't pad with nop.
