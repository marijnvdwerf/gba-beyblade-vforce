	.include "asm/common.inc"

	thumb_func_start sub_8049F9C
sub_8049F9C:
	add	r3, r0, #0
	cmp	r1, #0x2
	beq	.L8049FA8	@cond_branch
	cmp	r1, #0x3
	beq	.L8049FD0	@cond_branch
	b	.L8049FE8
.L8049FA8:
	ldr	r0, .L8049FC4
	add	r1, r3, r0
	mov	r2, #0x0
	mov	r0, #0x40
	strb	r0, [r1]
	ldr	r0, .L8049FC4 + 4
	add	r1, r3, r0
	mov	r0, #0xfc
	strb	r0, [r1]
	ldr	r1, .L8049FC4 + 8
	add	r0, r3, r1
	strb	r2, [r0]
	b	.L8049FE8
.L8049FC2:
	.align	2, 0
.L8049FC4:
	.4byte	0x584
	.4byte	0x585
	.4byte	0x586
.L8049FD0:
	ldr	r0, .L8049FEC
	add	r1, r3, r0
	mov	r0, #0x0
	strb	r0, [r1]
	ldr	r0, .L8049FEC + 4
	add	r1, r3, r0
	mov	r0, #0x2
	strb	r0, [r1]
	ldr	r0, .L8049FEC + 8
	add	r1, r3, r0
	mov	r0, #0x40
	strb	r0, [r1]
.L8049FE8:
	bx	lr
.L8049FEA:
	.align	2, 0
.L8049FEC:
	.4byte	0x584
	.4byte	0x585
	.4byte	0x586
	thumb_func_end sub_8049F9C

.align 2, 0 @ Don't pad with nop.
