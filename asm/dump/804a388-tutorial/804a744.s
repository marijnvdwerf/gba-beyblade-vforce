	.include "asm/common.inc"

	thumb_func_start sub_804A744
sub_804A744:
	push	{r4, r5, r6, r7, lr}
	mov	r7, r8
	push	{r7}
	add	sp, sp, #0xfffffffc
	add	r5, r0, #0
	add	r4, r3, #0
	lsl	r1, r1, #0x18
	lsr	r6, r1, #0x18
	lsl	r2, r2, #0x18
	lsr	r2, r2, #0x18
	mov	r8, r2
	ldrb	r1, [r4, #0xa]
	lsl	r0, r1, #0x1c
	lsr	r7, r0, #0x10
	mov	r2, #0x80
	lsl	r2, r2, #0x3
	add	r0, r5, #0
	add	r1, r6, #0
	mov	r3, #0x0
	bl	sub_8058C74
	add	r0, r5, #0
	add	r0, r0, #0x88
	ldr	r2, [r4]
	ldr	r3, [r4, #0x4]
	ldrb	r1, [r4, #0xa]
	str	r1, [sp]
	add	r1, r5, #0
	bl	sub_805B244
	add	r0, r5, #0
	add	r0, r0, #0x5c
	ldrb	r0, [r0]
	lsl	r1, r0, #0xb
	mov	r0, #0xc0
	lsl	r0, r0, #0x13
	add	r1, r1, r0
	mov	r2, #0x0
	ldr	r3, .L2
	add	r4, r3, #0
.L1:
	add	r0, r2, #0
	and	r0, r0, r4
	orr	r0, r0, r7
	strh	r0, [r1]
	add	r1, r1, #0x2
	add	r2, r2, #0x1
	cmp	r2, r3
	ble	.L1	@cond_branch
	ldr	r3, .L2 + 4
	add	r0, r5, #0
	add	r0, r0, #0x88
	ldr	r0, [r0]
	add	r0, r0, #0x5d
	ldrb	r0, [r0]
	lsl	r1, r0, #0xe
	mov	r0, #0xc0
	lsl	r0, r0, #0x13
	add	r1, r1, r0
	mov	r2, #0x80
	lsl	r2, r2, #0x8
	ldr	r3, [r3]
	mov	r0, #0x0
	bl	_call_via_r3
	add	r0, r6, #0
	mov	r1, r8
	bl	sub_8059CC8
	add	r0, r6, #0
	mov	r1, #0x1
	bl	ToggleLayerVisibility
	add	sp, sp, #0x4
	pop	{r3}
	mov	r8, r3
	pop	{r4, r5, r6, r7}
	pop	{r1}
	bx	r1
.L3:
	.align	2, 0
.L2:
	.4byte	0x3ff
	.4byte	0x807d970
	thumb_func_end sub_804A744

.align 2, 0 @ Don't pad with nop.
