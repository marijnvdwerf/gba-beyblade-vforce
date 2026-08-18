	.include "asm/common.inc"

	thumb_func_start sub_8058794
sub_8058794:
	push	{r4, r5, r6, r7, lr}
	mov	r7, r9
	mov	r6, r8
	push	{r6, r7}
	add	r4, r0, #0
	mov	r8, r1
	mov	r9, r2
	add	r7, r3, #0
	ldr	r1, [r4, #0x74]
	mov	r0, #0x1
	NEG	r0, r0
	cmp	r1, r0
	bne	.L80587CE	@cond_branch
	mov	r0, #0x0
	str	r0, [r4, #0x74]
	mov	r0, #0x40
	bl	slowAllocate
	cmp	r0, #0
	bne	.L80587C8	@cond_branch
	ldr	r0, .L80587C4
	bl	nullsub_8
	b	.L805882C
.L80587C4:
	.align	2, 0

	.4byte	0x872cbcc
.L80587C8:
	str	r0, [r4, #0x7c]
	ldr	r0, [r0]
	str	r0, [r4, #0x78]
.L80587CE:
	ldr	r1, [r4, #0x74]
	cmp	r1, #0x3
	ble	.L8058812	@cond_branch
	mov	r5, #0x1
	NEG	r5, r5
	mov	r6, #0x0
	mov	r2, #0x0
	ldr	r3, [r4, #0x78]
	add	r1, r3, #0
.L80587E0:
	ldr	r0, [r1]
	cmp	r0, #0
	bne	.L80587EE	@cond_branch
	cmp	r5, #0
	bge	.L80587EC	@cond_branch
	add	r5, r2, #0
.L80587EC:
	add	r6, r6, #0x1
.L80587EE:
	add	r1, r1, #0x10
	add	r2, r2, #0x1
	cmp	r2, #0x3
	ble	.L80587E0	@cond_branch
	mov	r0, #0x1
	NEG	r0, r0
	cmp	r5, r0
	bne	.L8058802	@cond_branch
	add	r1, r3, #0
	b	.L8058806
.L8058802:
	lsl	r0, r5, #0x4
	add	r1, r3, r0
.L8058806:
	cmp	r6, #0x4
	bne	.L8058818	@cond_branch
	mov	r0, #0x0
	str	r0, [r4, #0x74]
	add	r1, r3, #0
	b	.L8058818
.L8058812:
	lsl	r1, r1, #0x4
	ldr	r0, [r4, #0x78]
	add	r1, r0, r1
.L8058818:
	mov	r0, r8
	str	r0, [r1, #0x8]
	str	r7, [r1]
	ldr	r0, [sp, #0x1c]
	str	r0, [r1, #0x4]
	mov	r0, r9
	str	r0, [r1, #0xc]
	ldr	r0, [r4, #0x74]
	add	r0, r0, #0x1
	str	r0, [r4, #0x74]
.L805882C:
	pop	{r3, r4}
	mov	r8, r3
	mov	r9, r4
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
	thumb_func_end sub_8058794

.align 2, 0 @ Don't pad with nop.
