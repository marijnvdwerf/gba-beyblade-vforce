	.include "asm/common.inc"

	thumb_func_start sub_8057104
sub_8057104:
	add	r3, r0, #0
	lsl	r1, r1, #0x18
	cmp	r1, #0
	beq	.L8057130	@cond_branch
	ldr	r0, .L8057128
	ldr	r2, [r0]
	asr	r0, r3, #0x5
	lsl	r0, r0, #0x2
	ldr	r1, .L8057128 + 4
	add	r2, r2, r1
	add	r2, r2, r0
	mov	r0, #0x1f
	and	r0, r0, r3
	mov	r1, #0x1
	lsl	r1, r0
	ldr	r0, [r2]
	orr	r0, r0, r1
	b	.L805714A
.L8057128:
	.align	2, 0

	.4byte	_currentGameState
	.4byte	0x594
.L8057130:
	ldr	r0, .L8057150
	ldr	r2, [r0]
	asr	r0, r3, #0x5
	lsl	r0, r0, #0x2
	ldr	r1, .L8057150 + 4
	add	r2, r2, r1
	add	r2, r2, r0
	mov	r0, #0x1f
	and	r0, r0, r3
	mov	r1, #0x1
	lsl	r1, r0
	ldr	r0, [r2]
	bic	r0, r1
.L805714A:
	str	r0, [r2]
	bx	lr
.L805714E:
	.align	2, 0
.L8057150:
	.4byte	_currentGameState
	.4byte	0x594
	thumb_func_end sub_8057104

.align 2, 0 @ Don't pad with nop.
