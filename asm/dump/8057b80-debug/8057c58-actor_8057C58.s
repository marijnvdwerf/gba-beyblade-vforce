	.include "asm/common.inc"

	thumb_func_start actor_8057C58
actor_8057C58:
	push	{r4, r5, r6, r7, lr}
	add	sp, sp, #0xfffffffc
	add	r7, r0, #0
	ldr	r4, [sp, #0x18]
	ldr	r5, [sp, #0x1c]
	ldr	r6, [sp, #0x20]
	str	r1, [r7]
	ldr	r0, .L1
	ldr	r0, [r0]
	str	r0, [r7, #0x58]
	str	r2, [r7, #0x3c]
	str	r6, [r7, #0x70]
	lsl	r3, r3, #0x8
	str	r3, [r7, #0x4]
	lsl	r4, r4, #0x8
	str	r4, [r7, #0x8]
	lsl	r5, r5, #0x8
	str	r5, [r7, #0xc]
	mov	r5, #0x0
	mov	r4, #0x0
	strh	r4, [r7, #0x16]
	mov	r0, #0x80
	lsl	r0, r0, #0x1
	strh	r0, [r7, #0x12]
	strh	r0, [r7, #0x14]
	add	r0, r7, #0
	add	r0, r0, #0xa0
	strh	r4, [r0]
	add	r0, r0, #0x2
	strh	r4, [r0]
	add	r0, r0, #0x2
	strb	r5, [r0]
	add	r0, r0, #0x1
	strb	r5, [r0]
	str	r4, [r7, #0x40]
	str	r4, [r7, #0x44]
	str	r4, [r7, #0x48]
	str	r4, [r7, #0x4c]
	str	r4, [r7, #0x50]
	str	r4, [r7, #0x54]
	mov	r0, #0x10
	str	r0, [r7, #0x68]
	strh	r4, [r7, #0x18]
	str	r4, [r7, #0x64]
	strh	r4, [r7, #0x22]
	add	r3, r7, #0
	add	r3, r3, #0x60
	ldr	r0, .L1 + 4
	add	r2, r0, #0
	ldrh	r0, [r3]
	orr	r0, r0, r2
	strh	r0, [r3]
	ldrh	r0, [r7, #0x1a]
	orr	r0, r0, r2
	strh	r0, [r7, #0x1a]
	strh	r4, [r7, #0x1c]
	strh	r4, [r7, #0x1e]
	strh	r4, [r7, #0x20]
	strh	r4, [r7, #0x2c]
	ldrh	r0, [r7, #0x2e]
	orr	r2, r2, r0
	strh	r2, [r7, #0x2e]
	ldrb	r0, [r1, #0x4]
	strb	r0, [r7, #0x10]
	ldrb	r0, [r1, #0x5]
	strb	r0, [r7, #0x11]
	ldrb	r2, [r1, #0x6]
	add	r0, r7, #0
	add	r0, r0, #0x30
	strb	r2, [r0]
	ldr	r0, [r1, #0x8]
	strh	r0, [r7, #0x2a]
	ldrb	r2, [r1, #0x7]
	add	r0, r7, #0
	add	r0, r0, #0x38
	strb	r2, [r0]
	ldr	r0, [r1, #0x14]
	strh	r0, [r7, #0x28]
	add	r0, r7, #0
	add	r0, r0, #0x31
	strb	r5, [r0]
	add	r0, r0, #0x8
	strb	r5, [r0]
	add	r0, r0, #0x2
	strb	r5, [r0]
	ldrb	r0, [r1, #0xc]
	add	r1, r7, #0
	add	r1, r1, #0x3a
	strb	r0, [r1]
	str	r4, [r7, #0x6c]
	mov	r1, #0x1
	NEG	r1, r1
	str	r1, [r7, #0x74]
	str	r4, [r7, #0x78]
	str	r4, [r7, #0x7c]
	add	r0, r7, #0
	add	r0, r0, #0x80
	str	r4, [r0]
	add	r0, r0, #0x4
	str	r1, [r0]
	add	r0, r0, #0x4
	str	r4, [r0]
	add	r0, r0, #0x4
	strb	r5, [r0]
	add	r0, r0, #0x1
	strb	r5, [r0]
	add	r0, r0, #0xb
	strb	r5, [r0]
	sub	r0, r0, #0x8
	str	r4, [r0]
	add	r0, r0, #0x4
	str	r4, [r0]
	add	r0, r0, #0x1c
	str	r4, [r0]
	add	r0, r0, #0x4
	str	r4, [r0]
	ldrb	r0, [r7, #0x10]
	lsr	r1, r0, #0x1
	ldrb	r2, [r7, #0x11]
	add	r0, r7, #0
	mov	r3, #0x0
	bl	rider_8058614
	ldrb	r3, [r7, #0x10]
	ldrb	r0, [r7, #0x11]
	str	r0, [sp]
	add	r0, r7, #0
	mov	r1, #0x0
	mov	r2, #0x0
	bl	actor_80585F8
	add	r0, r7, #0
	add	r0, r0, #0xb8
	str	r4, [r0]
	add	r0, r0, #0x4
	strh	r4, [r0]
	add	r0, r7, #0
	mov	r1, #0x0
	bl	ActorSetFrameSequence
	add	r0, r7, #0
	add	r0, r0, #0xc0
	str	r4, [r0]
	add	sp, sp, #0x4
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L2:
	.align	2, 0
.L1:
	.4byte	0x3000e30
	.4byte	0xffff
	thumb_func_end actor_8057C58

.align 2, 0 @ Don't pad with nop.
