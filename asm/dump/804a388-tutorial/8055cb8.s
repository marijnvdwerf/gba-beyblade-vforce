	.include "asm/common.inc"

	thumb_func_start sub_8055CB8
sub_8055CB8:
	push	{r4, lr}
	add	sp, sp, #0xfffffffc
	ldr	r0, .L8055CE4
	mov	r4, #0x0
	str	r4, [r0]
	ldr	r0, .L8055CE4 + 4
	ldr	r1, .L8055CE4 + 8
	ldr	r2, .L8055CE4 + 12
	ldr	r3, .L8055CE4 + 16
	bl	sub_805E50C
	ldr	r0, .L8055CE4 + 20
	str	r4, [sp]
	mov	r1, #0x0
	mov	r2, #0x0
	mov	r3, #0x0
	bl	sub_805E514
	add	sp, sp, #0x4
	pop	{r4}
	pop	{r0}
	bx	r0
.L8055CE4:
	.align	2, 0

	.4byte	0x3000c18
	.4byte	0x3000fc0
	.4byte	def_94_0_8055CFC + 1
	.4byte	def_94_4_AddWithBoundingAreaMessage + 1
	.4byte	def_94_8_collision_8055F2C + 1
	.4byte	0x3000fd0
	thumb_func_end sub_8055CB8

.align 2, 0 @ Don't pad with nop.
