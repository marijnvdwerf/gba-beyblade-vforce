	.include "asm/common.inc"

	thumb_func_start sub_805D430
sub_805D430:
	push	{r4, r5, r6, lr}
	add	sp, sp, #0xfffffff8
	mov	ip, r0
	add	r5, r1, #0
	add	r0, r0, #0x84
	ldr	r1, [r0]
	mov	r0, #0x1
	NEG	r0, r0
	cmp	r1, r0
	bne	.L1	@cond_branch
	mov	r0, ip
	add	r0, r0, #0x9a
	mov	r1, #0x0
	ldsh	r0, [r0, r1]
	lsl	r0, r0, #0x8
	mov	r6, ip
	ldr	r2, [r6, #0x4]
	add	r2, r2, r0
	mov	r0, ip
	add	r0, r0, #0x9c
	mov	r1, #0x0
	ldsh	r0, [r0, r1]
	lsl	r0, r0, #0x8
	ldr	r3, [r6, #0x8]
	add	r3, r3, r0
	ldr	r4, [r6, #0x40]
	add	r4, r2, r4
	ldr	r0, [r6, #0x4c]
	add	r4, r4, r0
	ldr	r0, [r6, #0x44]
	add	r0, r3, r0
	ldr	r1, [r6, #0x50]
	add	r0, r0, r1
	str	r4, [sp]
	str	r0, [sp, #0x4]
	mov	r0, ip
	add	r1, r5, #0
	bl	sub_805D488
.L1:
	add	sp, sp, #0x8
	pop	{r4, r5, r6}
	pop	{r0}
	bx	r0
	thumb_func_end sub_805D430

.align 2, 0 @ Don't pad with nop.
