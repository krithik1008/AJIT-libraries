	.file	"fft_source.c"
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
	.ident	"GCC: (Buildroot 2014.08-g03a6b53) 4.7.4"
	.section	.note.GNU-stack,"",@progbits
