	.include "asm/common.inc"

	thumb_func_start sub_8053F0C
sub_8053F0C:
	push	{r4, r5, lr}
	ldr	r0, .L8053F24
	ldr	r0, [r0]
	ldrb	r5, [r0, #0x3]
	cmp	r5, #0x2
	beq	.L8053F8C	@cond_branch
	cmp	r5, #0x2
	bgt	.L8053F28	@cond_branch
	cmp	r5, #0x1
	beq	.L8053F2E	@cond_branch
	b	.L8054058
.L8053F22:
	.align	2, 0
.L8053F24:
	.4byte	0x3000f48
.L8053F28:
	cmp	r5, #0x3
	beq	.L8053FF0	@cond_branch
	b	.L8054058
.L8053F2E:
	ldr	r0, .L8053F70
	ldr	r1, [r0]
	ldr	r0, .L8053F70 + 4
	add	r2, r1, r0
	mov	r3, #0x0
	mov	r0, #0x80
	lsl	r0, r0, #0x2
	strh	r0, [r2]
	ldr	r0, .L8053F70 + 8
	add	r2, r1, r0
	mov	r0, #0x80
	lsl	r0, r0, #0x1
	strh	r0, [r2]
	mov	r0, #0x80
	lsl	r0, r0, #0x4
	add	r2, r1, r0
	mov	r0, #0x2
	strh	r0, [r2]
	ldr	r2, .L8053F70 + 12
	add	r0, r1, r2
	strh	r5, [r0]
	ldr	r0, .L8053F70 + 16
	add	r2, r1, r0
	mov	r0, #0x9
	strh	r0, [r2]
	ldr	r0, .L8053F70 + 20
	add	r2, r1, r0
	mov	r0, #0x8
	strh	r0, [r2]
	ldr	r2, .L8053F70 + 24
	add	r0, r1, r2
	strh	r5, [r0]
	b	.L805409A
.L8053F70:
	.align	2, 0

	.4byte	0x3000fb0
	.4byte	0x7fc
	.4byte	0x7fe
	.4byte	0x802
	.4byte	0x804
	.4byte	0x806
	.4byte	0x808
.L8053F8C:
	ldr	r0, .L8053FD4
	ldr	r1, [r0]
	ldr	r0, .L8053FD4 + 4
	add	r2, r1, r0
	mov	r4, #0x0
	mov	r0, #0x80
	lsl	r0, r0, #0x1
	strh	r0, [r2]
	ldr	r0, .L8053FD4 + 8
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
	ldr	r0, .L8053FD4 + 12
	add	r2, r1, r0
	mov	r0, #0x8
	strh	r0, [r2]
	ldr	r0, .L8053FD4 + 16
	add	r2, r1, r0
	mov	r0, #0x9
	strh	r0, [r2]
	ldr	r2, .L8053FD4 + 20
	add	r0, r1, r2
	strh	r3, [r0]
	ldr	r0, .L8053FD4 + 24
	add	r1, r1, r0
	strh	r4, [r1]
	b	.L80540A0
.L8053FD4:
	.align	2, 0

	.4byte	0x3000fb0
	.4byte	0x7fc
	.4byte	0x7fe
	.4byte	0x804
	.4byte	0x806
	.4byte	0x808
	.4byte	0x80a
.L8053FF0:
	ldr	r0, .L805403C
	ldr	r1, [r0]
	ldr	r0, .L805403C + 4
	add	r2, r1, r0
	mov	r4, #0x0
	mov	r0, #0x80
	lsl	r0, r0, #0x1
	strh	r0, [r2]
	ldr	r0, .L805403C + 8
	add	r2, r1, r0
	mov	r0, #0x2
	strh	r0, [r2]
	mov	r2, #0x80
	lsl	r2, r2, #0x4
	add	r0, r1, r2
	mov	r3, #0x1
	strh	r3, [r0]
	ldr	r0, .L805403C + 12
	add	r2, r1, r0
	mov	r0, #0x80
	lsl	r0, r0, #0x2
	strh	r0, [r2]
	ldr	r0, .L805403C + 16
	add	r2, r1, r0
	mov	r0, #0x8
	strh	r0, [r2]
	ldr	r2, .L805403C + 20
	add	r0, r1, r2
	strh	r3, [r0]
	add	r2, r2, #0x2
	add	r0, r1, r2
	strh	r4, [r0]
	ldr	r0, .L805403C + 24
	add	r1, r1, r0
	mov	r0, #0x9
	strh	r0, [r1]
	b	.L80540A0
.L805403A:
	.align	2, 0
.L805403C:
	.4byte	0x3000fb0
	.4byte	0x7fc
	.4byte	0x7fe
	.4byte	0x802
	.4byte	0x804
	.4byte	0x806
	.4byte	0x80a
.L8054058:
	ldr	r0, .L80540A8
	ldr	r1, [r0]
	ldr	r0, .L80540A8 + 4
	add	r2, r1, r0
	mov	r4, #0x0
	mov	r0, #0x80
	lsl	r0, r0, #0x2
	strh	r0, [r2]
	ldr	r0, .L80540A8 + 8
	add	r2, r1, r0
	mov	r0, #0x80
	lsl	r0, r0, #0x1
	strh	r0, [r2]
	mov	r2, #0x80
	lsl	r2, r2, #0x4
	add	r0, r1, r2
	mov	r3, #0x1
	strh	r3, [r0]
	ldr	r0, .L80540A8 + 12
	add	r2, r1, r0
	mov	r0, #0x2
	strh	r0, [r2]
	ldr	r0, .L80540A8 + 16
	add	r2, r1, r0
	mov	r0, #0x9
	strh	r0, [r2]
	ldr	r0, .L80540A8 + 20
	add	r2, r1, r0
	mov	r0, #0x8
	strh	r0, [r2]
	ldr	r2, .L80540A8 + 24
	add	r0, r1, r2
	strh	r4, [r0]
.L805409A:
	ldr	r0, .L80540A8 + 28
	add	r1, r1, r0
	strh	r3, [r1]
.L80540A0:
	pop	{r4, r5}
	pop	{r0}
	bx	r0
.L80540A6:
	.align	2, 0
.L80540A8:
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
