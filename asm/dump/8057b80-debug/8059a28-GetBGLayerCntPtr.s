	.include "asm/common.inc"

	thumb_func_start GetBGLayerCntPtr
GetBGLayerCntPtr:
	lsl	r0, r0, #0x18
	lsr	r0, r0, #0x18
	add	r1, r0, #0
	cmp	r0, #0x1
	beq	.L1	@cond_branch
	cmp	r0, #0x1
	bgt	.L2	@cond_branch
	cmp	r0, #0
	beq	.L3	@cond_branch
	b	.L14
.L2:
	cmp	r1, #0x2
	beq	.L5	@cond_branch
	cmp	r1, #0x3
	beq	.L6	@cond_branch
	b	.L14
.L3:
	ldr	r0, .L9
	b	.L14
.L10:
	.align	2, 0
.L9:
	.4byte	0x4000008
.L1:
	ldr	r0, .L12
	b	.L14
.L13:
	.align	2, 0
.L12:
	.4byte	0x400000a
.L5:
	ldr	r0, .L15
	b	.L14
.L16:
	.align	2, 0
.L15:
	.4byte	0x400000c
.L6:
	ldr	r0, .L17
.L14:
	bx	lr
.L18:
	.align	2, 0
.L17:
	.4byte	0x400000e
	thumb_func_end GetBGLayerCntPtr

.align 2, 0 @ Don't pad with nop.
