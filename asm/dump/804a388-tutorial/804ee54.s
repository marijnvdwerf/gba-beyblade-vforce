	.include "asm/common.inc"

	thumb_func_start sub_804EE54
sub_804EE54:
	push	{r4, r5, r6, r7, lr}
	add	sp, sp, #0xfffffffc
	ldr	r0, .L804EE90
	ldr	r1, [r0]
	mov	r0, #0xf5
	lsl	r0, r0, #0x4
	add	r5, r1, r0
	add	r0, r0, #0xf0
	add	r2, r1, r0
	ldr	r0, [r2]
	cmp	r0, #0
	bne	.L804EE6E	@cond_branch
	b	.L804F03E
.L804EE6E:
	sub	r0, r0, #0x1
	str	r0, [r2]
	cmp	r0, #0
	bne	.L804EE78	@cond_branch
	b	.L804F03E
.L804EE78:
	ldr	r2, .L804EE90 + 4
	add	r0, r1, r2
	ldrh	r0, [r0]
	sub	r0, r0, #0x1
	cmp	r0, #0x5
	bls	.L804EE86	@cond_branch
	b	.L804F012
.L804EE86:
	lsl	r0, r0, #0x2
	ldr	r1, .L804EE90 + 8
	add	r0, r0, r1
	ldr	r0, [r0]
	mov	pc, r0
.L804EE90:
	.align	2, 0

	.4byte	_gameData
	.4byte	0x105a
	.4byte	.L804EE9C
.L804EE9C:
	.4byte	.L804EEB4
	.4byte	.L804EF7C
	.4byte	.L804EF9E
	.4byte	.L804EF9E
	.4byte	.L804EFC8
	.4byte	.L804EF1C
.L804EEB4:
	add	r0, r5, #0
	add	r0, r0, #0xf0
	ldr	r0, [r0]
	cmp	r0, #0x20
	beq	.L804EEC0	@cond_branch
	b	.L804F012
.L804EEC0:
	add	r4, r5, #0
	add	r4, r4, #0xc0
	mov	r1, #0x80
	NEG	r1, r1
	mov	r0, #0x0
	str	r0, [sp]
	add	r0, r4, #0
	mov	r2, #0x0
	mov	r3, #0x18
	bl	sub_80504E4
	ldr	r2, .L804EF18
	mov	r6, #0x80
	lsl	r6, r6, #0x1
	str	r6, [sp]
	add	r0, r4, #0
	mov	r1, #0x0
	mov	r3, #0x0
	bl	sub_805052C
	mov	r0, #0x4
	bl	sub_8051780
	cmp	r0, #0
	beq	.L804EEF4	@cond_branch
	b	.L804F012
.L804EEF4:
	add	r4, r4, #0x18
	mov	r3, #0x18
	NEG	r3, r3
	str	r0, [sp]
	add	r0, r4, #0
	mov	r1, #0x80
	mov	r2, #0x0
	bl	sub_80504E4
	str	r6, [sp]
	add	r0, r4, #0
	mov	r1, #0x0
	add	r2, r6, #0
	mov	r3, #0x0
	bl	sub_805052C
	b	.L804F012
.L804EF16:
	.align	2, 0
.L804EF18:
	.4byte	0xffffff00
.L804EF1C:
	add	r0, r5, #0
	add	r0, r0, #0xf0
	ldr	r0, [r0]
	mov	r7, #0xf8
	lsl	r7, r7, #0x7
	cmp	r0, #0x1f
	bgt	.L804EF2E	@cond_branch
	mov	r7, #0xc8
	lsl	r7, r7, #0x8
.L804EF2E:
	add	r6, r5, #0
	add	r6, r6, #0x30
	cmp	r0, #0x20
	bne	.L804EF5E	@cond_branch
	add	r4, r5, #0
	add	r4, r4, #0xc0
	mov	r1, #0x80
	NEG	r1, r1
	mov	r0, #0x0
	str	r0, [sp]
	add	r0, r4, #0
	mov	r2, #0x0
	mov	r3, #0x18
	bl	sub_80504E4
	ldr	r2, .L804EF78
	mov	r0, #0x80
	lsl	r0, r0, #0x1
	str	r0, [sp]
	add	r0, r4, #0
	mov	r1, #0x0
	mov	r3, #0x0
	bl	sub_805052C
.L804EF5E:
	ldr	r1, [r5, #0x30]
	lsl	r1, r1, #0x8
	asr	r1, r1, #0x10
	ldr	r2, [r6, #0x4]
	sub	r0, r7, r2
	asr	r0, r0, #0x3
	add	r2, r2, r0
	lsl	r2, r2, #0x8
	asr	r2, r2, #0x10
	add	r0, r6, #0
	bl	sub_8061844
	b	.L804F012
.L804EF78:
	.align	2, 0

	.4byte	0xffffff00
.L804EF7C:
	bl	sub_8057C40
	asr	r1, r0, #0x4
	mov	r0, #0x7
	and	r1, r1, r0
	mov	r0, #0x3
	and	r0, r0, r1
	cmp	r0, #0
	bne	.L804EF9E	@cond_branch
	asr	r0, r1, #0x2
	mov	r1, #0xf
	cmp	r0, #0
	beq	.L804EF98	@cond_branch
	mov	r1, #0xd
.L804EF98:
	add	r0, r5, #0
	bl	sub_806185C
.L804EF9E:
	add	r0, r5, #0
	add	r0, r0, #0xf0
	ldr	r0, [r0]
	cmp	r0, #0x20
	bne	.L804F012	@cond_branch
	add	r4, r5, #0
	add	r4, r4, #0xc0
	str	r0, [sp]
	add	r0, r4, #0
	mov	r1, #0x0
	mov	r2, #0x30
	mov	r3, #0x0
	bl	sub_80504E4
	mov	r2, #0x80
	lsl	r2, r2, #0x1
	add	r0, r4, #0
	mov	r1, #0x0
	bl	sub_8050578
	b	.L804F012
.L804EFC8:
	bl	sub_8057C40
	asr	r1, r0, #0x4
	mov	r0, #0x7
	and	r1, r1, r0
	mov	r0, #0x3
	and	r0, r0, r1
	cmp	r0, #0
	bne	.L804EFEA	@cond_branch
	asr	r0, r1, #0x2
	mov	r1, #0xf
	cmp	r0, #0
	beq	.L804EFE4	@cond_branch
	mov	r1, #0xd
.L804EFE4:
	add	r0, r5, #0
	bl	sub_806185C
.L804EFEA:
	add	r0, r5, #0
	add	r0, r0, #0xf0
	ldr	r0, [r0]
	cmp	r0, #0x20
	bne	.L804F012	@cond_branch
	add	r4, r5, #0
	add	r4, r4, #0xc0
	str	r0, [sp]
	add	r0, r4, #0
	mov	r1, #0x0
	mov	r2, #0x30
	mov	r3, #0x0
	bl	sub_80504E4
	mov	r2, #0x80
	lsl	r2, r2, #0x1
	add	r0, r4, #0
	mov	r1, #0x0
	bl	sub_8050578
.L804F012:
	mov	r0, #0x87
	lsl	r0, r0, #0x1
	add	r4, r5, r0
	mov	r0, #0x2
	ldrh	r1, [r4]
	and	r0, r0, r1
	cmp	r0, #0
	beq	.L804F02A	@cond_branch
	add	r0, r5, #0
	add	r0, r0, #0xc0
	bl	sub_805041C
.L804F02A:
	mov	r0, #0x4
	ldrh	r4, [r4]
	and	r0, r0, r4
	cmp	r0, #0
	beq	.L804F042	@cond_branch
	add	r0, r5, #0
	add	r0, r0, #0xd8
	bl	sub_805041C
	b	.L804F042
.L804F03E:
	bl	sub_804FD64
.L804F042:
	add	r0, r5, #0
	bl	sub_804F478
	add	r0, r5, #0
	bl	sub_804F05C
	add	r0, r5, #0
	bl	sub_804F2A0
	add	sp, sp, #0x4
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
	thumb_func_end sub_804EE54

.align 2, 0 @ Don't pad with nop.
