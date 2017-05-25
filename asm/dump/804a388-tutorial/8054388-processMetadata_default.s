	.include "asm/common.inc"

	thumb_func_start processMetadata_default
processMetadata_default:
	push	{r4, lr}
	add	r4, r2, #0
	add	r0, r4, #0
	bl	GetStruct4
	ldr	r0, .L1
	add	r1, r4, #0
	bl	printf
	pop	{r4}
	pop	{r0}
	bx	r0
.L2:
	.align	2, 0
.L1:
	.4byte	0x87296d8
	thumb_func_end processMetadata_default

.align 2, 0 @ Don't pad with nop.
