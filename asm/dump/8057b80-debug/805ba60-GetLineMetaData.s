	.include "asm/common.inc"

	thumb_func_start GetLineMetaData
GetLineMetaData:
	add	r2, r1, #0
	mov	r1, #0x8a
	lsl	r1, r1, #0x1
	add	r0, r0, r1
	ldr	r1, [r0]
	cmp	r1, #0
	beq	.L805BA76	@cond_branch
	lsl	r0, r2, #0x2
	add	r0, r0, r1
	ldr	r0, [r0]
	b	.L805BA78
.L805BA76:
	mov	r0, #0x0
.L805BA78:
	bx	lr
	thumb_func_end GetLineMetaData

.align 2, 0 @ Don't pad with nop.
