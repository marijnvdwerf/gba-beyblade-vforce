	.include "asm/common.inc"

	thumb_func_start sub_8056B54
sub_8056B54:
	push	{r4, r5, r6, r7, lr}
	add	sp, sp, #0xffffffd8
	add	r5, r0, #0
	add	r6, r1, #0
	add	r4, r2, #0
	add	r0, r0, #0xb4
	ldr	r0, [r0]
	bl	GetStruct4
	add	r7, r0, #0
	mov	r0, #0x0
	str	r0, [sp, #0x8]
	ldrb	r0, [r4, #0xf]
	sub	r0, r0, #0x80
	cmp	r0, #0x12
	bhi	.L8056BD0	@cond_branch
	lsl	r0, r0, #0x2
	ldr	r1, .L8056B80
	add	r0, r0, r1
	ldr	r0, [r0]
	mov	pc, r0
.L8056B7E:
	.align	2, 0
.L8056B80:
	.4byte	.L8056B84
.L8056B84:
	.4byte	.L8056BF4
	.4byte	.L8056BD0
	.4byte	.L8056BF4
	.4byte	.L8056BD0
	.4byte	.L8056BD0
	.4byte	.L8056BD0
	.4byte	.L8056BF4
	.4byte	.L8056BF4
	.4byte	.L8056BD0
	.4byte	.L8056BF4
	.4byte	.L8056BD0
	.4byte	.L8056BF4
	.4byte	.L8056BF4
	.4byte	.L8056BF4
	.4byte	.L8056BF4
	.4byte	.L8056BD0
	.4byte	.L8056BF4
	.4byte	.L8056BF4
	.4byte	.L8056BF4
.L8056BD0:
	mov	r0, #0x4
	ldrb	r1, [r4, #0x11]
	and	r0, r0, r1
	cmp	r0, #0
	bne	.L8056BE8	@cond_branch
	add	r0, r6, #0
	add	r1, r4, #0
	add	r2, r5, #0
	mov	r3, sp
	bl	sub_80567E4
	b	.L8056BF4
.L8056BE8:
	add	r0, r6, #0
	add	r1, r4, #0
	add	r2, r5, #0
	mov	r3, sp
	bl	sub_8056910
.L8056BF4:
	ldr	r0, [sp, #0x8]
	asr	r0, r0, #0x8
	ldrh	r1, [r7, #0x12]
	cmp	r1, r0
	bge	.L8056C00	@cond_branch
	strh	r0, [r7, #0x12]
.L8056C00:
	add	sp, sp, #0x28
	pop	{r4, r5, r6, r7}
	pop	{r1}
	bx	r1
	thumb_func_end sub_8056B54

.align 2, 0 @ Don't pad with nop.
