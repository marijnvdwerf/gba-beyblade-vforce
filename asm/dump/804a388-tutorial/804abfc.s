	.include "asm/common.inc"

	thumb_func_start sub_804ABFC
sub_804ABFC:
	push	{lr}
	cmp	r0, #0x14
	bhi	.L45	@cond_branch
	lsl	r0, r0, #0x2
	ldr	r1, .L3
	add	r0, r0, r1
	ldr	r0, [r0]
	mov	pc, r0
.L4:
	.align	2, 0
.L3:
	.4byte	.L2
.L2:
	.4byte	.L5
	.4byte	.L6
	.4byte	.L7
	.4byte	.L8
	.4byte	.L9
	.4byte	.L10
	.4byte	.L45
	.4byte	.L12
	.4byte	.L13
	.4byte	.L14
	.4byte	.L15
	.4byte	.L16
	.4byte	.L17
	.4byte	.L18
	.4byte	.L19
	.4byte	.L20
	.4byte	.L21
	.4byte	.L22
	.4byte	.L45
	.4byte	.L24
	.4byte	.L25
.L7:
	mov	r0, #0x7
	b	.L43
.L16:
	mov	r0, #0x3
	b	.L43
.L8:
	mov	r0, #0x6
	b	.L43
.L5:
	mov	r0, #0x6
	b	.L43
.L6:
	bl	sub_8057C40
	asr	r0, r0, #0x4
	mov	r1, #0x1
	and	r0, r0, r1
	cmp	r0, #0
	beq	.L30	@cond_branch
	mov	r0, #0x8
	b	.L43
.L30:
	mov	r0, #0x9
	b	.L43
.L9:
	mov	r0, #0x4
	b	.L43
.L14:
	mov	r0, #0x1
	b	.L43
.L10:
	mov	r0, #0x5
	b	.L43
.L12:
	mov	r0, #0x2
	b	.L43
.L13:
	mov	r0, #0x0
	b	.L43
.L15:
	mov	r0, #0x6
	bl	sub_804AF04
	b	.L45
.L17:
	mov	r0, #0xa
	mov	r1, #0x3c
	bl	sub_804AE34
	bl	sub_804AD44
	b	.L45
.L18:
	mov	r0, #0xb
	b	.L43
.L19:
	mov	r0, #0xc
	b	.L43
.L20:
	mov	r0, #0xd
	mov	r1, #0x3c
	bl	sub_804AE34
	bl	sub_804AD50
	b	.L45
.L22:
	mov	r0, #0xf
	b	.L43
.L24:
	mov	r0, #0xe
.L43:
	mov	r1, #0x3c
	bl	sub_804AE34
	b	.L45
.L21:
	mov	r0, #0x10
	mov	r1, #0x40
	bl	sub_804AE34
	b	.L45
.L25:
	mov	r0, #0xc
	mov	r1, #0x32
	bl	sub_804AE34
.L45:
	pop	{r0}
	bx	r0
	thumb_func_end sub_804ABFC

.align 2, 0 @ Don't pad with nop.
