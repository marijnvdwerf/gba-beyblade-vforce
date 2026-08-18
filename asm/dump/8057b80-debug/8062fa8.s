	.include "asm/common.inc"

	thumb_func_start sub_8062FA8
sub_8062FA8:
	push	{lr}
	mov	r2, #0x0
	ldr	r0, .L8062FB4
	ldr	r1, [r0]
	b	.L8062FD4
.L8062FB2:
	.align	2, 0
.L8062FB4:
	.4byte	0x3005e54
.L8062FB8:
	cmp	r2, #0xff
	bls	.L8062FCC	@cond_branch
	ldr	r0, .L8062FC8
	bl	nullsub_8
	mov	r0, #0x0
	b	.L8062FDC
.L8062FC6:
	.align	2, 0
.L8062FC8:
	.4byte	0x8755e8c
.L8062FCC:
	add	r0, r2, #1
	lsl	r0, r0, #0x10
	lsr	r2, r0, #0x10
	add	r1, r1, #0x14
.L8062FD4:
	ldr	r0, [r1, #0x8]
	cmp	r0, #0
	bne	.L8062FB8	@cond_branch
	add	r0, r1, #0
.L8062FDC:
	pop	{r1}
	bx	r1
	thumb_func_end sub_8062FA8

.align 2, 0 @ Don't pad with nop.
