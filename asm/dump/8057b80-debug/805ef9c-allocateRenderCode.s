	.include "asm/common.inc"

	thumb_func_start allocateRenderCode
allocateRenderCode:
	push	{r4, r5, r6, lr}
	add	r4, r0, #0
	ldr	r5, .L4
	cmp	r1, #0
	bne	.L1	@cond_branch
	ldr	r0, .L4 + 4
	ldr	r6, .L4 + 8
	sub	r0, r0, r6
	bl	fastAllocate
	add	r1, r0, #0
	str	r1, [r4]
	cmp	r1, #0
	bne	.L2	@cond_branch
	ldr	r0, .L4 + 12
	bl	nullsub_8
	mov	r0, #0x0
	b	.L3
.L5:
	.align	2, 0
.L4:
	.4byte	0x8064eb8
	.4byte	0x8064eb8
	.4byte	0x8064194
	.4byte	0x8755644
.L2:
	ldr	r2, .L7
	str	r6, [r2]
	ldr	r0, [r1]
	str	r0, [r2, #0x4]
	ldr	r0, [r1, #0x4]
	lsr	r0, r0, #0x2
	mov	r1, #0x84
	lsl	r1, r1, #0x18
	orr	r0, r0, r1
	str	r0, [r2, #0x8]
	ldr	r0, [r2, #0x8]
	b	.L6
.L8:
	.align	2, 0
.L7:
	.4byte	0x40000d4
.L1:
	ldr	r0, [r1]
	str	r0, [r4]
.L6:
	ldr	r0, [r4]
	ldr	r1, [r0]
	ldr	r0, [r5]
	add	r0, r1, r0
	str	r0, [r4, #0x4]
	ldr	r0, [r5, #0x4]
	add	r0, r1, r0
	str	r0, [r4, #0x8]
	ldr	r0, [r5, #0x8]
	add	r0, r1, r0
	str	r0, [r4, #0xc]
	ldr	r0, [r5, #0xc]
	add	r0, r1, r0
	str	r0, [r4, #0x10]
	ldr	r0, [r5, #0x10]
	add	r0, r1, r0
	str	r0, [r4, #0x14]
	ldr	r0, [r5, #0x14]
	add	r0, r1, r0
	str	r0, [r4, #0x18]
	ldr	r0, [r5, #0x18]
	add	r0, r1, r0
	str	r0, [r4, #0x1c]
	ldr	r0, [r5, #0x1c]
	add	r0, r1, r0
	str	r0, [r4, #0x20]
	ldr	r0, [r5, #0x20]
	add	r0, r1, r0
	str	r0, [r4, #0x24]
	ldr	r0, [r5, #0x24]
	add	r0, r1, r0
	str	r0, [r4, #0x28]
	ldr	r0, [r5, #0x28]
	add	r0, r1, r0
	str	r0, [r4, #0x2c]
	ldr	r0, [r5, #0x2c]
	add	r0, r1, r0
	str	r0, [r4, #0x30]
	ldr	r0, [r5, #0x30]
	add	r0, r1, r0
	str	r0, [r4, #0x34]
	ldr	r0, [r5, #0x34]
	add	r0, r1, r0
	str	r0, [r4, #0x38]
	ldr	r0, [r5, #0x38]
	add	r0, r1, r0
	str	r0, [r4, #0x3c]
	ldr	r0, [r5, #0x40]
	add	r0, r1, r0
	str	r0, [r4, #0x44]
	ldr	r0, [r5, #0x44]
	add	r0, r1, r0
	str	r0, [r4, #0x48]
	ldr	r0, [r5, #0x48]
	add	r0, r1, r0
	str	r0, [r4, #0x4c]
	ldr	r0, [r5, #0x54]
	add	r0, r1, r0
	str	r0, [r4, #0x58]
	ldr	r0, [r5, #0x58]
	add	r0, r1, r0
	str	r0, [r4, #0x5c]
	ldr	r0, [r5, #0x5c]
	add	r0, r1, r0
	str	r0, [r4, #0x60]
	ldr	r0, [r5, #0x60]
	add	r0, r1, r0
	str	r0, [r4, #0x64]
	ldr	r0, [r5, #0x64]
	add	r0, r1, r0
	str	r0, [r4, #0x68]
	ldr	r0, [r5, #0x68]
	add	r0, r1, r0
	str	r0, [r4, #0x6c]
	ldr	r0, [r5, #0x6c]
	add	r0, r1, r0
	str	r0, [r4, #0x70]
	ldr	r0, [r5, #0x70]
	add	r0, r1, r0
	str	r0, [r4, #0x74]
	ldr	r0, [r5, #0x74]
	add	r0, r1, r0
	str	r0, [r4, #0x78]
	ldr	r0, [r5, #0x78]
	add	r0, r1, r0
	str	r0, [r4, #0x7c]
	add	r2, r4, #0
	add	r2, r2, #0x80
	ldr	r0, [r5, #0x7c]
	add	r1, r1, r0
	str	r1, [r2]
	add	r0, r4, #0
.L3:
	pop	{r4, r5, r6}
	pop	{r1}
	bx	r1
	thumb_func_end allocateRenderCode

.align 2, 0 @ Don't pad with nop.
