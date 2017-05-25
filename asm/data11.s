    .include "asm/common.inc"

	.section .rodata

    .incbin "baserom.gba", 0x685e0, 0x8074da8 - 0x80685e0
