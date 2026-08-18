	.include "asm/common.inc"

	thumb_func_start onTimer2Overflow
onTimer2Overflow:
	ldr	r1, .L8065864
	ldrh	r0, [r1]
	cmp	r0, #0
	beq	.L8065862	@cond_branch
	ldrh	r0, [r1]
	sub	r0, r0, #0x1
	strh	r0, [r1]
	lsl	r0, r0, #0x10
	cmp	r0, #0
	bne	.L8065862	@cond_branch
	ldr	r1, .L8065864 + 4
	mov	r0, #0x1
	strb	r0, [r1]
.L8065862:
	bx	lr
.L8065864:
	.align	2, 0

	.4byte	0x3000daa
	.4byte	0x3000dac
	thumb_func_end onTimer2Overflow

.align 2, 0 @ Don't pad with nop.
