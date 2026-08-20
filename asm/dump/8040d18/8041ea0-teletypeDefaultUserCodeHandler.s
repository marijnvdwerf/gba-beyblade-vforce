	.include "asm/common.inc"

	thumb_func_start teletypeDefaultUserCodeHandler
teletypeDefaultUserCodeHandler:
	push	{r4, r5, r6, lr}
	add	r4, r0, #0
	mov	r0, #0xfe
	lsl	r0, r0, #0x17
	and	r0, r0, r1
	lsr	r2, r0, #0x18
	ldr	r6, .L8041ED0
	and	r6, r6, r1
	ldr	r0, .L8041ED0 + 4
	ldr	r5, [r0]
	cmp	r1, #0
	bge	.L8041EBA	@cond_branch
	NEG	r6, r6
.L8041EBA:
	add	r0, r2, #0
	sub	r0, r0, #0x41
	cmp	r0, #0x35
	bls	.L8041EC4	@cond_branch
	b	.L80420B0
.L8041EC4:
	lsl	r0, r0, #0x2
	ldr	r1, .L8041ED0 + 8
	add	r0, r0, r1
	ldr	r0, [r0]
	mov	pc, r0
.L8041ECE:
	.align	2, 0
.L8041ED0:
	.4byte	0xffffff
	.4byte	_unk3000EE8
	.4byte	.L8041EDC
.L8041EDC:
	.4byte	.L8041FBC
	.4byte	.L804200A
	.4byte	.L804209C
	.4byte	.L80420B0
	.4byte	.L80420B0
	.4byte	.L8042070
	.4byte	.L80420B0
	.4byte	.L80420B0
	.4byte	.L80420B0
	.4byte	.L80420B0
	.4byte	.L80420B0
	.4byte	.L80420B0
	.4byte	.L80420B0
	.4byte	.L80420A8
	.4byte	.L80420B0
	.4byte	.L8041FB4
	.4byte	.L804202C
	.4byte	.L80420B0
	.4byte	.L80420B0
	.4byte	.L8042050
	.4byte	.L804203E
	.4byte	.L804201A
	.4byte	.L80420B0
	.4byte	.L80420B0
	.4byte	.L80420B0
	.4byte	.L80420B0
	.4byte	.L80420B0
	.4byte	.L80420B0
	.4byte	.L80420B0
	.4byte	.L80420B0
	.4byte	.L80420B0
	.4byte	.L80420B0
	.4byte	.L8041FBC
	.4byte	.L804200A
	.4byte	.L8042094
	.4byte	.L80420B0
	.4byte	.L80420B0
	.4byte	.L8042070
	.4byte	.L80420B0
	.4byte	.L80420B0
	.4byte	.L80420B0
	.4byte	.L80420B0
	.4byte	.L80420B0
	.4byte	.L80420B0
	.4byte	.L80420B0
	.4byte	.L80420A8
	.4byte	.L80420B0
	.4byte	.L8041FB4
	.4byte	.L804202C
	.4byte	.L80420B0
	.4byte	.L80420B0
	.4byte	.L8042050
	.4byte	.L804203E
	.4byte	.L804201A
.L8041FB4:
	add	r0, r4, #0
	bl	sub_80640F8
	b	.L80420A8
.L8041FBC:
	mov	r1, #0x0
	cmp	r2, #0x61
	bne	.L8041FC4	@cond_branch
	mov	r1, #0x1
.L8041FC4:
	add	r4, r1, #0
	add	r0, r6, #0
	bl	GetTalkingHead
	cmp	r4, #0
	beq	.L8041FD4	@cond_branch
	ldr	r2, [r0, #0x20]
	b	.L8041FD6
.L8041FD4:
	ldr	r2, [r0, #0x18]
.L8041FD6:
	cmp	r4, #0
	beq	.L8041FDE	@cond_branch
	ldr	r3, [r0, #0x24]
	b	.L8041FE0
.L8041FDE:
	ldr	r3, [r0, #0x1c]
.L8041FE0:
	add	r0, r5, #0
	add	r1, r4, #0
	bl	sub_8055C04
	add	r0, r5, #0
	add	r1, r4, #0
	bl	sub_8055C18
	lsl	r0, r0, #0x18
	cmp	r0, #0
	beq	.L8042000	@cond_branch
	add	r0, r5, #0
	add	r1, r4, #0
	bl	sub_8055B7C
	b	.L80420B8
.L8042000:
	add	r0, r5, #0
	add	r1, r4, #0
	bl	sub_8055B64
	b	.L80420B8
.L804200A:
	mov	r1, #0x0
	cmp	r2, #0x62
	bne	.L8042012	@cond_branch
	mov	r1, #0x1
.L8042012:
	add	r0, r5, #0
	bl	sub_8055B7C
	b	.L80420B8
.L804201A:
	mov	r1, #0x0
	cmp	r2, #0x76
	bne	.L8042022	@cond_branch
	mov	r1, #0x1
.L8042022:
	add	r0, r5, #0
	add	r2, r6, #0
	bl	sub_8055BA0
	b	.L80420B8
.L804202C:
	mov	r1, #0x0
	cmp	r2, #0x71
	bne	.L8042034	@cond_branch
	mov	r1, #0x1
.L8042034:
	add	r0, r5, #0
	mov	r2, #0x1
	bl	sub_8055BC0
	b	.L80420B8
.L804203E:
	mov	r1, #0x0
	cmp	r2, #0x75
	bne	.L8042046	@cond_branch
	mov	r1, #0x1
.L8042046:
	add	r0, r5, #0
	mov	r2, #0x0
	bl	sub_8055BC0
	b	.L80420B8
.L8042050:
	ldr	r2, .L8042068
	ldr	r0, [r2]
	mov	r1, #0x1
	orr	r0, r0, r1
	ldr	r1, .L8042068 + 4
	and	r0, r0, r1
	mov	r1, #0x3
	and	r6, r6, r1
	lsl	r1, r6, #0x8
	orr	r0, r0, r1
	str	r0, [r2]
	b	.L80420B8
.L8042068:
	.align	2, 0

	.4byte	_unk3000EEC
	.4byte	0xfffffcff
.L8042070:
	ldr	r3, .L804208C
	ldr	r0, [r3]
	mov	r1, #0x2
	orr	r0, r0, r1
	ldr	r1, .L804208C + 4
	and	r0, r0, r1
	lsl	r1, r6, #0xa
	mov	r2, #0xf0
	lsl	r2, r2, #0x6
	and	r1, r1, r2
	orr	r0, r0, r1
	str	r0, [r3]
	b	.L80420B8
.L804208A:
	.align	2, 0
.L804208C:
	.4byte	_unk3000EEC
	.4byte	0xffffc3ff
.L8042094:
	add	r0, r4, #0
	bl	sub_8064130
	b	.L80420B8
.L804209C:
	lsl	r1, r6, #0x18
	lsr	r1, r1, #0x18
	add	r0, r4, #0
	bl	pushTeletypeStringPalette
	b	.L80420B8
.L80420A8:
	add	r0, r4, #0
	bl	sub_80640F8
	b	.L80420B8
.L80420B0:
	ldr	r0, .L80420C0
	add	r1, r2, #0
	bl	printf
.L80420B8:
	pop	{r4, r5, r6}
	pop	{r0}
	bx	r0
.L80420BE:
	.align	2, 0
.L80420C0:
	.4byte	Str_86FCF58
	thumb_func_end teletypeDefaultUserCodeHandler

.align 2, 0 @ Don't pad with nop.
