	.include "asm/common.inc"

	thumb_func_start sub_8049344
sub_8049344:
	push	{r4, lr}
	add	r4, r0, #0
	mov	r2, #0x0
	ldr	r1, .L8049360
	mov	r3, #0xb1
	lsl	r3, r3, #0x3
	add	r0, r1, r3
	ldr	r0, [r0]
	add	r3, r1, #0
	cmp	r0, #0
	beq	.L8049364	@cond_branch
	add	r2, r0, #0
	b	.L80493B4
.L804935E:
	.align	2, 0
.L8049360:
	.4byte	0x3000650
.L8049364:
	cmp	r4, #0x4
	bhi	.L80493B4	@cond_branch
	lsl	r0, r4, #0x2
	ldr	r1, .L8049374
	add	r0, r0, r1
	ldr	r0, [r0]
	mov	pc, r0
.L8049372:
	.align	2, 0
.L8049374:
	.4byte	.L8049378
.L8049378:
	.4byte	.L80493AC
	.4byte	.L804938C
	.4byte	.L80493AC
	.4byte	.L804939A
	.4byte	.L804938C
.L804938C:
	ldr	r1, .L80493A4
	add	r0, r3, r1
	ldrb	r0, [r0]
	lsl	r0, r0, #0x18
	asr	r0, r0, #0x18
	cmp	r0, #0
	ble	.L80493A8	@cond_branch
.L804939A:
	add	r0, r3, #0
	add	r0, r0, #0xb4
	ldr	r0, [r0]
	ldr	r2, [r0, #0x14]
	b	.L80493B4
.L80493A4:
	.align	2, 0

	.4byte	0x585
.L80493A8:
	cmp	r0, #0
	bge	.L80493B4	@cond_branch
.L80493AC:
	add	r0, r3, #0
	add	r0, r0, #0xb4
	ldr	r0, [r0]
	ldr	r2, [r0, #0x10]
.L80493B4:
	cmp	r2, #0
	beq	.L80493C0	@cond_branch
	add	r0, r3, #0
	add	r1, r4, #0
	bl	_call_via_r2
.L80493C0:
	pop	{r4}
	pop	{r0}
	bx	r0
	thumb_func_end sub_8049344

.align 2, 0 @ Don't pad with nop.
