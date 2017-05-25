	.include "asm/common.inc"

	thumb_func_start sub_80539C4
sub_80539C4:
	add	r2, r0, #0
	ldr	r0, .L3
	ldr	r0, [r0]
	ldr	r1, .L3 + 4
	add	r0, r0, r1
	ldr	r1, [r0]
	cmp	r1, #0
	beq	.L1	@cond_branch
	lsl	r0, r2, #0x3
	add	r0, r1, r0
	b	.L2
.L4:
	.align	2, 0
.L3:
	.4byte	0x3000fb0
	.4byte	0xc8c
.L1:
	mov	r0, #0x0
.L2:
	bx	lr
	thumb_func_end sub_80539C4

.align 2, 0 @ Don't pad with nop.
