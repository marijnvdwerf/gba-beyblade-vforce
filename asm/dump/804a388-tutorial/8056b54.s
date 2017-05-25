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
	bhi	.L20	@cond_branch
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
	.4byte	.L25
	.4byte	.L20
	.4byte	.L25
	.4byte	.L20
	.4byte	.L20
	.4byte	.L20
	.4byte	.L25
	.4byte	.L25
	.4byte	.L20
	.4byte	.L25
	.4byte	.L20
	.4byte	.L25
	.4byte	.L25
	.4byte	.L25
	.4byte	.L25
	.4byte	.L20
	.4byte	.L25
	.4byte	.L25
	.4byte	.L25
.L20:
	mov	r0, #0x4
	ldrb	r1, [r4, #0x11]
	and	r0, r0, r1
	cmp	r0, #0
	bne	.L24	@cond_branch
	add	r0, r6, #0
	add	r1, r4, #0
	add	r2, r5, #0
	mov	r3, sp
	bl	sub_80567E4
	b	.L25
.L24:
	add	r0, r6, #0
	add	r1, r4, #0
	add	r2, r5, #0
	mov	r3, sp
	bl	sub_8056910
.L25:
	ldr	r0, [sp, #0x8]
	asr	r0, r0, #0x8
	ldrh	r1, [r7, #0x12]
	cmp	r1, r0
	bge	.L26	@cond_branch
	strh	r0, [r7, #0x12]
.L26:
	add	sp, sp, #0x28
	pop	{r4, r5, r6, r7}
	pop	{r1}
	bx	r1
	thumb_func_end sub_8056B54

.align 2, 0 @ Don't pad with nop.
