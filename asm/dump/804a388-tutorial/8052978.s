	.include "asm/common.inc"

	thumb_func_start sub_8052978
sub_8052978:
	push	{r4, r5, lr}
	add	r2, r1, #0
	cmp	r0, #0x6
	bhi	.L8052A6A	@cond_branch
	lsl	r0, r0, #0x2
	ldr	r1, .L805298C
	add	r0, r0, r1
	ldr	r0, [r0]
	mov	pc, r0
.L805298A:
	.align	2, 0
.L805298C:
	.4byte	.L8052990
.L8052990:
	.4byte	.L80529AC
	.4byte	.L8052A6A
	.4byte	.L80529E8
	.4byte	.L8052A4C
	.4byte	.L8052A60
	.4byte	.L80529DC
	.4byte	.L8052A6A
.L80529AC:
	ldr	r0, .L80529CC
	mov	r2, #0x0
	str	r2, [r0]
	ldr	r1, .L80529CC + 4
	mov	r0, #0x40
	str	r0, [r1]
	ldr	r0, .L80529CC + 8
	str	r2, [r0]
	ldr	r1, .L80529CC + 12
	mov	r0, #0xff
	strh	r0, [r1]
	add	r1, r1, #0x4
	mov	r0, #0x10
	strh	r0, [r1]
	b	.L8052A6A
.L80529CA:
	.align	2, 0
.L80529CC:
	.4byte	_unk3000C0C
	.4byte	_unk3000C04
	.4byte	_unk3000C08
	.4byte	0x4000050
.L80529DC:
	ldr	r0, .L80529E4
	str	r2, [r0]
	b	.L8052A6A
.L80529E2:
	.align	2, 0
.L80529E4:
	.4byte	_unk3000C0C
.L80529E8:
	ldr	r1, .L8052A34
	mov	r0, #0x0
	strh	r0, [r1]
	ldr	r3, .L8052A34 + 4
	ldr	r4, .L8052A34 + 8
	ldr	r1, [r3]
	ldr	r0, [r4]
	add	r1, r1, r0
	str	r1, [r3]
	ldr	r2, .L8052A34 + 12
	ldr	r5, .L8052A34 + 16
	add	r0, r5, #0
	strh	r0, [r2]
	add	r2, r2, #0x2
	sub	r5, r5, #0x39
	add	r0, r5, #0
	strh	r0, [r2]
	cmp	r1, #0
	bge	.L8052A14	@cond_branch
	mov	r0, #0x0
	str	r0, [r3]
	str	r0, [r4]
.L8052A14:
	ldr	r0, [r3]
	cmp	r0, #0x40
	ble	.L8052A6A	@cond_branch
	mov	r0, #0x40
	str	r0, [r3]
	mov	r5, #0x0
	str	r5, [r4]
	ldr	r4, .L8052A34 + 20
	ldr	r0, [r4]
	cmp	r0, #0
	beq	.L8052A2E	@cond_branch
	bl	_call_via_r0
.L8052A2E:
	str	r5, [r4]
	b	.L8052A6A
.L8052A32:
	.align	2, 0
.L8052A34:
	.4byte	0x4000054
	.4byte	_unk3000C04
	.4byte	_unk3000C08
	.4byte	0x4000050
	.4byte	0xe41
	.4byte	_unk3000C0C
.L8052A4C:
	ldr	r1, .L8052A5C
	mov	r0, #0x2
	NEG	r0, r0
	str	r0, [r1]
	bl	sub_805565C
	b	.L8052A6A
.L8052A5A:
	.align	2, 0
.L8052A5C:
	.4byte	_unk3000C08
.L8052A60:
	ldr	r1, .L8052A70
	mov	r0, #0x2
	str	r0, [r1]
	bl	sub_8055674
.L8052A6A:
	pop	{r4, r5}
	pop	{r0}
	bx	r0
.L8052A70:
	.align	2, 0

	.4byte	_unk3000C08
	thumb_func_end sub_8052978

.align 2, 0 @ Don't pad with nop.
