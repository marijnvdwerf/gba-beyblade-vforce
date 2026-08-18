	.include "asm/common.inc"

	thumb_func_start sub_804ABFC
sub_804ABFC:
	push	{lr}
	cmp	r0, #0x14
	bhi	.L804ACEA	@cond_branch
	lsl	r0, r0, #0x2
	ldr	r1, .L804AC0C
	add	r0, r0, r1
	ldr	r0, [r0]
	mov	pc, r0
.L804AC0C:
	.align	2, 0

	.4byte	.L804AC10
.L804AC10:
	.4byte	.L804AC70
	.4byte	.L804AC74
	.4byte	.L804AC64
	.4byte	.L804AC6C
	.4byte	.L804AC8A
	.4byte	.L804AC92
	.4byte	.L804ACEA
	.4byte	.L804AC96
	.4byte	.L804AC9A
	.4byte	.L804AC8E
	.4byte	.L804AC9E
	.4byte	.L804AC68
	.4byte	.L804ACA6
	.4byte	.L804ACB4
	.4byte	.L804ACB8
	.4byte	.L804ACBC
	.4byte	.L804ACD8
	.4byte	.L804ACCA
	.4byte	.L804ACEA
	.4byte	.L804ACCE
	.4byte	.L804ACE2
.L804AC64:
	mov	r0, #0x7
	b	.L804ACD0
.L804AC68:
	mov	r0, #0x3
	b	.L804ACD0
.L804AC6C:
	mov	r0, #0x6
	b	.L804ACD0
.L804AC70:
	mov	r0, #0x6
	b	.L804ACD0
.L804AC74:
	bl	sub_8057C40
	asr	r0, r0, #0x4
	mov	r1, #0x1
	and	r0, r0, r1
	cmp	r0, #0
	beq	.L804AC86	@cond_branch
	mov	r0, #0x8
	b	.L804ACD0
.L804AC86:
	mov	r0, #0x9
	b	.L804ACD0
.L804AC8A:
	mov	r0, #0x4
	b	.L804ACD0
.L804AC8E:
	mov	r0, #0x1
	b	.L804ACD0
.L804AC92:
	mov	r0, #0x5
	b	.L804ACD0
.L804AC96:
	mov	r0, #0x2
	b	.L804ACD0
.L804AC9A:
	mov	r0, #0x0
	b	.L804ACD0
.L804AC9E:
	mov	r0, #0x6
	bl	sub_804AF04
	b	.L804ACEA
.L804ACA6:
	mov	r0, #0xa
	mov	r1, #0x3c
	bl	sub_804AE34
	bl	sub_804AD44
	b	.L804ACEA
.L804ACB4:
	mov	r0, #0xb
	b	.L804ACD0
.L804ACB8:
	mov	r0, #0xc
	b	.L804ACD0
.L804ACBC:
	mov	r0, #0xd
	mov	r1, #0x3c
	bl	sub_804AE34
	bl	sub_804AD50
	b	.L804ACEA
.L804ACCA:
	mov	r0, #0xf
	b	.L804ACD0
.L804ACCE:
	mov	r0, #0xe
.L804ACD0:
	mov	r1, #0x3c
	bl	sub_804AE34
	b	.L804ACEA
.L804ACD8:
	mov	r0, #0x10
	mov	r1, #0x40
	bl	sub_804AE34
	b	.L804ACEA
.L804ACE2:
	mov	r0, #0xc
	mov	r1, #0x32
	bl	sub_804AE34
.L804ACEA:
	pop	{r0}
	bx	r0
	thumb_func_end sub_804ABFC

.align 2, 0 @ Don't pad with nop.
