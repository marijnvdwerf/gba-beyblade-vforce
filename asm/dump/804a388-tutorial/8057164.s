	.include "asm/common.inc"

	thumb_func_start sub_8057164
sub_8057164:
	push	{r4, r5, r6, lr}
	add	r2, r0, #0
	ldr	r0, [r2, #0x4]
	add	r4, r0, #4
	mov	r3, #0x0
	ldsh	r1, [r2, r3]
	ldr	r0, [r0]
	cmp	r1, r0
	bne	.L8057180	@cond_branch
	ldr	r0, .L805717C
	b	.L80571C8
.L805717A:
	.align	2, 0
.L805717C:
	.4byte	0xffff
.L8057180:
	mov	r6, #0x0
	ldsh	r3, [r2, r6]
	mov	r0, #0x1
	neg	r0, r0
	ldrh	r5, [r2]
	cmp	r3, r0
	beq	.L80571CA	@cond_branch
	ldrh	r1, [r2, #0x2]
	mov	r6, #0x2
	ldsh	r0, [r2, r6]
	cmp	r0, #0
	bne	.L805719E	@cond_branch
	cmp	r3, #0
	bne	.L80571CA	@cond_branch
	b	.L80571A2
.L805719E:
	sub	r0, r1, #1
	strh	r0, [r2, #0x2]
.L80571A2:
	ldr	r1, .L80571BC
	mov	r3, #0x0
	ldsh	r0, [r2, r3]
	lsl	r0, r0, #0x1
	add	r0, r0, r4
	ldrh	r1, [r1]
	ldrh	r0, [r0]
	cmp	r1, r0
	bne	.L80571C0	@cond_branch
	mov	r0, #0x3c
	strh	r0, [r2, #0x2]
	add	r0, r5, #1
	b	.L80571C8
.L80571BC:
	.align	2, 0

	.4byte	_unk3005DA0
.L80571C0:
	cmp	r1, #0
	beq	.L80571CA	@cond_branch
	mov	r0, #0x0
	strh	r0, [r2, #0x2]
.L80571C8:
	strh	r0, [r2]
.L80571CA:
	pop	{r4, r5, r6}
	pop	{r0}
	bx	r0
	thumb_func_end sub_8057164

.align 2, 0 @ Don't pad with nop.
