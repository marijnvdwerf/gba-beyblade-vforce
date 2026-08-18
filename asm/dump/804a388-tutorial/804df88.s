	.include "asm/common.inc"

	thumb_func_start sub_804DF88
sub_804DF88:
	add	r3, r0, #0
	add	r2, r1, #0
	mov	r0, #0xd0
	lsl	r0, r0, #0x1
	add	r1, r3, r0
	ldr	r0, [r2, #0x40]
	str	r0, [r1]
	mov	r0, #0xd2
	lsl	r0, r0, #0x1
	add	r1, r3, r0
	ldr	r0, [r2, #0x44]
	str	r0, [r1]
	mov	r0, #0xa8
	lsl	r0, r0, #0x1
	add	r1, r3, r0
	mov	r0, #0x1
	ldrh	r1, [r1]
	and	r0, r0, r1
	cmp	r0, #0
	beq	.L804DFF0	@cond_branch
	mov	r1, #0xa6
	lsl	r1, r1, #0x1
	add	r0, r3, r1
	ldrh	r0, [r0]
	ldr	r1, .L804DFCC
	add	r0, r0, r1
	cmp	r0, #0x5
	bhi	.L804DFF0	@cond_branch
	lsl	r0, r0, #0x2
	ldr	r1, .L804DFCC + 4
	add	r0, r0, r1
	ldr	r0, [r0]
	mov	pc, r0
.L804DFCA:
	.align	2, 0
.L804DFCC:
	.4byte	0xfffffc18
	.4byte	.L804DFD4
.L804DFD4:
	.4byte	.L804DFEC
	.4byte	.L804DFEC
	.4byte	.L804DFEC
	.4byte	.L804DFEC
	.4byte	.L804DFEC
	.4byte	.L804DFEC
.L804DFEC:
	mov	r0, #0x10
	str	r0, [r2, #0x68]
.L804DFF0:
	bx	lr
	thumb_func_end sub_804DF88

.align 2, 0 @ Don't pad with nop.
