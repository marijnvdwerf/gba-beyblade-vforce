	.include "asm/common.inc"

	thumb_func_start sub_804C0EC
sub_804C0EC:
	lsl	r1, r1, #0x18
	cmp	r1, #0
	beq	.L1	@cond_branch
	mov	r1, #0xf3
	lsl	r1, r1, #0x2
	add	r0, r0, r1
	mov	r1, #0x8
	ldrh	r2, [r0]
	orr	r1, r1, r2
	strh	r1, [r0]
	b	.L2
.L1:
	mov	r2, #0xf3
	lsl	r2, r2, #0x2
	add	r1, r0, r2
	ldr	r0, .L3
	ldrh	r2, [r1]
	and	r0, r0, r2
	strh	r0, [r1]
.L2:
	bx	lr
.L4:
	.align	2, 0
.L3:
	.4byte	0xfff7
	thumb_func_end sub_804C0EC

.align 2, 0 @ Don't pad with nop.
