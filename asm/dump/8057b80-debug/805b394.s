	.include "asm/common.inc"

	thumb_func_start sub_805B394
sub_805B394:
	push	{r4, r5, r6, lr}
	add	r6, r0, #0
	ldr	r2, [r6]
	cmp	r2, #0
	beq	.L1	@cond_branch
	ldr	r5, .L2
	add	r0, r2, #0
	add	r0, r0, #0x5d
	ldrb	r0, [r0]
	lsl	r1, r0, #0xe
	mov	r4, #0xc0
	lsl	r4, r4, #0x13
	add	r1, r1, r4
	ldr	r2, [r2, #0x74]
	ldr	r3, [r5]
	mov	r0, #0x0
	bl	call_via_r3
	ldr	r0, [r6]
	add	r0, r0, #0x5c
	ldrb	r0, [r0]
	lsl	r1, r0, #0xb
	add	r1, r1, r4
	mov	r2, #0x80
	lsl	r2, r2, #0x4
	ldr	r3, [r5]
	mov	r0, #0x0
	bl	call_via_r3
	mov	r0, #0x1
	strh	r0, [r6, #0xe]
.L1:
	pop	{r4, r5, r6}
	pop	{r0}
	bx	r0
.L3:
	.align	2, 0
.L2:
	.4byte	0x807d970
	thumb_func_end sub_805B394

.align 2, 0 @ Don't pad with nop.
