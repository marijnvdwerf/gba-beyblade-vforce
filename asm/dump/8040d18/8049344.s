	.include "asm/common.inc"

	thumb_func_start sub_8049344
sub_8049344:
	push	{r4, lr}
	add	r4, r0, #0
	mov	r2, #0x0
	ldr	r1, .L3
	mov	r3, #0xb1
	lsl	r3, r3, #0x3
	add	r0, r1, r3
	ldr	r0, [r0]
	add	r3, r1, #0
	cmp	r0, #0
	beq	.L1	@cond_branch
	add	r2, r0, #0
	b	.L18
.L4:
	.align	2, 0
.L3:
	.4byte	0x3000650
.L1:
	cmp	r4, #0x4
	bhi	.L18	@cond_branch
	lsl	r0, r4, #0x2
	ldr	r1, .L7
	add	r0, r0, r1
	ldr	r0, [r0]
	mov	pc, r0
.L8:
	.align	2, 0
.L7:
	.4byte	.L6
.L6:
	.4byte	.L11
	.4byte	.L13
	.4byte	.L11
	.4byte	.L12
	.4byte	.L13
.L13:
	ldr	r1, .L16
	add	r0, r3, r1
	ldrb	r0, [r0]
	lsl	r0, r0, #0x18
	asr	r0, r0, #0x18
	cmp	r0, #0
	ble	.L14	@cond_branch
.L12:
	add	r0, r3, #0
	add	r0, r0, #0xb4
	ldr	r0, [r0]
	ldr	r2, [r0, #0x14]
	b	.L18
.L17:
	.align	2, 0
.L16:
	.4byte	0x585
.L14:
	cmp	r0, #0
	bge	.L18	@cond_branch
.L11:
	add	r0, r3, #0
	add	r0, r0, #0xb4
	ldr	r0, [r0]
	ldr	r2, [r0, #0x10]
.L18:
	cmp	r2, #0
	beq	.L19	@cond_branch
	add	r0, r3, #0
	add	r1, r4, #0
	bl	call_via_r2
.L19:
	pop	{r4}
	pop	{r0}
	bx	r0
	thumb_func_end sub_8049344

.align 2, 0 @ Don't pad with nop.
