	.include "asm/common.inc"

	thumb_func_start sub_8053F0C
sub_8053F0C:
	push	{r4, r5, lr}
	ldr	r0, .L5
	ldr	r0, [r0]
	ldrb	r5, [r0, #0x3]
	cmp	r5, #0x2
	beq	.L1	@cond_branch
	cmp	r5, #0x2
	bgt	.L2	@cond_branch
	cmp	r5, #0x1
	beq	.L3	@cond_branch
	b	.L8
.L6:
	.align	2, 0
.L5:
	.4byte	0x3000f48
.L2:
	cmp	r5, #0x3
	beq	.L7	@cond_branch
	b	.L8
.L3:
	ldr	r0, .L10
	ldr	r1, [r0]
	ldr	r0, .L10 + 4
	add	r2, r1, r0
	mov	r3, #0x0
	mov	r0, #0x80
	lsl	r0, r0, #0x2
	strh	r0, [r2]
	ldr	r0, .L10 + 8
	add	r2, r1, r0
	mov	r0, #0x80
	lsl	r0, r0, #0x1
	strh	r0, [r2]
	mov	r0, #0x80
	lsl	r0, r0, #0x4
	add	r2, r1, r0
	mov	r0, #0x2
	strh	r0, [r2]
	ldr	r2, .L10 + 12
	add	r0, r1, r2
	strh	r5, [r0]
	ldr	r0, .L10 + 16
	add	r2, r1, r0
	mov	r0, #0x9
	strh	r0, [r2]
	ldr	r0, .L10 + 20
	add	r2, r1, r0
	mov	r0, #0x8
	strh	r0, [r2]
	ldr	r2, .L10 + 24
	add	r0, r1, r2
	strh	r5, [r0]
	b	.L9
.L11:
	.align	2, 0
.L10:
	.4byte	0x3000fb0
	.4byte	0x7fc
	.4byte	0x7fe
	.4byte	0x802
	.4byte	0x804
	.4byte	0x806
	.4byte	0x808
.L1:
	ldr	r0, .L13
	ldr	r1, [r0]
	ldr	r0, .L13 + 4
	add	r2, r1, r0
	mov	r4, #0x0
	mov	r0, #0x80
	lsl	r0, r0, #0x1
	strh	r0, [r2]
	ldr	r0, .L13 + 8
	add	r2, r1, r0
	mov	r0, #0x80
	lsl	r0, r0, #0x2
	strh	r0, [r2]
	mov	r2, #0x80
	lsl	r2, r2, #0x4
	add	r0, r1, r2
	strh	r5, [r0]
	add	r2, r2, #0x2
	add	r0, r1, r2
	mov	r3, #0x1
	strh	r3, [r0]
	ldr	r0, .L13 + 12
	add	r2, r1, r0
	mov	r0, #0x8
	strh	r0, [r2]
	ldr	r0, .L13 + 16
	add	r2, r1, r0
	mov	r0, #0x9
	strh	r0, [r2]
	ldr	r2, .L13 + 20
	add	r0, r1, r2
	strh	r3, [r0]
	ldr	r0, .L13 + 24
	add	r1, r1, r0
	strh	r4, [r1]
	b	.L15
.L14:
	.align	2, 0
.L13:
	.4byte	0x3000fb0
	.4byte	0x7fc
	.4byte	0x7fe
	.4byte	0x804
	.4byte	0x806
	.4byte	0x808
	.4byte	0x80a
.L7:
	ldr	r0, .L16
	ldr	r1, [r0]
	ldr	r0, .L16 + 4
	add	r2, r1, r0
	mov	r4, #0x0
	mov	r0, #0x80
	lsl	r0, r0, #0x1
	strh	r0, [r2]
	ldr	r0, .L16 + 8
	add	r2, r1, r0
	mov	r0, #0x2
	strh	r0, [r2]
	mov	r2, #0x80
	lsl	r2, r2, #0x4
	add	r0, r1, r2
	mov	r3, #0x1
	strh	r3, [r0]
	ldr	r0, .L16 + 12
	add	r2, r1, r0
	mov	r0, #0x80
	lsl	r0, r0, #0x2
	strh	r0, [r2]
	ldr	r0, .L16 + 16
	add	r2, r1, r0
	mov	r0, #0x8
	strh	r0, [r2]
	ldr	r2, .L16 + 20
	add	r0, r1, r2
	strh	r3, [r0]
	add	r2, r2, #0x2
	add	r0, r1, r2
	strh	r4, [r0]
	ldr	r0, .L16 + 24
	add	r1, r1, r0
	mov	r0, #0x9
	strh	r0, [r1]
	b	.L15
.L17:
	.align	2, 0
.L16:
	.4byte	0x3000fb0
	.4byte	0x7fc
	.4byte	0x7fe
	.4byte	0x802
	.4byte	0x804
	.4byte	0x806
	.4byte	0x80a
.L8:
	ldr	r0, .L18
	ldr	r1, [r0]
	ldr	r0, .L18 + 4
	add	r2, r1, r0
	mov	r4, #0x0
	mov	r0, #0x80
	lsl	r0, r0, #0x2
	strh	r0, [r2]
	ldr	r0, .L18 + 8
	add	r2, r1, r0
	mov	r0, #0x80
	lsl	r0, r0, #0x1
	strh	r0, [r2]
	mov	r2, #0x80
	lsl	r2, r2, #0x4
	add	r0, r1, r2
	mov	r3, #0x1
	strh	r3, [r0]
	ldr	r0, .L18 + 12
	add	r2, r1, r0
	mov	r0, #0x2
	strh	r0, [r2]
	ldr	r0, .L18 + 16
	add	r2, r1, r0
	mov	r0, #0x9
	strh	r0, [r2]
	ldr	r0, .L18 + 20
	add	r2, r1, r0
	mov	r0, #0x8
	strh	r0, [r2]
	ldr	r2, .L18 + 24
	add	r0, r1, r2
	strh	r4, [r0]
.L9:
	ldr	r0, .L18 + 28
	add	r1, r1, r0
	strh	r3, [r1]
.L15:
	pop	{r4, r5}
	pop	{r0}
	bx	r0
.L19:
	.align	2, 0
.L18:
	.4byte	0x3000fb0
	.4byte	0x7fc
	.4byte	0x7fe
	.4byte	0x802
	.4byte	0x804
	.4byte	0x806
	.4byte	0x808
	.4byte	0x80a
	thumb_func_end sub_8053F0C

.align 2, 0 @ Don't pad with nop.
