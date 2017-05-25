	.include "asm/common.inc"

	thumb_func_start sub_8067138
sub_8067138:
	push	{r4, r5, r6, r7, lr}
	mov	r7, sl
	mov	r6, r9
	mov	r5, r8
	push	{r5, r6, r7}
	add	sp, sp, #0xffffff8c
	str	r0, [sp, #0x3c]
	str	r1, [sp, #0x40]
	str	r2, [sp, #0x44]
	str	r3, [sp, #0x48]
	add	r0, sp, #0x3c
	mov	r1, sp
	bl	sub_8066D8C
	add	r0, sp, #0x44
	add	r4, sp, #0x14
	add	r1, r4, #0
	bl	sub_8066D8C
	mov	r8, sp
	add	r0, sp, #0x28
	mov	sl, r0
	mov	r0, #0x0
	ldr	r1, [sp]
	cmp	r1, #0x1
	bhi	.L1	@cond_branch
	mov	r0, #0x1
.L1:
	cmp	r0, #0
	bne	.L10	@cond_branch
	mov	r2, #0x0
	ldr	r0, [sp, #0x14]
	cmp	r0, #0x1
	bhi	.L3	@cond_branch
	mov	r2, #0x1
.L3:
	cmp	r2, #0
	beq	.L4	@cond_branch
	ldr	r0, [sp, #0x4]
	b	.L18
.L4:
	mov	r2, #0x0
	cmp	r1, #0x4
	bne	.L6	@cond_branch
	mov	r2, #0x1
.L6:
	cmp	r2, #0
	beq	.L7	@cond_branch
	mov	r1, #0x0
	cmp	r0, #0x2
	bne	.L8	@cond_branch
	mov	r1, #0x1
.L8:
	cmp	r1, #0
	bne	.L9	@cond_branch
	b	.L10
.L7:
	mov	r2, #0x0
	cmp	r0, #0x4
	bne	.L11	@cond_branch
	mov	r2, #0x1
.L11:
	cmp	r2, #0
	beq	.L12	@cond_branch
	mov	r0, #0x0
	cmp	r1, #0x2
	bne	.L13	@cond_branch
	mov	r0, #0x1
.L13:
	cmp	r0, #0
	beq	.L14	@cond_branch
.L9:
	ldr	r0, .L16
	b	.L24
.L17:
	.align	2, 0
.L16:
	.4byte	0x3000dc8
.L14:
	mov	r1, r8
	ldr	r0, [r1, #0x4]
	b	.L18
.L12:
	mov	r2, #0x0
	cmp	r1, #0x2
	bne	.L19	@cond_branch
	mov	r2, #0x1
.L19:
	cmp	r2, #0
	beq	.L20	@cond_branch
.L10:
	ldr	r0, [sp, #0x4]
	ldr	r1, [sp, #0x18]
	EOR	r0, r1
	NEG	r1, r0
	orr	r1, r1, r0
	lsr	r1, r1, #0x1f
	str	r1, [sp, #0x4]
	mov	r0, sp
	b	.L24
.L20:
	mov	r1, #0x0
	cmp	r0, #0x2
	bne	.L22	@cond_branch
	mov	r1, #0x1
.L22:
	cmp	r1, #0
	beq	.L23	@cond_branch
	mov	r2, r8
	ldr	r0, [r2, #0x4]
.L18:
	ldr	r1, [sp, #0x18]
	EOR	r0, r1
	NEG	r1, r0
	orr	r1, r1, r0
	lsr	r1, r1, #0x1f
	str	r1, [sp, #0x18]
	add	r0, r4, #0
	b	.L24
.L23:
	mov	r4, r8
	ldr	r0, [r4, #0xc]
	ldr	r1, [r4, #0x10]
	add	r6, r0, #0
	mov	r7, #0x0
	str	r1, [sp, #0x4c]
	mov	r5, #0x0
	str	r5, [sp, #0x50]
	ldr	r0, [sp, #0x20]
	ldr	r1, [sp, #0x24]
	add	r4, r0, #0
	str	r1, [sp, #0x54]
	mov	r0, #0x0
	str	r0, [sp, #0x58]
	add	r1, r5, #0
	add	r0, r4, #0
	add	r3, r7, #0
	add	r2, r6, #0
	bl	sub_8066150
	str	r0, [sp, #0x5c]
	str	r1, [sp, #0x60]
	ldr	r0, [sp, #0x54]
	ldr	r1, [sp, #0x58]
	add	r3, r7, #0
	add	r2, r6, #0
	bl	sub_8066150
	add	r7, r1, #0
	add	r6, r0, #0
	add	r1, r5, #0
	add	r0, r4, #0
	ldr	r2, [sp, #0x4c]
	ldr	r3, [sp, #0x50]
	bl	sub_8066150
	add	r5, r1, #0
	add	r4, r0, #0
	ldr	r0, [sp, #0x54]
	ldr	r1, [sp, #0x58]
	ldr	r2, [sp, #0x4c]
	ldr	r3, [sp, #0x50]
	bl	sub_8066150
	str	r0, [sp, #0x64]
	str	r1, [sp, #0x68]
	mov	r1, #0x0
	mov	r2, #0x0
	str	r1, [sp, #0x6c]
	str	r2, [sp, #0x70]
	add	r3, r7, #0
	add	r2, r6, #0
	add	r2, r2, r4
	ADC	r3, r5
	cmp	r7, r3
	bhi	.L25	@cond_branch
	cmp	r7, r3
	bne	.L27	@cond_branch
	cmp	r6, r2
	bls	.L27	@cond_branch
.L25:
	ldr	r5, .L41 + 4
	ldr	r4, .L41
	str	r4, [sp, #0x6c]
	str	r5, [sp, #0x70]
.L27:
	add	r1, r2, #0
	mov	r6, #0x0
	add	r7, r1, #0
	ldr	r0, [sp, #0x5c]
	ldr	r1, [sp, #0x60]
	add	r6, r6, r0
	ADC	r7, r1
	cmp	r1, r7
	bhi	.L28	@cond_branch
	ldr	r1, [sp, #0x60]
	cmp	r1, r7
	bne	.L30	@cond_branch
	cmp	r0, r6
	bls	.L30	@cond_branch
.L28:
	mov	r0, #0x1
	mov	r1, #0x0
	ldr	r4, [sp, #0x6c]
	ldr	r5, [sp, #0x70]
	add	r4, r4, r0
	ADC	r5, r1
	str	r4, [sp, #0x6c]
	str	r5, [sp, #0x70]
.L30:
	add	r0, r3, #0
	add	r2, r0, #0
	mov	r3, #0x0
	add	r5, r3, #0
	add	r4, r2, #0
	ldr	r0, [sp, #0x64]
	ldr	r1, [sp, #0x68]
	add	r4, r4, r0
	ADC	r5, r1
	ldr	r1, [sp, #0x6c]
	ldr	r2, [sp, #0x70]
	add	r4, r4, r1
	ADC	r5, r2
	mov	r0, r8
	ldr	r2, [r0, #0x8]
	ldr	r0, [sp, #0x1c]
	add	r2, r2, r0
	str	r2, [sp, #0x30]
	mov	r0, r8
	ldr	r1, [r0, #0x4]
	ldr	r0, [sp, #0x18]
	EOR	r1, r0
	NEG	r0, r1
	orr	r0, r0, r1
	lsr	r0, r0, #0x1f
	str	r0, [sp, #0x2c]
	add	r2, r2, #0x4
	str	r2, [sp, #0x30]
	ldr	r0, .L41 + 8
	cmp	r5, r0
	bls	.L31	@cond_branch
	mov	r1, #0x1
	mov	r9, r1
	mov	r8, r0
	mov	ip, r2
.L33:
	mov	r2, #0x1
	ADD ip, r2
	mov	r0, r9
	and	r0, r0, r4
	cmp	r0, #0
	beq	.L32	@cond_branch
	lsl	r3, r7, #0x1f
	lsr	r2, r6, #0x1
	add	r0, r3, #0
	orr	r0, r0, r2
	lsr	r1, r7, #0x1
	add	r7, r1, #0
	add	r6, r0, #0
	add	r0, r6, #0
	mov	r1, #0x80
	lsl	r1, r1, #0x18
	orr	r1, r1, r7
	add	r7, r1, #0
	add	r6, r0, #0
.L32:
	lsl	r3, r5, #0x1f
	lsr	r2, r4, #0x1
	add	r0, r3, #0
	orr	r0, r0, r2
	lsr	r1, r5, #0x1
	add	r5, r1, #0
	add	r4, r0, #0
	cmp	r5, r8
	bhi	.L33	@cond_branch
	mov	r0, ip
	str	r0, [sp, #0x30]
.L31:
	ldr	r0, .L41 + 12
	cmp	r5, r0
	bhi	.L34	@cond_branch
	mov	r1, #0x80
	lsl	r1, r1, #0x18
	mov	r9, r1
	mov	r8, r0
	ldr	r2, [sp, #0x30]
	mov	ip, r2
.L36:
	mov	r0, #0x1
	NEG	r0, r0
	ADD ip, r0
	lsr	r3, r4, #0x1f
	lsl	r2, r5, #0x1
	add	r1, r3, #0
	orr	r1, r1, r2
	lsl	r0, r4, #0x1
	add	r5, r1, #0
	add	r4, r0, #0
	mov	r0, #0x0
	mov	r1, r9
	and	r1, r1, r7
	orr	r0, r0, r1
	cmp	r0, #0
	beq	.L35	@cond_branch
	mov	r0, #0x1
	orr	r0, r0, r4
	add	r1, r5, #0
	add	r5, r1, #0
	add	r4, r0, #0
.L35:
	lsr	r3, r6, #0x1f
	lsl	r2, r7, #0x1
	add	r1, r3, #0
	orr	r1, r1, r2
	lsl	r0, r6, #0x1
	add	r7, r1, #0
	add	r6, r0, #0
	cmp	r5, r8
	bls	.L36	@cond_branch
	mov	r1, ip
	str	r1, [sp, #0x30]
.L34:
	mov	r0, #0xff
	add	r1, r4, #0
	and	r1, r1, r0
	mov	r2, #0x0
	cmp	r1, #0x80
	bne	.L40	@cond_branch
	cmp	r2, #0
	bne	.L40	@cond_branch
	add	r0, r0, #0x1
	add	r1, r4, #0
	and	r1, r1, r0
	add	r0, r2, #0
	orr	r0, r0, r1
	cmp	r0, #0
	bne	.L39	@cond_branch
	add	r0, r7, #0
	orr	r0, r0, r6
	cmp	r0, #0
	beq	.L40	@cond_branch
.L39:
	mov	r0, #0x80
	mov	r1, #0x0
	add	r4, r4, r0
	ADC	r5, r1
.L40:
	str	r4, [sp, #0x34]
	str	r5, [sp, #0x38]
	mov	r0, #0x3
	mov	r2, sl
	str	r0, [r2]
	add	r0, sp, #0x28
.L24:
	bl	sub_8066C44
	add	sp, sp, #0x74
	pop	{r3, r4, r5}
	mov	r8, r3
	mov	r9, r4
	mov	sl, r5
	pop	{r4, r5, r6, r7, pc}
.L42:
	.align	2, 0
.L41:
	.4byte	0x0
	.4byte	0x1
	.4byte	0x1fffffff
	.4byte	0xfffffff
	thumb_func_end sub_8067138

.align 2, 0 @ Don't pad with nop.
