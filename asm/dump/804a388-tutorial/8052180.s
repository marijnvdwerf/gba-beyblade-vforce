	.include "asm/common.inc"

	thumb_func_start sub_8052180
sub_8052180:
	push	{r4, r5, r6, r7, lr}
	mov	r7, sl
	mov	r6, r9
	mov	r5, r8
	push	{r5, r6, r7}
	add	sp, sp, #0xffffff7c
	str	r1, [sp, #0x7c]
	ldr	r0, .L1
	ldr	r6, [r0]
	ldr	r0, [r6, #0x10]
	asr	r0, r0, #0x4
	add	r0, r0, #0x40
	mov	r5, #0xff
	add	r2, r5, #0
	BIC	r2, r0
	ldr	r4, .L1 + 4
	mov	r1, #0xb6
	lsl	r1, r1, #0x1
	add	r0, r6, r1
	ldr	r3, [r0]
	sub	r0, r3, #1
	sub	r0, r2, r0
	and	r0, r0, r5
	lsr	r0, r0, #0x1
	lsl	r1, r0, #0x1
	add	r1, r1, r4
	mov	r8, r1
	mov	r7, #0x0
	ldsh	r1, [r1, r7]
	str	r1, [sp, #0x70]
	add	r0, r0, #0x40
	lsl	r0, r0, #0x1
	add	r0, r0, r4
	mov	r7, #0x0
	ldsh	r1, [r0, r7]
	str	r1, [sp, #0x74]
	mov	r1, #0xba
	lsl	r1, r1, #0x1
	add	r0, r6, r1
	ldr	r0, [r0]
	and	r0, r0, r5
	lsr	r0, r0, #0x1
	lsl	r1, r0, #0x1
	add	r1, r1, r4
	mov	r8, r1
	mov	r7, #0x0
	ldsh	r1, [r1, r7]
	str	r1, [sp, #0x78]
	add	r0, r0, #0x40
	lsl	r0, r0, #0x1
	add	r0, r0, r4
	mov	r7, #0x0
	ldsh	r1, [r0, r7]
	mov	ip, r1
	ldr	r1, [r6, #0x6c]
	asr	r1, r1, #0x4
	add	r0, r5, #0
	BIC	r0, r1
	lsr	r0, r0, #0x1
	lsl	r1, r0, #0x1
	add	r1, r1, r4
	mov	r7, #0x0
	ldsh	r6, [r1, r7]
	str	r6, [sp, #0x80]
	add	r0, r0, #0x40
	lsl	r0, r0, #0x1
	add	r0, r0, r4
	mov	r6, #0x0
	ldsh	r1, [r0, r6]
	mov	r8, r1
	and	r3, r3, r5
	lsr	r3, r3, #0x1
	lsl	r0, r3, #0x1
	add	r0, r0, r4
	mov	r1, #0x0
	ldsh	r7, [r0, r1]
	mov	sl, r7
	add	r3, r3, #0x40
	lsl	r3, r3, #0x1
	add	r3, r3, r4
	mov	r6, #0x0
	ldsh	r5, [r3, r6]
	mov	r9, r5
	MVN	r2, r2
	lsl	r2, r2, #0x18
	lsr	r2, r2, #0x18
	add	r0, r2, #0
	add	r0, r0, #0x40
	lsl	r0, r0, #0x1
	add	r0, r0, r4
	mov	r7, #0x0
	ldsh	r1, [r0, r7]
	lsl	r0, r1, #0x7
	sub	r0, r0, r1
	asr	r0, r0, #0x8
	ldr	r1, [sp, #0x7c]
	add	r1, r1, #0x24
	mov	r3, #0x0
	strb	r0, [r1]
	lsl	r2, r2, #0x1
	add	r2, r2, r4
	mov	r0, #0x0
	ldsh	r1, [r2, r0]
	lsl	r0, r1, #0x7
	sub	r0, r0, r1
	asr	r0, r0, #0x8
	ldr	r1, [sp, #0x7c]
	add	r1, r1, #0x26
	strb	r0, [r1]
	add	r1, sp, #0x30
	str	r3, [sp, #0x30]
	ldr	r2, [sp, #0x70]
	str	r2, [r1, #0x4]
	str	r3, [r1, #0x8]
	ldr	r5, [sp, #0x74]
	str	r5, [r1, #0xc]
	add	r0, sp, #0x40
	str	r3, [sp, #0x40]
	str	r3, [r0, #0x4]
	ldr	r7, [sp, #0x80]
	NEG	r6, r7
	str	r6, [r0, #0x8]
	mov	r2, r8
	str	r2, [r0, #0xc]
	add	r5, sp, #0x50
	str	r3, [sp, #0x50]
	str	r3, [r5, #0x4]
	ldr	r6, [sp, #0x78]
	str	r6, [r5, #0x8]
	mov	r7, ip
	str	r7, [r5, #0xc]
	add	r4, sp, #0x60
	str	r3, [sp, #0x60]
	mov	r2, sl
	str	r2, [r4, #0x4]
	str	r3, [r4, #0x8]
	mov	r3, r9
	str	r3, [r4, #0xc]
	mov	r2, sp
	bl	sub_805A148
	add	r6, sp, #0x10
	mov	r0, sp
	add	r1, r5, #0
	add	r2, r6, #0
	bl	sub_805A148
	add	r5, sp, #0x20
	add	r0, r6, #0
	add	r1, r4, #0
	add	r2, r5, #0
	bl	sub_805A148
	ldr	r1, [sp, #0x7c]
	add	r1, r1, #0x34
	add	r0, r5, #0
	bl	sub_805A1DC
	add	sp, sp, #0x84
	pop	{r3, r4, r5}
	mov	r8, r3
	mov	r9, r4
	mov	sl, r5
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L2:
	.align	2, 0
.L1:
	.4byte	0x3000fb0
	.4byte	0x874cc3c
	thumb_func_end sub_8052180

.align 2, 0 @ Don't pad with nop.
