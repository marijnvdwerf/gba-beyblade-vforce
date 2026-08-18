	.include "asm/common.inc"

	thumb_func_start sub_80539C4
sub_80539C4:
	add	r2, r0, #0
	ldr	r0, .L80539DC
	ldr	r0, [r0]
	ldr	r1, .L80539DC + 4
	add	r0, r0, r1
	ldr	r1, [r0]
	cmp	r1, #0
	beq	.L80539E4	@cond_branch
	lsl	r0, r2, #0x3
	add	r0, r1, r0
	b	.L80539E6
.L80539DA:
	.align	2, 0
.L80539DC:
	.4byte	0x3000fb0
	.4byte	0xc8c
.L80539E4:
	mov	r0, #0x0
.L80539E6:
	bx	lr
	thumb_func_end sub_80539C4

.align 2, 0 @ Don't pad with nop.
