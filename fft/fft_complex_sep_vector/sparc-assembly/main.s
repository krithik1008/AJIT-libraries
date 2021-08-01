	.file	"main.c"
	.section	.rodata.cst4,"aM",@progbits,4
	.align 4
.LC0:
	.long	1065353216
	.align 4
.LC1:
	.long	0
	.align 4
.LC2:
	.long	2147483648
	.section	".text"
	.align 4
	.global FFT
	.type	FFT, #function
	.proc	0106
FFT:
	save	%sp, -96, %sp
	sethi	%hi(.LC1), %g4
	sethi	%hi(.LC0), %g1
	add	%i1, %i1, %i1
	ld	[%g1+%lo(.LC0)], %f21
	ld	[%g4+%lo(.LC1)], %f20
	fmovs	%f21, %f22
	sethi	%hi(.LC2), %g4
	mov	0, %o5
	ld	[%g4+%lo(.LC2)], %f23
	cmp	%i1, 2
	bg	.L11
	 mov	2, %i5
	b,a	.L19
.L4:
	cmp	%i1, %i4
	ble	.L19
	 mov	%i4, %i5
.L11:
	cmp	%i5, 1
	ble	.L4
	 add	%i5, %i5, %i4
	mov	%o5, %i3
	mov	1, %o7
.L3:
	cmp	%i1, %o7
	bl	.L7
	 mov	%o7, %g1
	add	%g1, %i5, %g4
.L18:
#APP
! 79 "main.c" 1
	sll %g4 , 2 , %g2  
	add %g2 , %i0 , %g2  
	sll %g1 , 2 , %g3  
	add %g3 , %i0 , %g3  
	ldd [%g2 + -4 ], %f10 
	 ldd [%g3 + -4 ], %f8 
	 vfmul32 %f10, %f22 , %f24 
	 fadds %f24, %f25 , %f12 
	 vfmul32 %f10, %f20 , %f24 
	 fadds %f24, %f25 , %f13 
	 vfsub32 %f8, %f12, %f10 
	 std %f10 , [ %g2 + -4 ] 
	 vfadd32 %f8, %f12, %f8 
	 std %f8 , [ %g3 + -4 ] 
	 
! 0 "" 2
#NO_APP
	add	%g1, %i4, %g1
	cmp	%i1, %g1
	bge	.L18
	 add	%g1, %i5, %g4
.L7:
	add	%i3, 8, %i3
#APP
! 108 "main.c" 1
	ldd [ %i2 + %i3 ] , %f20  
	fmovs %f21, %f22  
	fnegs %f20, %f23  
	
! 0 "" 2
#NO_APP
	add	%o7, 2, %o7
	cmp	%o7, %i5
	bl	.L3
	 cmp	%i1, %i4
	add	%i5, -2, %i5
	srl	%i5, 1, %i5
	sll	%i5, 3, %i5
	add	%o5, 8, %o5
	add	%o5, %i5, %o5
	bg	.L11
	 mov	%i4, %i5
.L19:
	jmp	%i7+8
	 restore
	.size	FFT, .-FFT
	.align 4
	.global Bit_Reverse
	.type	Bit_Reverse, #function
	.proc	0106
Bit_Reverse:
	save	%sp, -96, %sp
	sra	%i1, 1, %i5
	cmp	%i5, 0
	ble	.L52
	 sra	%i1, 2, %o7
	cmp	%i5, 1
	ble	.L47
	 mov	1, %i2
.L22:
	sll	%i1, 3, %i3
	add	%i0, 8, %i4
	add	%i0, %i3, %i3
	mov	0, %g2
	mov	0, %g4
	and	%i2, 0xff, %i2
.L23:
	cmp	%i5, %g2
	ble	.L28
	 mov	1, %g1
	mov	0, %g1
.L28:
	andcc	%g1, 0xff, %g0
	be	.L27
	 mov	%i5, %g1
	cmp	%i2, 0
	bne,a	.L49
	 sub	%g2, %g1, %g2
	b	.L48
	 add	%g4, 1, %g4
.L32:
	andcc	%g3, 0xff, %g0
	be,a	.L50
	 add	%g4, 1, %g4
	sub	%g2, %g1, %g2
.L49:
	sra	%g1, 1, %g1
	cmp	%g2, %g1
	bge	.L31
	 mov	1, %g3
	mov	0, %g3
.L31:
	andcc	%g3, 0xff, %g0
	be	.L27
	 cmp	%g1, 1
	bg	.L32
	 mov	1, %g3
	mov	0, %g3
	andcc	%g3, 0xff, %g0
	bne,a	.L49
	 sub	%g2, %g1, %g2
.L27:
	add	%g4, 1, %g4
.L48:
.L50:
	cmp	%g4, %i5
	be	.L52
	 add	%g2, %g1, %g2
	cmp	%g2, %g4
	ble,a	.L51
	 add	%i3, -8, %i3
	sll	%g2, 3, %g1
	ldd	[%i4], %f8
	ldd	[%i0+%g1], %f10
	std	%f8, [%i0+%g1]
	srl	%g2, 31, %g1
	add	%g1, %g2, %g1
	sra	%g1, 1, %g1
	cmp	%o7, %g1
	ble	.L25
	 std	%f10, [%i4]
	ldd	[%i3-16], %f10
	xnor	%g0, %g2, %g1
	add	%g1, %i1, %g1
	sll	%g1, 3, %g1
	ldd	[%i0+%g1], %f8
	std	%f8, [%i3-16]
	std	%f10, [%i0+%g1]
.L25:
	add	%i3, -8, %i3
.L51:
	b	.L23
	 add	%i4, 8, %i4
.L52:
	jmp	%i7+8
	 restore
.L47:
	b	.L22
	 mov	0, %i2
	.size	Bit_Reverse, .-Bit_Reverse
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
	ble	.L61
	 ld	[%fp-28], %f8
	fstod	%f8, %f10
	sethi	%hi(.LC6), %i3
	mov	2, %i5
	mov	0, %i4
	std	%f10, [%fp-16]
	or	%i3, %lo(.LC6), %i3
	sethi	%hi(.LC7), %l0
	b	.L54
	 add	%i1, 20, %i2
.L55:
	cmp	%i0, %g3
	ble	.L61
	 mov	%g3, %i5
.L54:
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
	ble	.L55
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
.L56:
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
	bne	.L56
	 cmp	%i0, %g3
	add	%i4, 2, %i4
	add	%i4, %i5, %i4
	bg	.L54
	 mov	%g3, %i5
.L61:
	jmp	%i7+8
	 restore
	.size	calc_twiddle, .-calc_twiddle
	.section	.text.startup,"ax",@progbits
	.align 4
	.global main
	.type	main, #function
	.proc	0106
main:
	save	%sp, -96, %sp
	call	gen, 0
	 mov	512, %i1
	call	datax, 0
	 mov	%o0, %i0
	call	FFT, 0
	 restore %g0, %o0, %o2
	.size	main, .-main
	.ident	"GCC: (Buildroot 2014.08-g03a6b53) 4.7.4"
	.section	.note.GNU-stack,"",@progbits
