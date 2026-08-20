	.include "asm/common.inc"

	thumb_func_start profile
profile:
	push	{r4, r5, r6, r7, lr}
	mov	r7, r8
	push	{r7}
	add	sp, sp, #0xfffffff8
	mov	r8, r0
	mov	r5, #0x0
	ldr	r0, .L8043268
	ldr	r1, [r0]
	lsl	r1, r1, #0x10
	lsr	r1, r1, #0x10
	str	r5, [r0]
	ldr	r0, .L8043268 + 4
	ldrb	r0, [r0]
	cmp	r0, #0x1
	beq	.L8043270	@cond_branch
	cmp	r0, #0x1
	ble	.L8043294	@cond_branch
	cmp	r0, #0x2
	beq	.L804327C	@cond_branch
	cmp	r0, #0x3
	beq	.L8043288	@cond_branch
	b	.L8043294
.L8043268:
	.align	2, 0

	.4byte	0x4000108
	.4byte	_unk3000150
.L8043270:
	ldr	r4, .L8043278
	mov	r5, #0xfa
	lsl	r5, r5, #0x2
	b	.L8043298
.L8043278:
	.align	2, 0

	.4byte	0x40741893
.L804327C:
	ldr	r4, .L8043284
	mov	r5, #0xfa
	lsl	r5, r5, #0x2
	b	.L8043298
.L8043284:
	.align	2, 0

	.4byte	0x41741893
.L8043288:
	ldr	r4, .L8043290
	mov	r5, #0xfa
	lsl	r5, r5, #0x2
	b	.L8043298
.L8043290:
	.align	2, 0

	.4byte	0x4274199a
.L8043294:
	ldr	r4, .L80432B4
	ldr	r5, .L80432B4 + 4
.L8043298:
	add	r0, r1, #0
	bl	__floatsisf
	add	r1, r4, #0
	bl	__mulsf3
	add	r4, r0, #0
	cmp	r5, #0
	blt	.L80432BC	@cond_branch
	add	r0, r5, #0
	bl	__floatsisf
	b	.L80432C8
.L80432B2:
	.align	2, 0
.L80432B4:
	.4byte	0x426e6148
	.4byte	0xf4240
.L80432BC:
	lsr	r0, r5, #0x1
	bl	__floatsisf
	add	r1, r0, #0
	bl	__addsf3
.L80432C8:
	add	r1, r0, #0
	add	r0, r4, #0
	bl	__divsf3
	add	r4, r0, #0
	bl	__fixunssfsi
	lsl	r0, r0, #0x10
	lsr	r7, r0, #0x10
	add	r0, r7, #0
	bl	__floatsisf
	add	r1, r0, #0
	add	r0, r4, #0
	bl	__subsf3
	add	r4, r0, #0
	cmp	r5, #0
	blt	.L80432F6	@cond_branch
	add	r0, r5, #0
	bl	__floatsisf
	b	.L8043302
.L80432F6:
	lsr	r0, r5, #0x1
	bl	__floatsisf
	add	r1, r0, #0
	bl	__addsf3
.L8043302:
	add	r1, r0, #0
	add	r0, r4, #0
	bl	__mulsf3
	bl	__fixunssfsi
	add	r5, r0, #0
	lsl	r5, r5, #0x10
	lsr	r5, r5, #0x10
	add	r0, r5, #0
	mov	r1, #0x64
	bl	__udivsi3
	add	r6, r0, #0
	lsl	r6, r6, #0x10
	lsr	r6, r6, #0x10
	add	r0, r5, #0
	mov	r1, #0xa
	bl	__udivsi3
	lsl	r0, r0, #0x10
	lsr	r0, r0, #0x10
	mov	r1, #0xa
	bl	__umodsi3
	add	r4, r0, #0
	lsl	r4, r4, #0x10
	lsr	r4, r4, #0x10
	add	r0, r5, #0
	mov	r1, #0xa
	bl	__umodsi3
	lsl	r0, r0, #0x10
	lsr	r0, r0, #0x10
	ldr	r1, .L804336C
	add	r6, r6, #0x30
	add	r4, r4, #0x30
	str	r4, [sp]
	add	r0, r0, #0x30
	str	r0, [sp, #0x4]
	add	r0, r1, #0
	mov	r1, r8
	add	r2, r7, #0
	add	r3, r6, #0
	bl	printf
	add	sp, sp, #0x8
	pop	{r3}
	mov	r8, r3
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L804336A:
	.align	2, 0
.L804336C:
	.4byte	Str_86FD2A4
	thumb_func_end profile

.align 2, 0 @ Don't pad with nop.
