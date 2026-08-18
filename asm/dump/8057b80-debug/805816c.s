	.include "asm/common.inc"

	thumb_func_start sub_805816C
sub_805816C:
	push	{r4, r5, lr}
	add	r2, r0, #0
	lsl	r1, r1, #0x10
	lsr	r4, r1, #0x10
	mov	r5, #0x0
	ldr	r1, [r2]
	ldr	r0, [r1, #0x18]
	add	r1, r1, r0
	mov	r3, #0x0
	b	.L80581AC
.L8058180:
	ldrh	r0, [r1]
	cmp	r0, r4
	bne	.L80581A0	@cond_branch
	mov	r0, #0x0
	strh	r5, [r2, #0x1c]
	strh	r0, [r2, #0x1e]
	strh	r4, [r2, #0x1a]
	ldr	r0, .L805819C
	strh	r0, [r2, #0x2e]
	ldrh	r1, [r1, #0x8]
	add	r0, r2, #0
	bl	ActorSetFrameSequence
	b	.L80581B2
.L805819C:
	.align	2, 0

	.4byte	0xffff
.L80581A0:
	ldrh	r0, [r1, #0x2]
	add	r1, r1, r0
	add	r0, r5, r0
	lsl	r0, r0, #0x10
	lsr	r5, r0, #0x10
	add	r3, r3, #0x1
.L80581AC:
	ldrh	r0, [r2, #0x28]
	cmp	r3, r0
	bcc	.L8058180	@cond_branch
.L80581B2:
	pop	{r4, r5}
	pop	{r0}
	bx	r0
	thumb_func_end sub_805816C

.align 2, 0 @ Don't pad with nop.
