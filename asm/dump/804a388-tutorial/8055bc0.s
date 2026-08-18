	.include "asm/common.inc"

	thumb_func_start sub_8055BC0
sub_8055BC0:
	add	r3, r0, #0
	lsl	r1, r1, #0x18
	lsl	r2, r2, #0x18
	lsr	r2, r2, #0x18
	cmp	r1, #0
	beq	.L8055BE8	@cond_branch
	cmp	r2, #0
	beq	.L8055BDA	@cond_branch
	mov	r0, #0x4
	ldrh	r1, [r3, #0x2a]
	orr	r0, r0, r1
	strh	r0, [r3, #0x2a]
	b	.L8055BFC
.L8055BDA:
	ldr	r0, .L8055BE4
	ldrh	r1, [r3, #0x2a]
	and	r0, r0, r1
	strh	r0, [r3, #0x2a]
	b	.L8055BFC
.L8055BE4:
	.align	2, 0

	.4byte	0xfffb
.L8055BE8:
	cmp	r2, #0
	beq	.L8055BF4	@cond_branch
	mov	r0, #0x4
	ldrh	r1, [r3, #0x28]
	orr	r0, r0, r1
	b	.L8055BFA
.L8055BF4:
	ldr	r0, .L8055C00
	ldrh	r1, [r3, #0x28]
	and	r0, r0, r1
.L8055BFA:
	strh	r0, [r3, #0x28]
.L8055BFC:
	bx	lr
.L8055BFE:
	.align	2, 0
.L8055C00:
	.4byte	0xfffb
	thumb_func_end sub_8055BC0

.align 2, 0 @ Don't pad with nop.
