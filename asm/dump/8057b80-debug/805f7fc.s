	.include "asm/common.inc"

	thumb_func_start sub_805F7FC
sub_805F7FC:
	push	{r4, r5, lr}
	mov	ip, r0
	lsl	r1, r1, #0x10
	lsr	r1, r1, #0x10
	lsl	r0, r1, #0x3
	mov	r4, ip
	ldr	r3, [r4, #0x24]
	add	r3, r3, r0
	ldrh	r0, [r3]
	mov	r4, #0x0
	mov	r5, ip
	strh	r0, [r5, #0x2a]
	strh	r1, [r5, #0x28]
	mov	r0, ip
	add	r0, r0, #0x40
	strh	r4, [r0]
	mov	r0, #0x6
	ldsb	r0, [r3, r0]
	strh	r0, [r5, #0x3c]
	mov	r0, #0x6
	ldsb	r0, [r3, r0]
	strh	r0, [r5, #0x3e]
	ldrh	r0, [r3, #0x4]
	strh	r0, [r5, #0x3a]
	ldrh	r0, [r5, #0x2a]
	strh	r0, [r5, #0x2e]
	add	r0, r0, #0x1
	strh	r0, [r5, #0x2c]
	strh	r4, [r5, #0x32]
	mov	r0, ip
	add	r0, r0, #0x42
	strh	r2, [r0]
	add	r0, r0, #0x2
	strh	r4, [r0]
	pop	{r4, r5}
	pop	{r0}
	bx	r0
	thumb_func_end sub_805F7FC

.align 2, 0 @ Don't pad with nop.
