	.include "asm/common.inc"

	thumb_func_start sub_8057A7C
sub_8057A7C:
	push	{r4, r5, r6, r7, lr}
	mov	r7, r9
	mov	r6, r8
	push	{r6, r7}
	add	r7, r0, #0
	lsl	r1, r1, #0x18
	lsr	r1, r1, #0xf
	mov	r0, #0xa0
	lsl	r0, r0, #0x13
	add	r6, r1, r0
	mov	r0, #0x0
	mov	ip, r0
	mov	r1, #0xf8
	lsl	r1, r1, #0x2
	mov	r9, r1
	lsl	r2, r2, #0x10
	asr	r5, r2, #0x10
	mov	r4, #0xf8
	lsl	r4, r4, #0x7
	mov	r8, r4
.L7:
	ldrh	r2, [r7]
	mov	r3, #0x1f
	add	r0, r2, #0
	mov	r1, r9
	and	r0, r0, r1
	add	r1, r2, #0
	mov	r4, r8
	and	r1, r1, r4
	and	r2, r2, r3
	add	r2, r2, r5
	lsl	r2, r2, #0x10
	lsr	r0, r0, #0x5
	add	r0, r0, r5
	lsl	r0, r0, #0x10
	lsr	r3, r0, #0x10
	lsr	r1, r1, #0xa
	add	r1, r1, r5
	lsl	r1, r1, #0x10
	lsr	r4, r1, #0x10
	lsr	r1, r2, #0x10
	asr	r2, r2, #0x10
	cmp	r2, #0x1f
	ble	.L1	@cond_branch
	mov	r1, #0x1f
.L1:
	lsl	r0, r3, #0x10
	asr	r0, r0, #0x10
	cmp	r0, #0x1f
	ble	.L2	@cond_branch
	mov	r3, #0x1f
.L2:
	lsl	r0, r4, #0x10
	asr	r0, r0, #0x10
	cmp	r0, #0x1f
	ble	.L3	@cond_branch
	mov	r4, #0x1f
.L3:
	lsl	r0, r1, #0x10
	cmp	r0, #0
	bge	.L4	@cond_branch
	mov	r1, #0x0
.L4:
	lsl	r0, r3, #0x10
	cmp	r0, #0
	bge	.L5	@cond_branch
	mov	r3, #0x0
.L5:
	lsl	r0, r4, #0x10
	cmp	r0, #0
	bge	.L6	@cond_branch
	mov	r4, #0x0
.L6:
	lsl	r0, r3, #0x10
	asr	r0, r0, #0xb
	lsl	r1, r1, #0x10
	asr	r1, r1, #0x10
	add	r1, r1, r0
	lsl	r0, r4, #0x10
	asr	r0, r0, #0x6
	add	r1, r1, r0
	strh	r1, [r6]
	add	r7, r7, #0x2
	add	r6, r6, #0x2
	mov	r0, ip
	add	r0, r0, #0x1
	lsl	r0, r0, #0x10
	lsr	r0, r0, #0x10
	mov	ip, r0
	cmp	r0, #0x7
	bls	.L7	@cond_branch
	pop	{r3, r4}
	mov	r8, r3
	mov	r9, r4
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
	thumb_func_end sub_8057A7C

.align 2, 0 @ Don't pad with nop.
