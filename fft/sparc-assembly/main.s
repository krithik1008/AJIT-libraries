	.file	"main.c"
	.section	".text"
	.align 4
	.global Bit_Reverse
	.type	Bit_Reverse, #function
	.proc	0106
Bit_Reverse:
	save	%sp, -104, %sp
	mov	%i0, %g2
	mov	%i1, %g1
	mov	%g2, %i4
	sra	%g1, 1, %i1
	sra	%i1, 1, %l0
	mov	0, %i5
	mov	0, %i3
	b	.L2
	 nop
.L7:
	cmp	%i5, %i3
	ble	.L3
	 nop
	mov	%i5, %g2
	sll	%g2, 3, %g2
	add	%i4, %g2, %g2
	ldd	[%g2], %f8
	std	%f8, [%fp-8]
	mov	%i5, %g2
	sll	%g2, 3, %g2
	add	%i4, %g2, %g2
	mov	%i3, %g3
	sll	%g3, 3, %g3
	add	%i4, %g3, %g3
	ldd	[%g3], %f8
	std	%f8, [%g2]
	mov	%i3, %g2
	sll	%g2, 3, %g2
	add	%i4, %g2, %g2
	ldd	[%fp-8], %f8
	std	%f8, [%g2]
	srl	%i5, 31, %g2
	add	%g2, %i5, %g2
	sra	%g2, 1, %g2
	cmp	%g2, %l0
	bge	.L3
	 nop
	xnor	%g0, %i3, %g2
	add	%g2, %g1, %i0
	xnor	%g0, %i5, %g2
	add	%g2, %g1, %i2
	mov	%i0, %g2
	sll	%g2, 3, %g2
	add	%i4, %g2, %g2
	ldd	[%g2], %f8
	std	%f8, [%fp-8]
	mov	%i0, %g2
	sll	%g2, 3, %g2
	add	%i4, %g2, %g2
	mov	%i2, %g3
	sll	%g3, 3, %g3
	add	%i4, %g3, %g3
	ldd	[%g3], %f8
	std	%f8, [%g2]
	mov	%i2, %g2
	sll	%g2, 3, %g2
	add	%i4, %g2, %g2
	ldd	[%fp-8], %f8
	std	%f8, [%g2]
.L3:
	sra	%g1, 1, %i2
	b	.L4
	 nop
.L6:
	sub	%i5, %i2, %i5
	sra	%i2, 1, %i2
.L4:
	cmp	%i2, 1
	ble	.L5
	 nop
	cmp	%i5, %i2
	bge	.L6
	 nop
.L5:
	add	%i5, %i2, %i5
	add	%i3, 1, %i3
.L2:
	cmp	%i3, %i1
	bl	.L7
	 nop
	mov	%i4, %g1
	mov	%g1, %i0
	restore
	jmp	%o7+8
	 nop
	.size	Bit_Reverse, .-Bit_Reverse
	.section	".rodata"
	.align 8
.LC0:
	.long	1075388922
	.long	4236968058
	.align 8
.LC1:
	.long	1071644672
	.long	0
	.align 8
.LC2:
	.long	-1073741824
	.long	0
	.align 4
.LC3:
	.long	1065353216
	.align 4
.LC4:
	.long	0
	.section	".text"
	.align 4
	.global FFT
	.type	FFT, #function
	.proc	0106
FFT:
	save	%sp, -144, %sp
	mov	%i0, %i5
	mov	%i1, %g1
	mov	%i2, %l1
	add	%g1, %g1, %g2
	mov	%g2, %i0
	mov	%i5, %o0
	mov	%g1, %o1
	call	Bit_Reverse, 0
	 nop
	mov	%o0, %i5
	mov	2, %i3
	b	.L10
	 nop
.L15:
	add	%i3, %i3, %g1
	mov	%g1, %l0
	st	%l1, [%fp-36]
	ld	[%fp-36], %f8
	fitod	%f8, %f10
	st	%i3, [%fp-36]
	ld	[%fp-36], %f12
	fitod	%f12, %f8
	sethi	%hi(.LC0), %g1
	or	%g1, %lo(.LC0), %g1
	ldd	[%g1], %f12
	fdivd	%f12, %f8, %f8
	fmuld	%f10, %f8, %f8
	fdtos	%f8, %f8
	st	%f8, [%fp-12]
	ld	[%fp-12], %f8
	fstod	%f8, %f10
	sethi	%hi(.LC1), %g1
	or	%g1, %lo(.LC1), %g1
	ldd	[%g1], %f8
	fmuld	%f10, %f8, %f8
	std	%f8, [%fp-48]
	ldd	[%fp-48], %o0
	call	sin, 0
	 nop
	fmovs	%f0, %f8
	fmovs	%f1, %f9
	fdtos	%f8, %f8
	st	%f8, [%fp-16]
	ld	[%fp-16], %f8
	fstod	%f8, %f10
	sethi	%hi(.LC2), %g1
	or	%g1, %lo(.LC2), %g1
	ldd	[%g1], %f8
	fmuld	%f10, %f8, %f10
	ld	[%fp-16], %f8
	fstod	%f8, %f8
	fmuld	%f10, %f8, %f8
	fdtos	%f8, %f8
	st	%f8, [%fp-20]
	ld	[%fp-12], %f8
	fstod	%f8, %f8
	std	%f8, [%fp-48]
	ldd	[%fp-48], %o0
	call	sin, 0
	 nop
	fmovs	%f0, %f8
	fmovs	%f1, %f9
	fdtos	%f8, %f8
	st	%f8, [%fp-24]
	sethi	%hi(.LC3), %g1
	or	%g1, %lo(.LC3), %g1
	ld	[%g1], %f8
	st	%f8, [%fp-4]
	sethi	%hi(.LC4), %g1
	or	%g1, %lo(.LC4), %g1
	ld	[%g1], %f8
	st	%f8, [%fp-8]
	mov	1, %i1
	b	.L11
	 nop
.L14:
	mov	%i1, %i4
	b	.L12
	 nop
.L13:
	add	%i4, %i3, %i2
#APP
! 78 "main.c" 1
	nop
! 0 "" 2
! 79 "main.c" 1
	nop
! 0 "" 2
#NO_APP
	mov	%i2, %g1
	add	%g1, -1, %g1
	sll	%g1, 2, %g1
	add	%i5, %g1, %g1
	ld	[%g1], %f9
	ld	[%fp-4], %f8
	fmuls	%f9, %f8, %f9
	mov	%i2, %g1
	sll	%g1, 2, %g1
	add	%i5, %g1, %g1
	ld	[%g1], %f10
	ld	[%fp-8], %f8
	fmuls	%f10, %f8, %f8
	fsubs	%f9, %f8, %f8
	st	%f8, [%fp-28]
	mov	%i2, %g1
	sll	%g1, 2, %g1
	add	%i5, %g1, %g1
	ld	[%g1], %f9
	ld	[%fp-4], %f8
	fmuls	%f9, %f8, %f9
	mov	%i2, %g1
	add	%g1, -1, %g1
	sll	%g1, 2, %g1
	add	%i5, %g1, %g1
	ld	[%g1], %f10
	ld	[%fp-8], %f8
	fmuls	%f10, %f8, %f8
	fadds	%f9, %f8, %f8
	st	%f8, [%fp-32]
	mov	%i2, %g1
	add	%g1, -1, %g1
	sll	%g1, 2, %g1
	add	%i5, %g1, %g1
	mov	%i4, %g2
	add	%g2, -1, %g2
	sll	%g2, 2, %g2
	add	%i5, %g2, %g2
	ld	[%g2], %f9
	ld	[%fp-28], %f8
	fsubs	%f9, %f8, %f8
	st	%f8, [%g1]
	mov	%i2, %g1
	sll	%g1, 2, %g1
	add	%i5, %g1, %g1
	mov	%i4, %g2
	sll	%g2, 2, %g2
	add	%i5, %g2, %g2
	ld	[%g2], %f9
	ld	[%fp-32], %f8
	fsubs	%f9, %f8, %f8
	st	%f8, [%g1]
	mov	%i4, %g1
	add	%g1, -1, %g1
	sll	%g1, 2, %g1
	add	%i5, %g1, %g1
	mov	%i4, %g2
	add	%g2, -1, %g2
	sll	%g2, 2, %g2
	add	%i5, %g2, %g2
	ld	[%g2], %f9
	ld	[%fp-28], %f8
	fadds	%f9, %f8, %f8
	st	%f8, [%g1]
#APP
! 85 "main.c" 1
	nop
! 0 "" 2
! 86 "main.c" 1
	nop
! 0 "" 2
! 87 "main.c" 1
	nop
! 0 "" 2
#NO_APP
	mov	%i4, %g1
	sll	%g1, 2, %g1
	add	%i5, %g1, %g1
	mov	%i4, %g2
	sll	%g2, 2, %g2
	add	%i5, %g2, %g2
	ld	[%g2], %f9
	ld	[%fp-32], %f8
	fadds	%f9, %f8, %f8
	st	%f8, [%g1]
	add	%i4, %l0, %i4
.L12:
	cmp	%i4, %i0
	ble	.L13
	 nop
	ld	[%fp-4], %f8
	st	%f8, [%fp-16]
	ld	[%fp-16], %f9
	ld	[%fp-20], %f8
	fmuls	%f9, %f8, %f9
	ld	[%fp-8], %f10
	ld	[%fp-24], %f8
	fmuls	%f10, %f8, %f8
	fsubs	%f9, %f8, %f8
	ld	[%fp-4], %f9
	fadds	%f9, %f8, %f8
	st	%f8, [%fp-4]
	ld	[%fp-8], %f9
	ld	[%fp-20], %f8
	fmuls	%f9, %f8, %f9
	ld	[%fp-16], %f10
	ld	[%fp-24], %f8
	fmuls	%f10, %f8, %f8
	fadds	%f9, %f8, %f8
	ld	[%fp-8], %f9
	fadds	%f9, %f8, %f8
	st	%f8, [%fp-8]
	add	%i1, 2, %i1
.L11:
	cmp	%i1, %i3
	bl	.L14
	 nop
	mov	%l0, %i3
.L10:
	cmp	%i0, %i3
	bg	.L15
	 nop
	mov	%i5, %g1
	mov	%g1, %i0
	restore
	jmp	%o7+8
	 nop
	.size	FFT, .-FFT
	.align 4
	.global main
	.type	main, #function
	.proc	0106
main:
	save	%sp, -104, %sp
	call	gen, 0
	 nop
	st	%o0, [%fp-4]
	ld	[%fp-4], %o0
	mov	16, %o1
	mov	1, %o2
	call	FFT, 0
	 nop
	mov	%o0, %g1
	mov	%g1, %i0
	restore
	jmp	%o7+8
	 nop
	.size	main, .-main
	.ident	"GCC: (Buildroot 2014.08-g03a6b53) 4.7.4"
	.section	.note.GNU-stack,"",@progbits
