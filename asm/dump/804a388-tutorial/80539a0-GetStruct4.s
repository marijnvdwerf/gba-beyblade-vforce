	.include "asm/common.inc"

	thumb_func_start GetStruct4
GetStruct4:
	add	r2, r0, #0
	ldr	r0, .L80539B8
	ldr	r0, [r0]
	ldr	r1, .L80539B8 + 4
	add	r0, r0, r1
	ldr	r1, [r0]
	cmp	r1, #0
	beq	.L80539C0	@cond_branch
	mov	r0, #0x4c
	mul	r0, r0, r2
	add	r0, r1, r0
	b	.L80539C2
.L80539B8:
	.align	2, 0

	.4byte	_gameData
	.4byte	0xc88
.L80539C0:
	mov	r0, #0x0
.L80539C2:
	bx	lr
	thumb_func_end GetStruct4

.align 2, 0 @ Don't pad with nop.
