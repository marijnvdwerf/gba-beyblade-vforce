	.include "asm/common.inc"

	thumb_func_start initBattery
initBattery:
	push	{lr}
	mov	r0, #0x40
	bl	initBatteryBackup
	lsl	r0, r0, #0x10
	cmp	r0, #0
	beq	.L1	@cond_branch
	ldr	r0, .L2
	bl	printf
.L1:
	ldr	r1, .L2 + 4
	mov	r0, #0x2
	bl	sub_806586C
	pop	{r0}
	bx	r0
.L3:
	.align	2, 0
.L2:
	.4byte	0x872c8e4
	.4byte	0x3000e04
	thumb_func_end initBattery

.align 2, 0 @ Don't pad with nop.
