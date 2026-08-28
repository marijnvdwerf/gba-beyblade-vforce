.include "asm/common.inc"

	thumb_func_start sub_8048FFC
sub_8048FFC:
	ldr	r0, .L8048FFC
	ldr	r1, [r0, #0xc]
	add	r1, #0xec
	mov	r0, #1
	ldrh	r1, [r1]
	and	r0, r1
	cmp	r0, #0
	bne	.L8048FFC_1
	mov	r0, #0
	b	.L8048FFC_2
.L8048FFC:
	.4byte _unk3000BE0
.L8048FFC_1:
	mov	r0, #1
.L8048FFC_2:
	bx	lr
	thumb_func_end sub_8048FFC

.align 2, 0 @ Don't pad with nop.
