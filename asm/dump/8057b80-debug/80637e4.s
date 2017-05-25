	.include "asm/common.inc"

	thumb_func_start sub_80637E4
sub_80637E4:
	push	{r4, r5, r6, lr}
	add	r4, r0, #0
	add	r5, r1, #0
	ldr	r1, [sp, #0x10]
	ldr	r6, .L1
	add	r0, r6, #0
	and	r2, r2, r0
	strh	r2, [r4, #0x4]
	add	r3, r3, #0x1
	and	r3, r3, r0
	strh	r3, [r4, #0x6]
	str	r5, [r4]
	strh	r1, [r4, #0x8]
	add	r1, r3, #0
	lsl	r0, r1, #0x1
	bl	slowAllocate
	str	r0, [r4, #0x10]
	ldr	r1, [r0]
	str	r1, [r4, #0xc]
	ldr	r3, .L1 + 4
	ldrh	r2, [r4, #0x4]
	lsl	r0, r2, #0x1
	add	r5, r5, r0
	ldrh	r4, [r4, #0x6]
	lsl	r2, r4, #0x1
	ldr	r3, [r3]
	add	r0, r5, #0
	bl	call_via_r3
	pop	{r4, r5, r6}
	pop	{r0}
	bx	r0
.L2:
	.align	2, 0
.L1:
	.4byte	0xfffe
	.4byte	0x807d974
	thumb_func_end sub_80637E4

.align 2, 0 @ Don't pad with nop.
