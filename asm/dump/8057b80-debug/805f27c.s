	.include "asm/common.inc"

	thumb_func_start sub_805F27C
sub_805F27C:
	push	{r4, r5, r6, r7, lr}
	add	sp, sp, #0xfffffff0
	mov	ip, r0
	add	r5, r1, #0
	add	r6, r2, #0
	ldr	r7, [sp, #0x24]
	mov	r1, ip
	add	r1, r1, #0x52
	mov	r0, #0x2
	ldrh	r1, [r1]
	and	r0, r0, r1
	lsl	r0, r0, #0x10
	lsr	r1, r0, #0x10
	cmp	r1, #0
	bne	.L1	@cond_branch
	mov	r2, ip
	ldr	r0, [r2, #0x60]
	str	r0, [sp]
	str	r1, [sp, #0x4]
	mov	r0, #0x40
	str	r0, [sp, #0x8]
	mov	r0, ip
	add	r0, r0, #0x4e
	ldrh	r0, [r0]
	lsl	r0, r0, #0x5
	ldr	r4, .L3
	add	r0, r0, r4
	b	.L2
.L4:
	.align	2, 0
.L3:
	.4byte	0x6010000
.L1:
	ldrh	r1, [r7, #0x30]
	lsl	r0, r1, #0x10
	asr	r0, r0, #0x16
	lsl	r0, r0, #0x10
	lsr	r4, r0, #0x10
	asr	r1, r0, #0x11
	mov	r2, #0x7
	and	r2, r2, r1
	cmp	r2, #0x3
	ble	.L5	@cond_branch
	add	r0, r1, #0
	add	r0, r0, #0x8
	sub	r0, r0, r2
	lsl	r0, r0, #0x10
	b	.L6
.L5:
	mov	r0, #0x4
	NEG	r0, r0
	and	r1, r1, r0
	lsl	r0, r1, #0x10
.L6:
	lsr	r2, r0, #0x10
	lsl	r0, r4, #0x10
	asr	r0, r0, #0x10
	lsl	r2, r2, #0x10
	asr	r1, r2, #0x10
	sub	r0, r0, r1
	lsl	r0, r0, #0x10
	asr	r0, r0, #0x10
	mov	r1, #0x7
	and	r1, r1, r0
	cmp	r1, #0
	beq	.L7	@cond_branch
	add	r0, r0, #0x8
	sub	r0, r0, r1
.L7:
	lsl	r0, r0, #0x10
	lsr	r4, r0, #0x10
	mov	r0, ip
	add	r0, r0, #0x4d
	ldrb	r1, [r0]
	cmp	r1, #0
	bne	.L8	@cond_branch
	mov	r4, ip
	ldr	r0, [r4, #0x60]
	str	r0, [sp]
	str	r1, [sp, #0x4]
	asr	r0, r2, #0x10
	str	r0, [sp, #0x8]
	mov	r0, ip
	add	r0, r0, #0x4e
	ldrh	r0, [r0]
	lsl	r0, r0, #0x5
	ldr	r1, .L10
	add	r0, r0, r1
.L2:
	str	r0, [sp, #0xc]
	ldr	r4, [r5, #0x30]
	mov	r0, ip
	add	r1, r6, #0
	add	r2, r3, #0
	add	r3, r7, #0
	bl	call_via_r4
	b	.L9
.L11:
	.align	2, 0
.L10:
	.4byte	0x6010000
.L8:
	mov	r1, ip
	ldr	r0, [r1, #0x60]
	str	r0, [sp]
	asr	r0, r2, #0x10
	str	r0, [sp, #0x4]
	lsl	r0, r4, #0x10
	asr	r0, r0, #0x10
	str	r0, [sp, #0x8]
	mov	r0, ip
	add	r0, r0, #0x4e
	ldrh	r0, [r0]
	lsl	r1, r0, #0x5
	asr	r0, r2, #0x13
	lsl	r0, r0, #0x9
	ldr	r2, .L12
	add	r0, r0, r2
	add	r1, r1, r0
	str	r1, [sp, #0xc]
	ldr	r4, [r5, #0x30]
	mov	r0, ip
	add	r1, r6, #0
	add	r2, r3, #0
	add	r3, r7, #0
	bl	call_via_r4
.L9:
	add	sp, sp, #0x10
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L13:
	.align	2, 0
.L12:
	.4byte	0x6010000
	thumb_func_end sub_805F27C

.align 2, 0 @ Don't pad with nop.
