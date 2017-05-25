	.include "asm/common.inc"

	thumb_func_start sub_804712C
sub_804712C:
	push	{r4, r5, r6, r7, lr}
	mov	r7, sl
	mov	r6, r9
	mov	r5, r8
	push	{r5, r6, r7}
	add	r7, r0, #0
	bl	getLanguage
	add	r4, r0, #0
	add	r0, r7, #0
	add	r0, r0, #0x34
	ldrb	r0, [r0]
	lsl	r0, r0, #0x18
	asr	r0, r0, #0x18
	mov	r9, r0
	bl	getBeybladeData0
	mov	r0, #0x0
	mov	sl, r0
	add	r0, r7, #0
	bl	sub_804703C
	ldr	r0, [r7, #0x14]
	bl	sub_8061228
	ldr	r0, [r7, #0x18]
	bl	sub_8061228
	ldr	r0, [r7, #0x1c]
	bl	sub_8061228
	ldr	r0, [r7, #0x20]
	bl	sub_8061228
	ldr	r0, [r7, #0x24]
	bl	sub_8061228
	ldr	r0, [r7, #0x28]
	bl	sub_8061228
	ldr	r0, [r7, #0x2c]
	bl	sub_8061228
	ldr	r1, [r7, #0x8]
	cmp	r1, #0
	beq	.L1	@cond_branch
	mov	r0, #0xa0
	lsl	r0, r0, #0x8
	str	r0, [r1, #0xc]
.L1:
	ldr	r1, [r7, #0xc]
	cmp	r1, #0
	beq	.L2	@cond_branch
	mov	r0, #0xa0
	lsl	r0, r0, #0x8
	str	r0, [r1, #0xc]
.L2:
	ldr	r1, [r7, #0x10]
	cmp	r1, #0
	beq	.L3	@cond_branch
	mov	r0, #0xa0
	lsl	r0, r0, #0x8
	str	r0, [r1, #0xc]
.L3:
	add	r0, r7, #0
	add	r0, r0, #0x35
	ldrb	r0, [r0]
	lsl	r0, r0, #0x18
	asr	r0, r0, #0x18
	cmp	r0, #0x5
	bls	.L4	@cond_branch
	b	.L27
.L4:
	lsl	r0, r0, #0x2
	ldr	r1, .L7
	add	r0, r0, r1
	ldr	r0, [r0]
	mov	pc, r0
.L8:
	.align	2, 0
.L7:
	.4byte	.L6
.L6:
	.4byte	.L9
	.4byte	.L10
	.4byte	.L11
	.4byte	.L12
	.4byte	.L13
	.4byte	.L14
.L9:
	ldr	r0, [r7, #0x14]
	ldr	r1, .L16
	lsl	r6, r4, #0x2
	add	r1, r6, r1
	ldr	r1, [r1]
	mov	r2, #0xe
	bl	sub_8061660
	ldr	r0, [r7, #0x18]
	ldr	r5, .L16 + 4
	add	r1, r6, r5
	ldr	r1, [r1]
	mov	r2, #0xe
	bl	sub_8061660
	ldr	r4, [r7, #0x18]
	mov	r0, r9
	bl	sub_8057048
	add	r1, r0, #0
	add	r0, r4, #0
	mov	r2, #0xf
	bl	showString
	ldr	r0, [r7, #0x1c]
	add	r1, r5, #0
	add	r1, r1, #0x14
	add	r1, r6, r1
	ldr	r1, [r1]
	mov	r2, #0xe
	bl	sub_8061660
	ldr	r4, [r7, #0x1c]
	mov	r0, r9
	bl	sub_80573DC
	add	r1, r0, #0
	add	r0, r4, #0
	mov	r2, #0xf
	bl	showString
	ldr	r0, [r7, #0x20]
	add	r5, r5, #0x28
	add	r6, r6, r5
	ldr	r1, [r6]
	mov	r2, #0xe
	bl	sub_8061660
	ldr	r4, [r7, #0x20]
	mov	r0, r9
	bl	sub_80573FC
	b	.L15
.L17:
	.align	2, 0
.L16:
	.4byte	0x806e240
	.4byte	0x806e31c
.L10:
	ldr	r0, [r7, #0x14]
	ldr	r6, .L19
	lsl	r4, r4, #0x2
	add	r1, r6, #0
	add	r1, r1, #0x14
	add	r1, r4, r1
	ldr	r1, [r1]
	mov	r2, #0xe
	bl	sub_8061660
	ldr	r0, [r7, #0x18]
	ldr	r1, .L19 + 4
	add	r1, r4, r1
	ldr	r1, [r1]
	mov	r2, #0xe
	bl	sub_8061660
	ldr	r5, [r7, #0x18]
	mov	r0, r9
	bl	sub_805741C
	add	r1, r0, #0
	add	r0, r5, #0
	mov	r2, #0xf
	bl	showString
	ldr	r0, [r7, #0x24]
	add	r1, r6, #0
	add	r1, r1, #0x64
	add	r1, r4, r1
	ldr	r1, [r1]
	mov	r2, #0xe
	bl	sub_8061660
	ldr	r0, [r7, #0x28]
	add	r1, r6, #0
	add	r1, r1, #0x78
	add	r1, r4, r1
	ldr	r1, [r1]
	mov	r2, #0xe
	bl	sub_8061660
	ldr	r0, [r7, #0x2c]
	add	r1, r6, #0
	add	r1, r1, #0x8c
	add	r4, r4, r1
	ldr	r1, [r4]
	mov	r2, #0xe
	bl	sub_8061660
	mov	r2, #0x1
	mov	sl, r2
	mov	r0, r9
	bl	sub_80573C8
	mov	r8, r0
	b	.L27
.L20:
	.align	2, 0
.L19:
	.4byte	0x806e240
	.4byte	0x806e31c
.L11:
	ldr	r0, [r7, #0x14]
	ldr	r6, .L22
	lsl	r4, r4, #0x2
	add	r1, r6, #0
	add	r1, r1, #0x28
	add	r1, r4, r1
	ldr	r1, [r1]
	mov	r2, #0xe
	bl	sub_8061660
	ldr	r0, [r7, #0x18]
	ldr	r1, .L22 + 4
	add	r1, r1, #0x14
	add	r1, r4, r1
	ldr	r1, [r1]
	mov	r2, #0xe
	bl	sub_8061660
	ldr	r5, [r7, #0x18]
	mov	r0, r9
	bl	sub_805743C
	add	r1, r0, #0
	add	r0, r5, #0
	mov	r2, #0xf
	bl	showString
	ldr	r0, [r7, #0x24]
	add	r1, r6, #0
	add	r1, r1, #0x64
	add	r1, r4, r1
	ldr	r1, [r1]
	mov	r2, #0xe
	bl	sub_8061660
	ldr	r0, [r7, #0x28]
	add	r1, r6, #0
	add	r1, r1, #0x78
	add	r1, r4, r1
	ldr	r1, [r1]
	mov	r2, #0xe
	bl	sub_8061660
	ldr	r0, [r7, #0x2c]
	add	r1, r6, #0
	add	r1, r1, #0x8c
	add	r4, r4, r1
	ldr	r1, [r4]
	mov	r2, #0xe
	bl	sub_8061660
	mov	r0, #0x1
	mov	sl, r0
	mov	r0, r9
	bl	sub_80573C8
	add	r0, r0, #0x4
	mov	r8, r0
	b	.L27
.L23:
	.align	2, 0
.L22:
	.4byte	0x806e240
	.4byte	0x806e31c
.L12:
	ldr	r0, [r7, #0x14]
	ldr	r6, .L25
	lsl	r4, r4, #0x2
	add	r1, r6, #0
	add	r1, r1, #0x3c
	add	r1, r4, r1
	ldr	r1, [r1]
	mov	r2, #0xe
	bl	sub_8061660
	ldr	r0, [r7, #0x18]
	ldr	r1, .L25 + 4
	add	r1, r1, #0x14
	add	r1, r4, r1
	ldr	r1, [r1]
	mov	r2, #0xe
	bl	sub_8061660
	ldr	r5, [r7, #0x18]
	mov	r0, r9
	bl	sub_805745C
	add	r1, r0, #0
	add	r0, r5, #0
	mov	r2, #0xf
	bl	showString
	ldr	r0, [r7, #0x24]
	add	r1, r6, #0
	add	r1, r1, #0x64
	add	r1, r4, r1
	ldr	r1, [r1]
	mov	r2, #0xe
	bl	sub_8061660
	ldr	r0, [r7, #0x28]
	add	r1, r6, #0
	add	r1, r1, #0x78
	add	r1, r4, r1
	ldr	r1, [r1]
	mov	r2, #0xe
	bl	sub_8061660
	ldr	r0, [r7, #0x2c]
	add	r1, r6, #0
	add	r1, r1, #0x8c
	add	r4, r4, r1
	ldr	r1, [r4]
	mov	r2, #0xe
	bl	sub_8061660
	mov	r2, #0x1
	mov	sl, r2
	mov	r0, r9
	bl	sub_80573C8
	add	r0, r0, #0x8
	mov	r8, r0
	b	.L27
.L26:
	.align	2, 0
.L25:
	.4byte	0x806e240
	.4byte	0x806e31c
.L13:
	ldr	r0, [r7, #0x14]
	ldr	r1, .L28
	lsl	r4, r4, #0x2
	add	r1, r1, #0x50
	add	r1, r4, r1
	ldr	r1, [r1]
	mov	r2, #0xe
	bl	sub_8061660
	ldr	r0, [r7, #0x18]
	ldr	r1, .L28 + 4
	add	r1, r1, #0x14
	add	r4, r4, r1
	ldr	r1, [r4]
	mov	r2, #0xe
	bl	sub_8061660
	ldr	r4, [r7, #0x18]
	mov	r0, r9
	bl	sub_805747C
.L15:
	add	r1, r0, #0
	add	r0, r4, #0
	mov	r2, #0xf
	bl	showString
	b	.L27
.L29:
	.align	2, 0
.L28:
	.4byte	0x806e240
	.4byte	0x806e31c
.L14:
	ldr	r0, [r7, #0x14]
	ldr	r1, .L34
	lsl	r2, r4, #0x2
	add	r1, r1, #0xc8
	add	r2, r2, r1
	ldr	r1, [r2]
	mov	r2, #0xe
	bl	sub_8061660
.L27:
	mov	r0, sl
	cmp	r0, #0
	beq	.L39	@cond_branch
	ldr	r1, [r7, #0x8]
	cmp	r1, #0
	beq	.L31	@cond_branch
	mov	r0, #0xa8
	lsl	r0, r0, #0x7
	str	r0, [r1, #0xc]
	mov	r2, r8
	ldrb	r0, [r2]
	cmp	r0, #0
	beq	.L32	@cond_branch
	ldrb	r0, [r2]
	sub	r0, r0, #0x1
	b	.L33
.L35:
	.align	2, 0
.L34:
	.4byte	0x806e240
.L32:
	mov	r0, #0x0
.L33:
	strh	r0, [r1, #0x18]
.L31:
	ldr	r1, [r7, #0xc]
	cmp	r1, #0
	beq	.L36	@cond_branch
	mov	r0, #0xc0
	lsl	r0, r0, #0x7
	str	r0, [r1, #0xc]
	mov	r2, r8
	ldrb	r0, [r2, #0x1]
	cmp	r0, #0
	beq	.L37	@cond_branch
	ldrb	r0, [r2, #0x1]
	sub	r0, r0, #0x1
	b	.L38
.L37:
	mov	r0, #0x0
.L38:
	strh	r0, [r1, #0x18]
.L36:
	ldr	r1, [r7, #0x10]
	cmp	r1, #0
	beq	.L39	@cond_branch
	mov	r0, #0xd8
	lsl	r0, r0, #0x7
	str	r0, [r1, #0xc]
	mov	r2, r8
	ldrb	r0, [r2, #0x2]
	cmp	r0, #0
	beq	.L40	@cond_branch
	ldrb	r0, [r2, #0x2]
	sub	r0, r0, #0x1
	b	.L41
.L40:
	mov	r0, #0x0
.L41:
	strh	r0, [r1, #0x18]
.L39:
	pop	{r3, r4, r5}
	mov	r8, r3
	mov	r9, r4
	mov	sl, r5
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
	thumb_func_end sub_804712C

.align 2, 0 @ Don't pad with nop.
