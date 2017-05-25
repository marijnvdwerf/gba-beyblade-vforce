	.include "asm/common.inc"

	thumb_func_start onSerialCommunication
onSerialCommunication:
	push	{lr}
	mov	r1, #0x0
	ldr	r0, .L6
	ldrh	r0, [r0]
	ldr	r2, .L6 + 4
	cmp	r0, r2
	bne	.L1	@cond_branch
	mov	r1, #0x1
.L1:
	ldr	r0, .L6 + 8
	ldrh	r0, [r0]
	cmp	r0, r2
	bne	.L2	@cond_branch
	add	r0, r1, #1
	lsl	r0, r0, #0x10
	lsr	r1, r0, #0x10
.L2:
	ldr	r0, .L6 + 12
	ldrh	r0, [r0]
	cmp	r0, r2
	bne	.L3	@cond_branch
	add	r0, r1, #1
	lsl	r0, r0, #0x10
	lsr	r1, r0, #0x10
.L3:
	ldr	r0, .L6 + 16
	ldrh	r0, [r0]
	cmp	r0, r2
	bne	.L4	@cond_branch
	add	r0, r1, #1
	lsl	r0, r0, #0x10
	lsr	r1, r0, #0x10
.L4:
	ldr	r0, .L6 + 20
	ldr	r2, [r0]
	ldrb	r0, [r2, #0x4]
	cmp	r1, r0
	bcc	.L5	@cond_branch
	ldr	r1, .L6 + 24
	ldr	r0, .L6 + 28
	ldr	r0, [r0]
	str	r0, [r1, #0x1c]
	ldr	r1, .L6 + 32
	ldr	r0, [r2, #0x3c]
	ldrh	r0, [r0]
	strh	r0, [r1]
	bl	sub_8060404
.L5:
	pop	{r0}
	bx	r0
.L7:
	.align	2, 0
.L6:
	.4byte	0x4000120
	.4byte	0xdeaf
	.4byte	0x4000122
	.4byte	0x4000124
	.4byte	0x4000126
	.4byte	0x3005dc4
	.4byte	0x3000df0
	.4byte	0x807d908
	.4byte	0x400012a
	thumb_func_end onSerialCommunication

.align 2, 0 @ Don't pad with nop.
