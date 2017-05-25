	.include "asm/common.inc"

	thumb_func_start sub_8062FA8
sub_8062FA8:
	push	{lr}
	mov	r2, #0x0
	ldr	r0, .L2
	ldr	r1, [r0]
	b	.L1
.L3:
	.align	2, 0
.L2:
	.4byte	0x3005e54
.L8:
	cmp	r2, #0xff
	bls	.L4	@cond_branch
	ldr	r0, .L6
	bl	nullsub_8
	mov	r0, #0x0
	b	.L5
.L7:
	.align	2, 0
.L6:
	.4byte	0x8755e8c
.L4:
	add	r0, r2, #1
	lsl	r0, r0, #0x10
	lsr	r2, r0, #0x10
	add	r1, r1, #0x14
.L1:
	ldr	r0, [r1, #0x8]
	cmp	r0, #0
	bne	.L8	@cond_branch
	add	r0, r1, #0
.L5:
	pop	{r1}
	bx	r1
	thumb_func_end sub_8062FA8

.align 2, 0 @ Don't pad with nop.
