	.include "asm/common.inc"

	thumb_func_start getBeyBladeActorDataForIndex
getBeyBladeActorDataForIndex:
	push	{r4, r5, r6, r7, lr}
	mov	r7, r8
	push	{r7}
	add	r4, r0, #0
	ldr	r0, .L8057294
	ldr	r7, [r0]
	ldr	r0, .L8057294 + 4
	add	r0, r0, r7
	mov	r8, r0
	lsl	r0, r4, #0x3
	mov	r1, r8
	add	r6, r1, r0
	add	r0, r4, #0
	bl	getBeybladeData0
	add	r2, r0, #0
	ldr	r1, .L8057294 + 8
	lsl	r0, r4, #0x2
	add	r0, r0, r1
	ldr	r5, [r0]
	cmp	r4, #0x3b
	ble	.L80572A4	@cond_branch
	ldr	r0, .L8057294 + 12
	add	r1, r4, #0
	mov	r2, #0x3c
	bl	printf
	mov	r0, #0x0
	b	.L805732C
.L8057292:
	.align	2, 0
.L8057294:
	.4byte	0x3000fb0
	.4byte	0x1110
	.4byte	0x807aa48
	.4byte	0x872ae20
.L80572A4:
	add	r0, r2, #0
	add	r0, r0, #0x31
	ldrb	r0, [r0]
	cmp	r0, #0
	beq	.L8057328	@cond_branch
	ldr	r0, [r6]
	cmp	r0, #0
	beq	.L80572B8	@cond_branch
	ldr	r4, [r0]
	b	.L805732A
.L80572B8:
	ldr	r0, [r5]
	lsr	r0, r0, #0x8
	bl	slowAllocate
	str	r0, [r6]
	cmp	r0, #0
	bne	.L80572CC	@cond_branch
	ldr	r0, .L8057314
	bl	printf
.L80572CC:
	ldr	r0, [r6]
	ldr	r4, [r0]
	add	r0, r5, #0
	add	r1, r4, #0
	bl	Lz77UnCompWram
	mov	r2, #0x0
	ldr	r1, .L8057314 + 4
	add	r0, r7, r1
	ldrh	r1, [r0]
	mov	r0, #0x1
	and	r0, r0, r1
	cmp	r0, #0
	beq	.L80572FA	@cond_branch
	mov	r3, #0x1
.L80572EA:
	add	r2, r2, #0x1
	add	r0, r1, #0
	ASR	r0, r2
	and	r0, r0, r3
	cmp	r0, #0
	beq	.L80572FA	@cond_branch
	cmp	r2, #0xf
	ble	.L80572EA	@cond_branch
.L80572FA:
	cmp	r2, #0xf
	bgt	.L805731C	@cond_branch
	strb	r2, [r6, #0x4]
	mov	r1, #0xf0
	lsl	r1, r1, #0x1
	ADD r1, r8
	mov	r0, #0x1
	LSL	r0, r2
	ldrh	r2, [r1]
	orr	r0, r0, r2
	strh	r0, [r1]
	b	.L805732A
.L8057312:
	.align	2, 0
.L8057314:
	.4byte	0x872ae64
	.4byte	0x12f0
.L805731C:
	ldr	r0, .L8057324
	bl	printf
	b	.L805732A
.L8057324:
	.align	2, 0

	.4byte	0x872aec0
.L8057328:
	add	r4, r5, #0
.L805732A:
	add	r0, r4, #0
.L805732C:
	pop	{r3}
	mov	r8, r3
	pop	{r4, r5, r6, r7}
	pop	{r1}
	bx	r1
	thumb_func_end getBeyBladeActorDataForIndex

.align 2, 0 @ Don't pad with nop.
