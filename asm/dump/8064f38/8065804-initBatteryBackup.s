	.include "asm/common.inc"

	thumb_func_start initBatteryBackup
initBatteryBackup:
	lsl	r0, r0, #0x10
	lsr	r0, r0, #0x10
	mov	r2, #0x0
	cmp	r0, #0x4
	bne	.L1	@cond_branch
	ldr	r1, .L3
	ldr	r0, .L3 + 4
	str	r0, [r1]
	b	.L6
.L4:
	.align	2, 0
.L3:
	.4byte	0x3005e9c
	.4byte	0x875687c
.L1:
	cmp	r0, #0x40
	bne	.L5	@cond_branch
	ldr	r1, .L7
	ldr	r0, .L7 + 4
	str	r0, [r1]
	b	.L6
.L8:
	.align	2, 0
.L7:
	.4byte	0x3005e9c
	.4byte	0x8756888
.L5:
	ldr	r1, .L9
	ldr	r0, .L9 + 4
	str	r0, [r1]
	mov	r2, #0x1
.L6:
	add	r0, r2, #0
	bx	lr
.L10:
	.align	2, 0
.L9:
	.4byte	0x3005e9c
	.4byte	0x875687c
	thumb_func_end initBatteryBackup

.align 2, 0 @ Don't pad with nop.
