	.include "asm/common.inc"

	thumb_func_start sub_8061078
sub_8061078:
	push	{r4, r5, r6, lr}
	add	r4, r0, #0
	lsl	r1, r1, #0x10
	lsr	r2, r1, #0x10
	ldrh	r0, [r4, #0x22]
	cmp	r0, r2
	beq	.L80610E4	@cond_branch
	ldr	r1, [r4]
	cmp	r1, #0
	beq	.L8061098	@cond_branch
	ldr	r0, [r4, #0x4]
	str	r0, [r1, #0x4]
	ldr	r6, .L8061094
	b	.L80610A0
.L8061094:
	.align	2, 0

	.4byte	_unk3005DE4
.L8061098:
	ldr	r1, .L80610D0
	ldr	r0, [r4, #0x4]
	str	r0, [r1]
	add	r6, r1, #0
.L80610A0:
	ldr	r1, [r4, #0x4]
	cmp	r1, #0
	beq	.L80610AA	@cond_branch
	ldr	r0, [r4]
	str	r0, [r1]
.L80610AA:
	strh	r2, [r4, #0x22]
	add	r5, r6, #0
	ldr	r0, [r5]
	add	r1, r2, #0
	bl	sub_80609C4
	add	r1, r0, #0
	cmp	r1, #0
	bne	.L80610D4	@cond_branch
	ldr	r0, [r5]
	cmp	r0, #0
	beq	.L80610C4	@cond_branch
	str	r4, [r0]
.L80610C4:
	ldr	r0, [r6]
	str	r0, [r4, #0x4]
	str	r1, [r4]
	str	r4, [r6]
	b	.L80610E4
.L80610CE:
	.align	2, 0
.L80610D0:
	.4byte	_unk3005DE4
.L80610D4:
	ldr	r0, [r1, #0x4]
	cmp	r0, #0
	beq	.L80610DC	@cond_branch
	str	r4, [r0]
.L80610DC:
	ldr	r0, [r1, #0x4]
	str	r0, [r4, #0x4]
	str	r1, [r4]
	str	r4, [r1, #0x4]
.L80610E4:
	pop	{r4, r5, r6}
	pop	{r0}
	bx	r0
	thumb_func_end sub_8061078

.align 2, 0 @ Don't pad with nop.
