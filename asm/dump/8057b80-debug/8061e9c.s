	.include "asm/common.inc"

	thumb_func_start sub_8061E9C
sub_8061E9C:
	push	{r4, r5, r6, r7, lr}
	mov	r7, sl
	mov	r6, r9
	mov	r5, r8
	push	{r5, r6, r7}
	add	sp, sp, #0xffffffec
	mov	r9, r0
	add	r7, r1, #0
	mov	r8, r2
	ldr	r6, [sp, #0x34]
	ldr	r0, [sp, #0x38]
	lsl	r3, r3, #0x18
	lsr	r3, r3, #0x18
	str	r3, [sp, #0x10]
	lsl	r0, r0, #0x18
	lsr	r0, r0, #0x18
	mov	sl, r0
	mov	r5, sp
	cmp	r6, #0x10
	ble	.L8061EC6	@cond_branch
	mov	r6, #0x10
.L8061EC6:
	add	r0, r7, #0
	mov	r1, r8
	bl	__umodsi3
	add	r4, r0, #0
	add	r0, r7, #0
	mov	r1, r8
	bl	__udivsi3
	add	r7, r0, #0
	cmp	r4, #0x9
	bgt	.L8061EE2	@cond_branch
	add	r4, r4, #0x30
	b	.L8061EEE
.L8061EE2:
	mov	r0, sl
	cmp	r0, #0
	beq	.L8061EEC	@cond_branch
	add	r4, r4, #0x37
	b	.L8061EEE
.L8061EEC:
	add	r4, r4, #0x57
.L8061EEE:
	strb	r4, [r5]
	add	r5, r5, #0x1
	cmp	r7, #0
	beq	.L8061EFC	@cond_branch
	sub	r6, r6, #0x1
	cmp	r6, #0
	bne	.L8061EC6	@cond_branch
.L8061EFC:
	ldr	r0, [sp, #0x10]
	cmp	r0, #0
	beq	.L8061F26	@cond_branch
	add	r0, r6, #0
	sub	r6, r6, #0x1
	cmp	r0, #0
	ble	.L8061F26	@cond_branch
	mov	r1, #0x30
.L8061F0C:
	strb	r1, [r5]
	add	r5, r5, #0x1
	add	r0, r6, #0
	sub	r6, r6, #0x1
	cmp	r0, #0
	bgt	.L8061F0C	@cond_branch
	b	.L8061F26
.L8061F1A:
	sub	r5, r5, #0x1
	ldrb	r1, [r5]
	mov	r0, r9
	bl	sub_8061E94
	mov	r9, r0
.L8061F26:
	cmp	r5, sp
	bhi	.L8061F1A	@cond_branch
	mov	r0, r9
	add	sp, sp, #0x14
	pop	{r3, r4, r5}
	mov	r8, r3
	mov	r9, r4
	mov	sl, r5
	pop	{r4, r5, r6, r7}
	pop	{r1}
	bx	r1
	thumb_func_end sub_8061E9C

.align 2, 0 @ Don't pad with nop.
