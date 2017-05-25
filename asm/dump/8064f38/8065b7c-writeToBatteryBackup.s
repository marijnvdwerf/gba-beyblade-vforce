	.include "asm/common.inc"

	thumb_func_start writeToBatteryBackup
writeToBatteryBackup:
	push	{r4, r5, lr}
	add	sp, sp, #0xfffffff8
	add	r4, r1, #0
	lsl	r0, r0, #0x10
	lsr	r1, r0, #0x10
	mov	r5, #0x0
	ldr	r0, .L3
	ldr	r0, [r0]
	ldrh	r0, [r0, #0x4]
	cmp	r1, r0
	bcc	.L1	@cond_branch
	ldr	r0, .L3 + 4
	b	.L2
.L4:
	.align	2, 0
.L3:
	.4byte	0x3005e9c
	.4byte	0x80ff
.L1:
	add	r0, r1, #0
	mov	r1, sp
	bl	sub_80659F0
	mov	r2, sp
	mov	r3, #0x0
	b	.L5
.L7:
	add	r0, r3, #1
	lsl	r0, r0, #0x18
	lsr	r3, r0, #0x18
	cmp	r3, #0x3
	bhi	.L6	@cond_branch
.L5:
	ldrh	r1, [r4]
	ldrh	r0, [r2]
	add	r2, r2, #0x2
	add	r4, r4, #0x2
	cmp	r1, r0
	beq	.L7	@cond_branch
	mov	r5, #0x80
	lsl	r5, r5, #0x8
.L6:
	add	r0, r5, #0
.L2:
	add	sp, sp, #0x8
	pop	{r4, r5}
	pop	{r1}
	bx	r1
	thumb_func_end writeToBatteryBackup

.align 2, 0 @ Don't pad with nop.
