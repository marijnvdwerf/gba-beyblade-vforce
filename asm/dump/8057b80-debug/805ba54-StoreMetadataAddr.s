	.include "asm/common.inc"

	thumb_func_start StoreMetadataAddr
StoreMetadataAddr:
	mov	r2, #0x8a
	lsl	r2, r2, #0x1
	add	r0, r0, r2
	str	r1, [r0]
	bx	lr
	thumb_func_end StoreMetadataAddr

.align 2, 0 @ Don't pad with nop.
