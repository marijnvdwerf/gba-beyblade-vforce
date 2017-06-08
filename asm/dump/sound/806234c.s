	.include "asm/common.inc"

	thumb_func_start sub_806234C
sub_806234C:
	push	{r4, r5, lr}
	ldr	r5, _3
	ldr	r1, [r5]
	cmp	r1, #0
	beq	_1	@cond_branch
	ldr	r0, _3 + 4
	mov	r4, #0x0
	str	r4, [r0]
	add	r0, r0, #0xc
	str	r4, [r0]
	add	r0, r0, #0x34
	str	r4, [r0]
	sub	r0, r0, #0x4
	str	r4, [r0]
	add	r0, r1, #0
	bl	deallocateBlock
	ldr	r0, _3 + 8
	ldr	r0, [r0]
	cmp	r0, #0
	beq	_2	@cond_branch
	bl	deallocateBlock
_2:
	ldr	r0, _3 + 12
	str	r4, [r0]
	str	r4, [r5]
	ldr	r0, _3 + 16
	str	r4, [r0]
	ldr	r0, _3 + 20
	str	r4, [r0]
_1:
	pop	{r4, r5}
	pop	{r0}
	bx	r0
_4:
	.align	2, 0
_3:
	.word	_soundMixerBlock
	.word	0x40000c4
	.word	_soundTableBlock
	.word	_unk3005E28
	.word	_soundMixer
	.word	_soundMixerPlus
	thumb_func_end sub_806234C

.align 2, 0 @ Don't pad with nop.
