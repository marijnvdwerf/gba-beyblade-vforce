	.include "asm/common.inc"

	thumb_func_start sub_80665D4
sub_80665D4:
	push	{r4, lr}
	add	sp, sp, #0xffffffc8
	str	r0, [sp, #0x30]
	str	r1, [sp, #0x34]
	add	r0, sp, #0x30
	mov	r1, sp
	bl	sub_80663B0
	add	r0, sp, #0x34
	add	r4, sp, #0x10
	add	r1, r4, #0
	bl	sub_80663B0
	ldr	r0, [r4, #0x4]
	mov	r1, #0x1
	EOR	r0, r1
	str	r0, [r4, #0x4]
	add	r2, sp, #0x20
	mov	r0, sp
	add	r1, r4, #0
	bl	sub_806642C
	bl	sub_80662F8
	add	sp, sp, #0x38
	pop	{r4, pc}
	thumb_func_end sub_80665D4

.align 2, 0 @ Don't pad with nop.
