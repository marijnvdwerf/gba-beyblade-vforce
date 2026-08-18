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
	bne	.L80412BC	@cond_branch
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
	b	.L80412E4
.L80412BC:
	ldr	r0, .L80412EC
	ldr	r0, [r0]
	ldr	r1, .L80412EC + 4
	add	r0, r0, r1
	ldrb	r0, [r0]
	cmp	r0, #0x2
	bne	.L80412F8	@cond_branch
	ldr	r0, [r6, #0x8]
	lsl	r4, r4, #0x2
	add	r1, r5, #0
	add	r1, r1, #0x94
	add	r1, r1, r4
	ldr	r1, [r1]
	mov	r2, #0xe
	bl	sub_8061660
	ldr	r0, [r6, #0x4]
	ldr	r1, .L80412EC + 8
	add	r4, r4, r1
	ldr	r1, [r4]
.L80412E4:
	mov	r2, #0xe
	bl	sub_8061660
	b	.L8041318
.L80412EC:
	.align	2, 0

	.4byte	0x3000f48
	.4byte	0x6a4
	.4byte	0x806ea70
.L80412F8:
	ldr	r0, [r6, #0x8]
	lsl	r4, r4, #0x2
	add	r1, r5, #0
	add	r1, r1, #0xa8
	add	r1, r1, r4
	ldr	r1, [r1]
	mov	r2, #0xe
	bl	sub_8061660
	ldr	r0, [r6, #0x4]
	ldr	r1, .L8041320
	add	r4, r4, r1
	ldr	r1, [r4]
	mov	r2, #0xe
	bl	sub_8061660
.L8041318:
	pop	{r4, r5, r6}
	pop	{r0}
	bx	r0
.L804131E:
	.align	2, 0
.L8041320:
	.4byte	0x806ea5c
	thumb_func_end sub_8041288

.align 2, 0 @ Don't pad with nop.
