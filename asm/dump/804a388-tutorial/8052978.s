	.include "asm/common.inc"

	thumb_func_start sub_8052978
sub_8052978:
	push	{r4, r5, lr}
	add	r2, r1, #0
	cmp	r0, #0x6
	bhi	.L24	@cond_branch
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
	.4byte	.L24
	.4byte	.L7
	.4byte	.L8
	.4byte	.L9
	.4byte	.L10
	.4byte	.L24
.L5:
	ldr	r0, .L13
	mov	r2, #0x0
	str	r2, [r0]
	ldr	r1, .L13 + 4
	mov	r0, #0x40
	str	r0, [r1]
	ldr	r0, .L13 + 8
	str	r2, [r0]
	ldr	r1, .L13 + 12
	mov	r0, #0xff
	strh	r0, [r1]
	add	r1, r1, #0x4
	mov	r0, #0x10
	strh	r0, [r1]
	b	.L24
.L14:
	.align	2, 0
.L13:
	.4byte	0x3000c0c
	.4byte	0x3000c04
	.4byte	0x3000c08
	.4byte	0x4000050
.L10:
	ldr	r0, .L16
	str	r2, [r0]
	b	.L24
.L17:
	.align	2, 0
.L16:
	.4byte	0x3000c0c
.L7:
	ldr	r1, .L22
	mov	r0, #0x0
	strh	r0, [r1]
	ldr	r3, .L22 + 4
	ldr	r4, .L22 + 8
	ldr	r1, [r3]
	ldr	r0, [r4]
	add	r1, r1, r0
	str	r1, [r3]
	ldr	r2, .L22 + 12
	ldr	r5, .L22 + 16
	add	r0, r5, #0
	strh	r0, [r2]
	add	r2, r2, #0x2
	sub	r5, r5, #0x39
	add	r0, r5, #0
	strh	r0, [r2]
	cmp	r1, #0
	bge	.L18	@cond_branch
	mov	r0, #0x0
	str	r0, [r3]
	str	r0, [r4]
.L18:
	ldr	r0, [r3]
	cmp	r0, #0x40
	ble	.L24	@cond_branch
	mov	r0, #0x40
	str	r0, [r3]
	mov	r5, #0x0
	str	r5, [r4]
	ldr	r4, .L22 + 20
	ldr	r0, [r4]
	cmp	r0, #0
	beq	.L20	@cond_branch
	bl	call_via_r0
.L20:
	str	r5, [r4]
	b	.L24
.L23:
	.align	2, 0
.L22:
	.4byte	0x4000054
	.4byte	0x3000c04
	.4byte	0x3000c08
	.4byte	0x4000050
	.4byte	0xe41
	.4byte	0x3000c0c
.L8:
	ldr	r1, .L25
	mov	r0, #0x2
	NEG	r0, r0
	str	r0, [r1]
	bl	sub_805565C
	b	.L24
.L26:
	.align	2, 0
.L25:
	.4byte	0x3000c08
.L9:
	ldr	r1, .L27
	mov	r0, #0x2
	str	r0, [r1]
	bl	sub_8055674
.L24:
	pop	{r4, r5}
	pop	{r0}
	bx	r0
.L28:
	.align	2, 0
.L27:
	.4byte	0x3000c08
	thumb_func_end sub_8052978

.align 2, 0 @ Don't pad with nop.
