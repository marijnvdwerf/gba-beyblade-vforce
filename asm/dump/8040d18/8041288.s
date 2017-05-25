	.include "asm/common.inc"

	thumb_func_start sub_8041288
sub_8041288:
	push	{r4, r5, r6, lr}
	add	r6, r0, #0
	add	r5, r1, #0
	bl	getLanguage
	add	r4, r0, #0
	mov	r0, #0x4
	bl	sub_8051780
	cmp	r0, #0
	bne	.L1	@cond_branch
	ldr	r0, [r6, #0x8]
	lsl	r4, r4, #0x2
	add	r1, r5, #0
	add	r1, r1, #0x68
	add	r1, r1, r4
	ldr	r1, [r1]
	mov	r2, #0xe
	bl	sub_8061660
	ldr	r0, [r6, #0x4]
	add	r1, r5, #0
	add	r1, r1, #0x40
	add	r1, r1, r4
	ldr	r1, [r1]
	b	.L2
.L1:
	ldr	r0, .L5
	ldr	r0, [r0]
	ldr	r1, .L5 + 4
	add	r0, r0, r1
	ldrb	r0, [r0]
	cmp	r0, #0x2
	bne	.L3	@cond_branch
	ldr	r0, [r6, #0x8]
	lsl	r4, r4, #0x2
	add	r1, r5, #0
	add	r1, r1, #0x94
	add	r1, r1, r4
	ldr	r1, [r1]
	mov	r2, #0xe
	bl	sub_8061660
	ldr	r0, [r6, #0x4]
	ldr	r1, .L5 + 8
	add	r4, r4, r1
	ldr	r1, [r4]
.L2:
	mov	r2, #0xe
	bl	sub_8061660
	b	.L4
.L6:
	.align	2, 0
.L5:
	.4byte	0x3000f48
	.4byte	0x6a4
	.4byte	0x806ea70
.L3:
	ldr	r0, [r6, #0x8]
	lsl	r4, r4, #0x2
	add	r1, r5, #0
	add	r1, r1, #0xa8
	add	r1, r1, r4
	ldr	r1, [r1]
	mov	r2, #0xe
	bl	sub_8061660
	ldr	r0, [r6, #0x4]
	ldr	r1, .L7
	add	r4, r4, r1
	ldr	r1, [r4]
	mov	r2, #0xe
	bl	sub_8061660
.L4:
	pop	{r4, r5, r6}
	pop	{r0}
	bx	r0
.L8:
	.align	2, 0
.L7:
	.4byte	0x806ea5c
	thumb_func_end sub_8041288

.align 2, 0 @ Don't pad with nop.
