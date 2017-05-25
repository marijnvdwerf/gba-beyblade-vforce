	.include "asm/common.inc"

	thumb_func_start sub_804A0E0
sub_804A0E0:
	add	r2, r0, #0
	mov	r1, #0x0
	ldr	r3, .L3
	add	r0, r3, #0
	add	r0, r0, #0xb4
	ldr	r0, [r0]
	ldr	r0, [r0, #0x4]
	ldr	r0, [r0, #0x14]
	cmp	r2, r0
	bgt	.L2	@cond_branch
	cmp	r0, #0
	beq	.L2	@cond_branch
	mov	r1, #0x8e
	lsl	r1, r1, #0x3
	add	r0, r3, r1
	lsl	r1, r2, #0x1
	add	r1, r1, r2
	lsl	r1, r1, #0x4
	ldr	r0, [r0]
	add	r1, r0, r1
.L2:
	add	r0, r1, #0
	bx	lr
.L4:
	.align	2, 0
.L3:
	.4byte	0x3000650
	thumb_func_end sub_804A0E0

.align 2, 0 @ Don't pad with nop.
