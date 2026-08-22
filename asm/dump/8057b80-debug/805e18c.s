	.include "asm/common.inc"

	thumb_func_start sub_805E18C
sub_805E18C:
	push	{r4, r5, r6, r7, lr}
	mov	r7, sl
	mov	r6, r9
	mov	r5, r8
	push	{r5, r6, r7}
	add	sp, sp, #0xffffffd0
	str	r0, [sp, #0x10]
	str	r2, [sp, #0x14]
	mov	sl, r3
	mov	r0, #0x0
	str	r0, [sp, #0x2c]
	lsl	r1, r1, #0x2
	ldr	r0, [sp, #0x10]
	add	r0, r0, #0x14
	add	r0, r0, r1
	ldr	r0, [r0]
	mov	r9, r0
	cmp	r0, #0
	bne	.L805E1B6	@cond_branch
.L805E1B2:
	mov	r0, #0x0
	b	.L805E310
.L805E1B6:
	mov	r1, r9
	add	r1, r1, #0x20
	str	r1, [sp, #0x18]
	ldr	r2, [sp, #0x54]
	cmp	r2, sl
	ble	.L805E1C8	@cond_branch
	mov	r0, sl
	str	r0, [sp, #0x1c]
	b	.L805E1CE
.L805E1C8:
	ldr	r1, [sp, #0x54]
	str	r1, [sp, #0x1c]
	mov	r2, sl
.L805E1CE:
	str	r2, [sp, #0x20]
	ldr	r0, [sp, #0x58]
	ldr	r1, [sp, #0x50]
	cmp	r0, r1
	ble	.L805E1DC	@cond_branch
	str	r1, [sp, #0x24]
	b	.L805E1E2
.L805E1DC:
	ldr	r2, [sp, #0x58]
	str	r2, [sp, #0x24]
	ldr	r0, [sp, #0x50]
.L805E1E2:
	str	r0, [sp, #0x28]
	ldr	r1, [sp, #0x18]
	ldr	r0, [r1]
	lsl	r0, r0, #0x4
	ldr	r2, [sp, #0x10]
	ldr	r1, [r2, #0x4]
	add	r7, r1, r0
	mov	r5, #0x0
	ldr	r0, [r7]
	ldr	r1, [sp, #0x1c]
	cmp	r0, r1
	bge	.L805E1FE	@cond_branch
	mov	r5, #0x1
	b	.L805E206
.L805E1FE:
	ldr	r2, [sp, #0x20]
	cmp	r0, r2
	ble	.L805E206	@cond_branch
	mov	r5, #0x2
.L805E206:
	ldr	r0, [r7, #0x4]
	ldr	r1, [sp, #0x24]
	cmp	r0, r1
	bge	.L805E212	@cond_branch
	mov	r0, #0x4
	b	.L805E21A
.L805E212:
	ldr	r2, [sp, #0x28]
	cmp	r0, r2
	ble	.L805E220	@cond_branch
	mov	r0, #0x8
.L805E21A:
	orr	r5, r5, r0
	lsl	r0, r5, #0x18
	lsr	r5, r0, #0x18
.L805E220:
	mov	r0, #0x1
	mov	r8, r0
	mov	r1, r9
	ldr	r0, [r1]
	cmp	r8, r0
	bge	.L805E30E	@cond_branch
.L805E22C:
	mov	r2, r8
	lsl	r0, r2, #0x2
	ldr	r1, [sp, #0x18]
	add	r0, r0, r1
	ldr	r0, [r0]
	lsl	r0, r0, #0x4
	ldr	r2, [sp, #0x10]
	ldr	r1, [r2, #0x4]
	add	r6, r1, r0
	mov	r4, #0x0
	ldr	r0, [r6]
	ldr	r1, [sp, #0x1c]
	cmp	r0, r1
	bge	.L805E24C	@cond_branch
	mov	r4, #0x1
	b	.L805E254
.L805E24C:
	ldr	r2, [sp, #0x20]
	cmp	r0, r2
	ble	.L805E254	@cond_branch
	mov	r4, #0x2
.L805E254:
	ldr	r0, [r6, #0x4]
	ldr	r1, [sp, #0x24]
	cmp	r0, r1
	bge	.L805E262	@cond_branch
	mov	r0, #0x4
	orr	r4, r4, r0
	b	.L805E270
.L805E262:
	ldr	r2, [sp, #0x28]
	cmp	r0, r2
	ble	.L805E270	@cond_branch
	mov	r0, #0x8
	orr	r4, r4, r0
	lsl	r0, r4, #0x18
	lsr	r4, r0, #0x18
.L805E270:
	mov	r3, #0x0
	mov	r1, #0x3
	add	r2, r5, #0
	and	r2, r2, r1
	add	r0, r4, #0
	and	r0, r0, r1
	cmp	r2, r0
	bne	.L805E284	@cond_branch
	cmp	r2, #0
	bne	.L805E286	@cond_branch
.L805E284:
	mov	r3, #0x1
.L805E286:
	mov	r1, #0xc
	add	r2, r1, #0
	and	r2, r2, r5
	add	r0, r4, #0
	and	r0, r0, r1
	cmp	r2, r0
	bne	.L805E298	@cond_branch
	cmp	r2, #0
	bne	.L805E29C	@cond_branch
.L805E298:
	mov	r0, #0x2
	orr	r3, r3, r0
.L805E29C:
	cmp	r3, #0x3
	bne	.L805E2FE	@cond_branch
	ldr	r0, [r7]
	str	r0, [sp]
	ldr	r0, [r7, #0x4]
	str	r0, [sp, #0x4]
	ldr	r0, [r6]
	str	r0, [sp, #0x8]
	ldr	r0, [r6, #0x4]
	str	r0, [sp, #0xc]
	mov	r0, sl
	ldr	r1, [sp, #0x50]
	ldr	r2, [sp, #0x54]
	ldr	r3, [sp, #0x58]
	bl	sub_805E474
	lsl	r0, r0, #0x18
	lsr	r5, r0, #0x18
	cmp	r5, #0
	beq	.L805E2C8	@cond_branch
	mov	r0, #0x1
	str	r0, [sp, #0x2c]
.L805E2C8:
	ldr	r1, [sp, #0x2c]
	cmp	r1, #0x1
	bne	.L805E2FE	@cond_branch
	mov	r4, r8
	sub	r4, r4, #0x1
	mov	r2, sl
	str	r2, [sp]
	ldr	r0, [sp, #0x50]
	str	r0, [sp, #0x4]
	ldr	r1, [sp, #0x54]
	str	r1, [sp, #0x8]
	ldr	r2, [sp, #0x58]
	str	r2, [sp, #0xc]
	ldr	r0, [sp, #0x10]
	mov	r1, r9
	ldr	r2, [sp, #0x14]
	add	r3, r4, #0
	bl	sub_805E0D8
	lsl	r0, r0, #0x18
	cmp	r0, #0
	bne	.L805E2F6	@cond_branch
	b	.L805E1B2
.L805E2F6:
	ldr	r0, [sp, #0x14]
	str	r4, [r0, #0x10]
	strb	r5, [r0, #0x14]
	b	.L805E30E
.L805E2FE:
	add	r7, r6, #0
	add	r5, r4, #0
	mov	r1, #0x1
	add r8, r1
	mov	r2, r9
	ldr	r0, [r2]
	cmp	r8, r0
	blt	.L805E22C	@cond_branch
.L805E30E:
	ldr	r0, [sp, #0x2c]
.L805E310:
	add	sp, sp, #0x30
	pop	{r3, r4, r5}
	mov	r8, r3
	mov	r9, r4
	mov	sl, r5
	pop	{r4, r5, r6, r7}
	pop	{r1}
	bx	r1
	thumb_func_end sub_805E18C

.align 2, 0 @ Don't pad with nop.
