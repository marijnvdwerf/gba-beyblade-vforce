	.include "asm/common.inc"

	thumb_func_start initBatteryBackup
initBatteryBackup:
	lsl	r0, r0, #0x10
	lsr	r0, r0, #0x10
	mov	r2, #0x0
	cmp	r0, #0x4
	bne	.L8065820	@cond_branch
	ldr	r1, .L8065818
	ldr	r0, .L8065818 + 4
	str	r0, [r1]
	b	.L806583C
.L8065816:
	.align	2, 0
.L8065818:
	.4byte	0x3005e9c
	.4byte	0x875687c
.L8065820:
	cmp	r0, #0x40
	bne	.L8065834	@cond_branch
	ldr	r1, .L806582C
	ldr	r0, .L806582C + 4
	str	r0, [r1]
	b	.L806583C
.L806582C:
	.align	2, 0

	.4byte	0x3005e9c
	.4byte	0x8756888
.L8065834:
	ldr	r1, .L8065840
	ldr	r0, .L8065840 + 4
	str	r0, [r1]
	mov	r2, #0x1
.L806583C:
	add	r0, r2, #0
	bx	lr
.L8065840:
	.align	2, 0

	.4byte	0x3005e9c
	.4byte	0x875687c
	thumb_func_end initBatteryBackup

.align 2, 0 @ Don't pad with nop.
