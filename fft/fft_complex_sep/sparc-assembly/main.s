	.file	"main.c"
	.section	".text"
	.align 4
	.global Bit_Reverse
	.type	Bit_Reverse, #function
	.proc	0106
Bit_Reverse:
	save	%sp, -96, %sp
	sra	%i1, 1, %i5
	cmp	%i5, 0
	ble	.L34
	 sra	%i1, 2, %o7
	cmp	%i5, 1
	ble	.L29
	 mov	1, %i2
.L3:
	sll	%i1, 3, %i3
	add	%i0, 8, %i4
	add	%i0, %i3, %i3
	mov	0, %g2
	mov	0, %g4
	and	%i2, 0xff, %i2
.L4:
	cmp	%i5, %g2
	ble	.L9
	 mov	1, %g1
	mov	0, %g1
.L9:
	andcc	%g1, 0xff, %g0
	be	.L8
	 mov	%i5, %g1
	cmp	%i2, 0
	bne,a	.L31
	 sub	%g2, %g1, %g2
	b	.L30
	 add	%g4, 1, %g4
.L13:
	andcc	%g3, 0xff, %g0
	be,a	.L32
	 add	%g4, 1, %g4
	sub	%g2, %g1, %g2
.L31:
	sra	%g1, 1, %g1
	cmp	%g2, %g1
	bge	.L12
	 mov	1, %g3
	mov	0, %g3
.L12:
	andcc	%g3, 0xff, %g0
	be	.L8
	 cmp	%g1, 1
	bg	.L13
	 mov	1, %g3
	mov	0, %g3
	andcc	%g3, 0xff, %g0
	bne,a	.L31
	 sub	%g2, %g1, %g2
.L8:
	add	%g4, 1, %g4
.L30:
.L32:
	cmp	%g4, %i5
	be	.L34
	 add	%g2, %g1, %g2
	cmp	%g2, %g4
	ble,a	.L33
	 add	%i3, -8, %i3
	sll	%g2, 3, %g1
	ldd	[%i4], %f8
	ldd	[%i0+%g1], %f10
	std	%f8, [%i0+%g1]
	srl	%g2, 31, %g1
	add	%g1, %g2, %g1
	sra	%g1, 1, %g1
	cmp	%o7, %g1
	ble	.L6
	 std	%f10, [%i4]
	ldd	[%i3-16], %f10
	xnor	%g0, %g2, %g1
	add	%g1, %i1, %g1
	sll	%g1, 3, %g1
	ldd	[%i0+%g1], %f8
	std	%f8, [%i3-16]
	std	%f10, [%i0+%g1]
.L6:
	add	%i3, -8, %i3
.L33:
	b	.L4
	 add	%i4, 8, %i4
.L34:
	jmp	%i7+8
	 restore
.L29:
	b	.L3
	 mov	0, %i2
	.size	Bit_Reverse, .-Bit_Reverse
	.section	.rodata.cst4,"aM",@progbits,4
	.align 4
.LC0:
	.long	2147483648
	.align 4
.LC1:
	.long	0
	.align 4
.LC2:
	.long	1065353216
	.section	".text"
	.align 4
	.global FFT
	.type	FFT, #function
	.proc	0106
FFT:
	save	%sp, -96, %sp
	add	%i1, %i1, %i1
	cmp	%i1, 2
	ble	.L49
	 sethi	%hi(.LC0), %g1
	ld	[%g1+%lo(.LC0)], %f15
	sethi	%hi(.LC1), %g1
	mov	0, %o4
	ld	[%g1+%lo(.LC1)], %f14
	mov	2, %g3
	sethi	%hi(.LC2), %g1
	b	.L36
	 ld	[%g1+%lo(.LC2)], %f11
.L38:
	cmp	%i1, %i5
	ble	.L49
	 mov	%i5, %g3
.L36:
	cmp	%g3, 1
	ble	.L38
	 add	%g3, %g3, %i5
	add	%o4, 3, %o7
	sll	%g3, 2, %o3
	sll	%o7, 2, %o7
	mov	%i0, %o5
	add	%i2, %o7, %o7
	sll	%i5, 2, %i4
	mov	1, %i3
	add	%o3, 4, %o3
.L40:
	add	%o3, %o5, %g2
	mov	%o5, %g1
	cmp	%i1, %i3
	bl	.L42
	 mov	%i3, %g4
.L39:
	ld	[%g2], %f10
	fmuls	%f10, %f15, %f9
	fmuls	%f11, %f10, %f10
	ld	[%g2-4], %f8
	ld	[%g1], %f12
	fmuls	%f8, %f11, %f13
	fmuls	%f14, %f8, %f8
	fadds	%f13, %f9, %f9
	fadds	%f8, %f10, %f8
	fsubs	%f12, %f9, %f12
	st	%f12, [%g2-4]
	ld	[%g1+4], %f10
	fsubs	%f10, %f8, %f10
	st	%f10, [%g2]
	ld	[%g1], %f12
	ld	[%g1+4], %f10
	fadds	%f12, %f9, %f9
	fadds	%f10, %f8, %f8
	st	%f9, [%g1]
	st	%f8, [%g1+4]
	add	%g4, %i5, %g4
	add	%g2, %i4, %g2
	cmp	%i1, %g4
	bge	.L39
	 add	%g1, %i4, %g1
.L42:
	ld	[%o7-4], %f14
	ld	[%o7], %f11
	add	%i3, 2, %i3
	fnegs	%f14, %f15
	add	%o7, 8, %o7
	cmp	%i3, %g3
	bl	.L40
	 add	%o5, 8, %o5
	add	%g3, -2, %g3
	and	%g3, -2, %g3
	add	%o4, 2, %o4
	cmp	%i1, %i5
	add	%o4, %g3, %o4
	bg	.L36
	 mov	%i5, %g3
.L49:
	jmp	%i7+8
	 restore
	.size	FFT, .-FFT
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC4:
	.long	1075388922
	.long	4236968058
	.align 8
.LC5:
	.long	1071644672
	.long	0
	.section	.rodata.cst4
	.align 4
.LC6:
	.long	1065353216
	.section	.rodata.cst8
	.align 8
.LC7:
	.long	-1073741824
	.long	0
	.section	".text"
	.align 4
	.global calc_twiddle
	.type	calc_twiddle, #function
	.proc	020
calc_twiddle:
	save	%sp, -136, %sp
	st	%i2, [%fp-28]
	add	%i0, %i0, %i0
	cmp	%i0, 2
	ble	.L58
	 ld	[%fp-28], %f8
	fstod	%f8, %f10
	sethi	%hi(.LC6), %i3
	mov	2, %i5
	mov	0, %i4
	std	%f10, [%fp-16]
	or	%i3, %lo(.LC6), %i3
	sethi	%hi(.LC7), %l0
	b	.L51
	 add	%i1, 20, %i2
.L52:
	cmp	%i0, %g3
	ble	.L58
	 mov	%g3, %i5
.L51:
	st	%i5, [%fp-32]
	ld	[%fp-32], %f11
	sethi	%hi(.LC4), %g1
	fitod	%f11, %f8
	ldd	[%g1+%lo(.LC4)], %f10
	fdivd	%f10, %f8, %f8
	ldd	[%fp-16], %f10
	fmuld	%f10, %f8, %f8
	sethi	%hi(.LC5), %g1
	fdtos	%f8, %f8
	ldd	[%g1+%lo(.LC5)], %f10
	fstod	%f8, %f8
	fmuld	%f8, %f10, %f10
	std	%f8, [%fp-24]
	std	%f10, [%fp-40]
	call	sin, 0
	 ldd	[%fp-40], %o0
	ldd	[%fp-24], %f8
	std	%f0, [%fp-8]
	std	%f8, [%fp-40]
	call	sin, 0
	 ldd	[%fp-40], %o0
	add	%i4, 1, %g2
	ld	[%i3], %f8
	sll	%g2, 2, %g2
	st	%f8, [%i1+%g2]
	sll	%i4, 2, %g1
	st	%g0, [%i1+%g1]
	cmp	%i5, 1
	ble	.L52
	 add	%i5, %i5, %g3
	ldd	[%fp-8], %f10
	fdtos	%f10, %f8
	ldd	[%l0+%lo(.LC7)], %f10
	fstod	%f8, %f8
	fmuld	%f8, %f10, %f10
	fmuld	%f8, %f10, %f8
	add	%i4, 3, %o7
	add	%i5, -2, %i5
	sll	%o7, 2, %o7
	fdtos	%f8, %f8
	and	%i5, -2, %i5
	ld	[%i1+%g2], %f10
	add	%i4, %i5, %g4
	fdtos	%f0, %f0
	sll	%g4, 2, %g4
	add	%i1, %o7, %g2
	add	%i2, %g4, %g4
	ld	[%i1+%g1], %f9
.L53:
	fmuls	%f8, %f10, %f14
	fmuls	%f0, %f9, %f12
	fmuls	%f8, %f9, %f13
	fmuls	%f0, %f10, %f11
	fsubs	%f14, %f12, %f12
	fadds	%f13, %f11, %f11
	fadds	%f12, %f10, %f10
	fadds	%f9, %f11, %f9
	st	%f10, [%g2]
	st	%f9, [%g2-4]
	add	%g2, 8, %g2
	cmp	%g2, %g4
	bne	.L53
	 cmp	%i0, %g3
	add	%i4, 2, %i4
	add	%i4, %i5, %i4
	bg	.L51
	 mov	%g3, %i5
.L58:
	jmp	%i7+8
	 restore
	.size	calc_twiddle, .-calc_twiddle
	.section	.rodata.cst4
	.align 4
.LC8:
	.long	3212836864
	.section	.text.startup,"ax",@progbits
	.align 4
	.global main
	.type	main, #function
	.proc	0106
main:
	save	%sp, -96, %sp
	call	gen, 0
	 mov	1024, %i1
	call	datax, 0
	 mov	%o0, %i5
	mov	1024, %o1
	mov	%o0, %i2
	call	Bit_Reverse, 0
	 mov	%i5, %o0
	sethi	%hi(.LC8), %g1
	mov	%o0, %i0
	mov	%i2, %o1
	mov	1024, %o0
	call	calc_twiddle, 0
	 ld	[%g1+%lo(.LC8)], %o2
	call	FFT, 0
	 restore
	.size	main, .-main
	.ident	"GCC: (Buildroot 2014.08-g03a6b53) 4.7.4"
	.section	.note.GNU-stack,"",@progbits
