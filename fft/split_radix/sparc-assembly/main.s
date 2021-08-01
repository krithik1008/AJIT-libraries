	.file	"main.c"
	.section	".rodata"
	.align 8
.LC1:
	.long	1075388923
	.long	1067900668
	.align 4
.LC2:
	.long	1077936128
	.section	".text"
	.align 4
	.global fft_compute_split_twiddle
	.type	fft_compute_split_twiddle, #function
	.proc	020
fft_compute_split_twiddle:
	save	%sp, -136, %sp
	st	%i0, [%fp+68]
	st	%i1, [%fp+72]
	ld	[%fp+72], %g1
	sra	%g1, 3, %g1
	st	%g1, [%fp-12]
	ld	[%fp+72], %g1
	st	%g1, [%fp-28]
	ld	[%fp-28], %f10
	fitod	%f10, %f8
	sethi	%hi(.LC1), %g1
	or	%g1, %lo(.LC1), %g1
	ldd	[%g1], %f10
	fdivd	%f10, %f8, %f8
	fdtos	%f8, %f8
	st	%f8, [%fp-16]
	ld	[%fp-16], %f8
	st	%f8, [%fp-8]
	mov	2, %g1
	st	%g1, [%fp-4]
	b	.L2
	 nop
.L3:
	ld	[%fp-8], %f9
	sethi	%hi(.LC2), %g1
	or	%g1, %lo(.LC2), %g1
	ld	[%g1], %f8
	fmuls	%f9, %f8, %f8
	st	%f8, [%fp-20]
	ld	[%fp-4], %g1
	add	%g1, -1, %i5
	ld	[%fp-8], %f8
	fstod	%f8, %f8
	std	%f8, [%fp-40]
	ldd	[%fp-40], %o0
	call	cos, 0
	 nop
	fmovs	%f0, %f8
	fmovs	%f1, %f9
	fdtos	%f8, %f8
	ld	[%fp+68], %g2
	sll	%i5, 2, %g1
	st	%f8, [%g2+%g1]
	ld	[%fp+68], %g1
	add	%g1, 8, %i5
	ld	[%fp-4], %g1
	add	%g1, -1, %i4
	ld	[%fp-8], %f8
	fstod	%f8, %f8
	std	%f8, [%fp-40]
	ldd	[%fp-40], %o0
	call	sin, 0
	 nop
	fmovs	%f0, %f8
	fmovs	%f1, %f9
	fdtos	%f8, %f8
	sll	%i4, 2, %g1
	st	%f8, [%i5+%g1]
	ld	[%fp+68], %g1
	add	%g1, 16, %i5
	ld	[%fp-4], %g1
	add	%g1, -1, %i4
	ld	[%fp-20], %f8
	fstod	%f8, %f8
	std	%f8, [%fp-40]
	ldd	[%fp-40], %o0
	call	cos, 0
	 nop
	fmovs	%f0, %f8
	fmovs	%f1, %f9
	fdtos	%f8, %f8
	sll	%i4, 2, %g1
	st	%f8, [%i5+%g1]
	ld	[%fp+68], %g1
	add	%g1, 24, %i5
	ld	[%fp-4], %g1
	add	%g1, -1, %i4
	ld	[%fp-20], %f8
	fstod	%f8, %f8
	std	%f8, [%fp-40]
	ldd	[%fp-40], %o0
	call	sin, 0
	 nop
	fmovs	%f0, %f8
	fmovs	%f1, %f9
	fdtos	%f8, %f8
	sll	%i4, 2, %g1
	st	%f8, [%i5+%g1]
	ld	[%fp-4], %g1
	st	%g1, [%fp-28]
	ld	[%fp-28], %f8
	fitos	%f8, %f9
	ld	[%fp-16], %f8
	fmuls	%f9, %f8, %f8
	st	%f8, [%fp-8]
	ld	[%fp-4], %g1
	add	%g1, 1, %g1
	st	%g1, [%fp-4]
.L2:
	ld	[%fp-4], %g2
	ld	[%fp-12], %g1
	cmp	%g2, %g1
	ble	.L3
	 nop
	restore
	jmp	%o7+8
	 nop
	.size	fft_compute_split_twiddle, .-fft_compute_split_twiddle
	.section	".rodata"
	.align 4
.LC3:
	.long	1068827886
	.section	".text"
	.align 4
	.global realfft_split
	.type	realfft_split, #function
	.proc	020
realfft_split:
	save	%sp, -216, %sp
	st	%i0, [%fp+68]
	st	%i1, [%fp+72]
	st	%i2, [%fp+76]
	sethi	%hi(.LC3), %g1
	or	%g1, %lo(.LC3), %g1
	ld	[%g1], %f8
	st	%f8, [%fp-32]
	ld	[%fp+72], %g1
	add	%g1, -1, %g1
	st	%g1, [%fp-36]
	st	%g0, [%fp-4]
	st	%g0, [%fp-8]
	ld	[%fp+72], %g1
	srl	%g1, 31, %g2
	add	%g2, %g1, %g1
	sra	%g1, 1, %g1
	st	%g1, [%fp-28]
	b	.L5
	 nop
.L9:
	ld	[%fp-4], %g2
	ld	[%fp-8], %g1
	cmp	%g2, %g1
	bge	.L6
	 nop
	ld	[%fp-8], %g1
	sll	%g1, 2, %g1
	ld	[%fp+68], %g2
	add	%g2, %g1, %g1
	ld	[%g1], %f8
	st	%f8, [%fp-40]
	ld	[%fp-8], %g1
	sll	%g1, 2, %g1
	ld	[%fp+68], %g2
	add	%g2, %g1, %g1
	ld	[%fp-4], %g2
	sll	%g2, 2, %g2
	ld	[%fp+68], %g3
	add	%g3, %g2, %g2
	ld	[%g2], %f8
	st	%f8, [%g1]
	ld	[%fp-4], %g1
	sll	%g1, 2, %g1
	ld	[%fp+68], %g2
	add	%g2, %g1, %g1
	ld	[%fp-40], %f8
	st	%f8, [%g1]
.L6:
	ld	[%fp-28], %g1
	st	%g1, [%fp-12]
	b	.L7
	 nop
.L8:
	ld	[%fp-8], %g2
	ld	[%fp-12], %g1
	sub	%g2, %g1, %g1
	st	%g1, [%fp-8]
	ld	[%fp-12], %g1
	sra	%g1, 1, %g1
	st	%g1, [%fp-12]
.L7:
	ld	[%fp-12], %g2
	ld	[%fp-8], %g1
	cmp	%g2, %g1
	ble	.L8
	 nop
	ld	[%fp-8], %g2
	ld	[%fp-12], %g1
	add	%g2, %g1, %g1
	st	%g1, [%fp-8]
	ld	[%fp-4], %g1
	add	%g1, 1, %g1
	st	%g1, [%fp-4]
.L5:
	ld	[%fp-4], %g2
	ld	[%fp-36], %g1
	cmp	%g2, %g1
	bl	.L9
	 nop
	st	%g0, [%fp-16]
	mov	4, %g1
	st	%g1, [%fp-20]
	b	.L10
	 nop
.L11:
	ld	[%fp-16], %g1
	add	%g1, 1, %g1
	st	%g1, [%fp-24]
	ld	[%fp-16], %g1
	sll	%g1, 2, %g1
	ld	[%fp+68], %g2
	add	%g2, %g1, %g1
	ld	[%g1], %f8
	st	%f8, [%fp-40]
	ld	[%fp-16], %g1
	sll	%g1, 2, %g1
	ld	[%fp+68], %g2
	add	%g2, %g1, %g1
	ld	[%fp-24], %g2
	sll	%g2, 2, %g2
	ld	[%fp+68], %g3
	add	%g3, %g2, %g2
	ld	[%g2], %f9
	ld	[%fp-40], %f8
	fadds	%f9, %f8, %f8
	st	%f8, [%g1]
	ld	[%fp-24], %g1
	sll	%g1, 2, %g1
	ld	[%fp+68], %g2
	add	%g2, %g1, %g1
	ld	[%fp-24], %g2
	sll	%g2, 2, %g2
	ld	[%fp+68], %g3
	add	%g3, %g2, %g2
	ld	[%g2], %f8
	ld	[%fp-40], %f9
	fsubs	%f9, %f8, %f8
	st	%f8, [%g1]
	ld	[%fp-16], %g2
	ld	[%fp-20], %g1
	add	%g2, %g1, %g1
	st	%g1, [%fp-16]
.L10:
	ld	[%fp-16], %g2
	ld	[%fp-36], %g1
	cmp	%g2, %g1
	bl	.L11
	 nop
	ld	[%fp-20], %g1
	add	%g1, %g1, %g1
	st	%g1, [%fp-20]
	ld	[%fp-20], %g1
	add	%g1, -2, %g1
	st	%g1, [%fp-16]
	ld	[%fp-20], %g1
	add	%g1, %g1, %g1
	st	%g1, [%fp-20]
	ld	[%fp-16], %g2
	ld	[%fp-36], %g1
	cmp	%g2, %g1
	bl	.L10
	 nop
	mov	2, %g1
	st	%g1, [%fp-28]
	ld	[%fp+72], %g1
	st	%g1, [%fp-12]
	b	.L13
	 nop
.L23:
	ld	[%fp-28], %g1
	add	%g1, %g1, %g1
	st	%g1, [%fp-28]
	ld	[%fp-28], %g1
	sra	%g1, 2, %g1
	st	%g1, [%fp-36]
	ld	[%fp-28], %g1
	sra	%g1, 3, %g1
	st	%g1, [%fp-44]
	ld	[%fp+72], %g1
	sra	%g1, 31, %g2
	wr	%g2, 0, %y
	ld	[%fp-28], %g2
	nop
	nop
	sdiv	%g1, %g2, %g1
	st	%g1, [%fp-48]
	st	%g0, [%fp-24]
	ld	[%fp-28], %g1
	add	%g1, %g1, %g1
	st	%g1, [%fp-20]
	b	.L14
	 nop
.L16:
	ld	[%fp-24], %g2
	ld	[%fp-36], %g1
	add	%g2, %g1, %g1
	st	%g1, [%fp-52]
	ld	[%fp-52], %g2
	ld	[%fp-36], %g1
	add	%g2, %g1, %g1
	st	%g1, [%fp-56]
	ld	[%fp-56], %g2
	ld	[%fp-36], %g1
	add	%g2, %g1, %g1
	st	%g1, [%fp-60]
	ld	[%fp-60], %g1
	sll	%g1, 2, %g1
	ld	[%fp+68], %g2
	add	%g2, %g1, %g1
	ld	[%g1], %f9
	ld	[%fp-56], %g1
	sll	%g1, 2, %g1
	ld	[%fp+68], %g2
	add	%g2, %g1, %g1
	ld	[%g1], %f8
	fadds	%f9, %f8, %f8
	st	%f8, [%fp-40]
	ld	[%fp-60], %g1
	sll	%g1, 2, %g1
	ld	[%fp+68], %g2
	add	%g2, %g1, %g1
	ld	[%fp-60], %g2
	sll	%g2, 2, %g2
	ld	[%fp+68], %g3
	add	%g3, %g2, %g2
	ld	[%g2], %f9
	ld	[%fp-56], %g2
	sll	%g2, 2, %g2
	ld	[%fp+68], %g3
	add	%g3, %g2, %g2
	ld	[%g2], %f8
	fsubs	%f9, %f8, %f8
	st	%f8, [%g1]
	ld	[%fp-56], %g1
	sll	%g1, 2, %g1
	ld	[%fp+68], %g2
	add	%g2, %g1, %g1
	ld	[%fp-24], %g2
	sll	%g2, 2, %g2
	ld	[%fp+68], %g3
	add	%g3, %g2, %g2
	ld	[%g2], %f9
	ld	[%fp-40], %f8
	fsubs	%f9, %f8, %f8
	st	%f8, [%g1]
	ld	[%fp-24], %g1
	sll	%g1, 2, %g1
	ld	[%fp+68], %g2
	add	%g2, %g1, %g1
	ld	[%fp-24], %g2
	sll	%g2, 2, %g2
	ld	[%fp+68], %g3
	add	%g3, %g2, %g2
	ld	[%g2], %f9
	ld	[%fp-40], %f8
	fadds	%f9, %f8, %f8
	st	%f8, [%g1]
	ld	[%fp-36], %g1
	cmp	%g1, 1
	be	.L15
	 nop
	ld	[%fp-24], %g2
	ld	[%fp-44], %g1
	add	%g2, %g1, %g1
	st	%g1, [%fp-16]
	ld	[%fp-52], %g2
	ld	[%fp-44], %g1
	add	%g2, %g1, %g1
	st	%g1, [%fp-52]
	ld	[%fp-56], %g2
	ld	[%fp-44], %g1
	add	%g2, %g1, %g1
	st	%g1, [%fp-56]
	ld	[%fp-60], %g2
	ld	[%fp-44], %g1
	add	%g2, %g1, %g1
	st	%g1, [%fp-60]
	ld	[%fp-56], %g1
	sll	%g1, 2, %g1
	ld	[%fp+68], %g2
	add	%g2, %g1, %g1
	ld	[%g1], %f9
	ld	[%fp-60], %g1
	sll	%g1, 2, %g1
	ld	[%fp+68], %g2
	add	%g2, %g1, %g1
	ld	[%g1], %f8
	fadds	%f9, %f8, %f9
	ld	[%fp-32], %f8
	fdivs	%f9, %f8, %f8
	st	%f8, [%fp-40]
	ld	[%fp-56], %g1
	sll	%g1, 2, %g1
	ld	[%fp+68], %g2
	add	%g2, %g1, %g1
	ld	[%g1], %f9
	ld	[%fp-60], %g1
	sll	%g1, 2, %g1
	ld	[%fp+68], %g2
	add	%g2, %g1, %g1
	ld	[%g1], %f8
	fsubs	%f9, %f8, %f9
	ld	[%fp-32], %f8
	fdivs	%f9, %f8, %f8
	st	%f8, [%fp-64]
	ld	[%fp-60], %g1
	sll	%g1, 2, %g1
	ld	[%fp+68], %g2
	add	%g2, %g1, %g1
	ld	[%fp-52], %g2
	sll	%g2, 2, %g2
	ld	[%fp+68], %g3
	add	%g3, %g2, %g2
	ld	[%g2], %f9
	ld	[%fp-40], %f8
	fsubs	%f9, %f8, %f8
	st	%f8, [%g1]
	ld	[%fp-56], %g1
	sll	%g1, 2, %g1
	ld	[%fp+68], %g2
	add	%g2, %g1, %g1
	ld	[%fp-52], %g2
	sll	%g2, 2, %g2
	ld	[%fp+68], %g3
	add	%g3, %g2, %g2
	ld	[%g2], %f8
	fnegs	%f8, %f9
	ld	[%fp-40], %f8
	fsubs	%f9, %f8, %f8
	st	%f8, [%g1]
	ld	[%fp-52], %g1
	sll	%g1, 2, %g1
	ld	[%fp+68], %g2
	add	%g2, %g1, %g1
	ld	[%fp-16], %g2
	sll	%g2, 2, %g2
	ld	[%fp+68], %g3
	add	%g3, %g2, %g2
	ld	[%g2], %f9
	ld	[%fp-64], %f8
	fsubs	%f9, %f8, %f8
	st	%f8, [%g1]
	ld	[%fp-16], %g1
	sll	%g1, 2, %g1
	ld	[%fp+68], %g2
	add	%g2, %g1, %g1
	ld	[%fp-16], %g2
	sll	%g2, 2, %g2
	ld	[%fp+68], %g3
	add	%g3, %g2, %g2
	ld	[%g2], %f9
	ld	[%fp-64], %f8
	fadds	%f9, %f8, %f8
	st	%f8, [%g1]
.L15:
	ld	[%fp-24], %g2
	ld	[%fp-20], %g1
	add	%g2, %g1, %g1
	st	%g1, [%fp-24]
.L14:
	ld	[%fp-24], %g2
	ld	[%fp+72], %g1
	cmp	%g2, %g1
	bl	.L16
	 nop
	ld	[%fp-20], %g1
	add	%g1, %g1, %g1
	st	%g1, [%fp-20]
	ld	[%fp-20], %g2
	ld	[%fp-28], %g1
	sub	%g2, %g1, %g1
	st	%g1, [%fp-24]
	ld	[%fp-20], %g1
	add	%g1, %g1, %g1
	st	%g1, [%fp-20]
	ld	[%fp-24], %g2
	ld	[%fp+72], %g1
	cmp	%g2, %g1
	bl	.L14
	 nop
	mov	2, %g1
	st	%g1, [%fp-8]
	b	.L18
	 nop
.L22:
	ld	[%fp-8], %g1
	add	%g1, -1, %g2
	ld	[%fp-48], %g1
	smul	%g2, %g1, %g1
	st	%g1, [%fp-68]
	ld	[%fp+76], %g2
	ld	[%fp-68], %g1
	sll	%g1, 2, %g1
	ld	[%g2+%g1], %f8
	st	%f8, [%fp-72]
	ld	[%fp+76], %g1
	add	%g1, 8, %g2
	ld	[%fp-68], %g1
	sll	%g1, 2, %g1
	ld	[%g2+%g1], %f8
	st	%f8, [%fp-76]
	ld	[%fp+76], %g1
	add	%g1, 16, %g2
	ld	[%fp-68], %g1
	sll	%g1, 2, %g1
	ld	[%g2+%g1], %f8
	st	%f8, [%fp-80]
	ld	[%fp+76], %g1
	add	%g1, 24, %g2
	ld	[%fp-68], %g1
	sll	%g1, 2, %g1
	ld	[%g2+%g1], %f8
	st	%f8, [%fp-84]
	st	%g0, [%fp-4]
	ld	[%fp-28], %g1
	add	%g1, %g1, %g1
	st	%g1, [%fp-20]
	b	.L19
	 nop
.L20:
	ld	[%fp-4], %g2
	ld	[%fp-8], %g1
	add	%g2, %g1, %g1
	add	%g1, -1, %g1
	st	%g1, [%fp-24]
	ld	[%fp-24], %g2
	ld	[%fp-36], %g1
	add	%g2, %g1, %g1
	st	%g1, [%fp-52]
	ld	[%fp-52], %g2
	ld	[%fp-36], %g1
	add	%g2, %g1, %g1
	st	%g1, [%fp-56]
	ld	[%fp-56], %g2
	ld	[%fp-36], %g1
	add	%g2, %g1, %g1
	st	%g1, [%fp-60]
	ld	[%fp-4], %g2
	ld	[%fp-36], %g1
	add	%g2, %g1, %g2
	ld	[%fp-8], %g1
	sub	%g2, %g1, %g1
	add	%g1, 1, %g1
	st	%g1, [%fp-88]
	ld	[%fp-88], %g2
	ld	[%fp-36], %g1
	add	%g2, %g1, %g1
	st	%g1, [%fp-92]
	ld	[%fp-92], %g2
	ld	[%fp-36], %g1
	add	%g2, %g1, %g1
	st	%g1, [%fp-96]
	ld	[%fp-96], %g2
	ld	[%fp-36], %g1
	add	%g2, %g1, %g1
	st	%g1, [%fp-100]
	ld	[%fp-56], %g1
	sll	%g1, 2, %g1
	ld	[%fp+68], %g2
	add	%g2, %g1, %g1
	ld	[%g1], %f9
	ld	[%fp-72], %f8
	fmuls	%f9, %f8, %f9
	ld	[%fp-96], %g1
	sll	%g1, 2, %g1
	ld	[%fp+68], %g2
	add	%g2, %g1, %g1
	ld	[%g1], %f10
	ld	[%fp-76], %f8
	fmuls	%f10, %f8, %f8
	fadds	%f9, %f8, %f8
	st	%f8, [%fp-40]
	ld	[%fp-96], %g1
	sll	%g1, 2, %g1
	ld	[%fp+68], %g2
	add	%g2, %g1, %g1
	ld	[%g1], %f9
	ld	[%fp-72], %f8
	fmuls	%f9, %f8, %f9
	ld	[%fp-56], %g1
	sll	%g1, 2, %g1
	ld	[%fp+68], %g2
	add	%g2, %g1, %g1
	ld	[%g1], %f10
	ld	[%fp-76], %f8
	fmuls	%f10, %f8, %f8
	fsubs	%f9, %f8, %f8
	st	%f8, [%fp-64]
	ld	[%fp-60], %g1
	sll	%g1, 2, %g1
	ld	[%fp+68], %g2
	add	%g2, %g1, %g1
	ld	[%g1], %f9
	ld	[%fp-80], %f8
	fmuls	%f9, %f8, %f9
	ld	[%fp-100], %g1
	sll	%g1, 2, %g1
	ld	[%fp+68], %g2
	add	%g2, %g1, %g1
	ld	[%g1], %f10
	ld	[%fp-84], %f8
	fmuls	%f10, %f8, %f8
	fadds	%f9, %f8, %f8
	st	%f8, [%fp-104]
	ld	[%fp-100], %g1
	sll	%g1, 2, %g1
	ld	[%fp+68], %g2
	add	%g2, %g1, %g1
	ld	[%g1], %f9
	ld	[%fp-80], %f8
	fmuls	%f9, %f8, %f9
	ld	[%fp-60], %g1
	sll	%g1, 2, %g1
	ld	[%fp+68], %g2
	add	%g2, %g1, %g1
	ld	[%g1], %f10
	ld	[%fp-84], %f8
	fmuls	%f10, %f8, %f8
	fsubs	%f9, %f8, %f8
	st	%f8, [%fp-108]
	ld	[%fp-40], %f9
	ld	[%fp-104], %f8
	fadds	%f9, %f8, %f8
	st	%f8, [%fp-112]
	ld	[%fp-64], %f9
	ld	[%fp-108], %f8
	fadds	%f9, %f8, %f8
	st	%f8, [%fp-116]
	ld	[%fp-40], %f9
	ld	[%fp-104], %f8
	fsubs	%f9, %f8, %f8
	st	%f8, [%fp-104]
	ld	[%fp-64], %f9
	ld	[%fp-108], %f8
	fsubs	%f9, %f8, %f8
	st	%f8, [%fp-108]
	ld	[%fp-92], %g1
	sll	%g1, 2, %g1
	ld	[%fp+68], %g2
	add	%g2, %g1, %g1
	ld	[%g1], %f9
	ld	[%fp-116], %f8
	fadds	%f9, %f8, %f8
	st	%f8, [%fp-64]
	ld	[%fp-56], %g1
	sll	%g1, 2, %g1
	ld	[%fp+68], %g2
	add	%g2, %g1, %g1
	ld	[%fp-92], %g2
	sll	%g2, 2, %g2
	ld	[%fp+68], %g3
	add	%g3, %g2, %g2
	ld	[%g2], %f8
	ld	[%fp-116], %f9
	fsubs	%f9, %f8, %f8
	st	%f8, [%g1]
	ld	[%fp-100], %g1
	sll	%g1, 2, %g1
	ld	[%fp+68], %g2
	add	%g2, %g1, %g1
	ld	[%fp-64], %f8
	st	%f8, [%g1]
	ld	[%fp-52], %g1
	sll	%g1, 2, %g1
	ld	[%fp+68], %g2
	add	%g2, %g1, %g1
	ld	[%g1], %f9
	ld	[%fp-104], %f8
	fsubs	%f9, %f8, %f8
	st	%f8, [%fp-64]
	ld	[%fp-96], %g1
	sll	%g1, 2, %g1
	ld	[%fp+68], %g2
	add	%g2, %g1, %g1
	ld	[%fp-52], %g2
	sll	%g2, 2, %g2
	ld	[%fp+68], %g3
	add	%g3, %g2, %g2
	ld	[%g2], %f8
	fnegs	%f8, %f9
	ld	[%fp-104], %f8
	fsubs	%f9, %f8, %f8
	st	%f8, [%g1]
	ld	[%fp-60], %g1
	sll	%g1, 2, %g1
	ld	[%fp+68], %g2
	add	%g2, %g1, %g1
	ld	[%fp-64], %f8
	st	%f8, [%g1]
	ld	[%fp-24], %g1
	sll	%g1, 2, %g1
	ld	[%fp+68], %g2
	add	%g2, %g1, %g1
	ld	[%g1], %f9
	ld	[%fp-112], %f8
	fadds	%f9, %f8, %f8
	st	%f8, [%fp-40]
	ld	[%fp-92], %g1
	sll	%g1, 2, %g1
	ld	[%fp+68], %g2
	add	%g2, %g1, %g1
	ld	[%fp-24], %g2
	sll	%g2, 2, %g2
	ld	[%fp+68], %g3
	add	%g3, %g2, %g2
	ld	[%g2], %f9
	ld	[%fp-112], %f8
	fsubs	%f9, %f8, %f8
	st	%f8, [%g1]
	ld	[%fp-24], %g1
	sll	%g1, 2, %g1
	ld	[%fp+68], %g2
	add	%g2, %g1, %g1
	ld	[%fp-40], %f8
	st	%f8, [%g1]
	ld	[%fp-88], %g1
	sll	%g1, 2, %g1
	ld	[%fp+68], %g2
	add	%g2, %g1, %g1
	ld	[%g1], %f9
	ld	[%fp-108], %f8
	fadds	%f9, %f8, %f8
	st	%f8, [%fp-40]
	ld	[%fp-88], %g1
	sll	%g1, 2, %g1
	ld	[%fp+68], %g2
	add	%g2, %g1, %g1
	ld	[%fp-88], %g2
	sll	%g2, 2, %g2
	ld	[%fp+68], %g3
	add	%g3, %g2, %g2
	ld	[%g2], %f9
	ld	[%fp-108], %f8
	fsubs	%f9, %f8, %f8
	st	%f8, [%g1]
	ld	[%fp-52], %g1
	sll	%g1, 2, %g1
	ld	[%fp+68], %g2
	add	%g2, %g1, %g1
	ld	[%fp-40], %f8
	st	%f8, [%g1]
	ld	[%fp-4], %g2
	ld	[%fp-20], %g1
	add	%g2, %g1, %g1
	st	%g1, [%fp-4]
.L19:
	ld	[%fp-4], %g2
	ld	[%fp+72], %g1
	cmp	%g2, %g1
	bl	.L20
	 nop
	ld	[%fp-20], %g1
	add	%g1, %g1, %g1
	st	%g1, [%fp-20]
	ld	[%fp-20], %g2
	ld	[%fp-28], %g1
	sub	%g2, %g1, %g1
	st	%g1, [%fp-4]
	ld	[%fp-20], %g1
	add	%g1, %g1, %g1
	st	%g1, [%fp-20]
	ld	[%fp-4], %g2
	ld	[%fp+72], %g1
	cmp	%g2, %g1
	bl	.L19
	 nop
	ld	[%fp-8], %g1
	add	%g1, 1, %g1
	st	%g1, [%fp-8]
.L18:
	ld	[%fp-8], %g2
	ld	[%fp-44], %g1
	cmp	%g2, %g1
	ble	.L22
	 nop
	ld	[%fp-12], %g1
	sra	%g1, 1, %g1
	st	%g1, [%fp-12]
.L13:
	ld	[%fp-12], %g1
	cmp	%g1, 2
	bg	.L23
	 nop
	restore
	jmp	%o7+8
	 nop
	.size	realfft_split, .-realfft_split
	.section	".rodata"
	.align 4
.LC0:
	.long	0
	.long	0
	.long	0
	.long	0
	.long	1065353216
	.long	1065353216
	.long	1065353216
	.long	1065353216
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.align 4
.LC4:
	.long	0
	.section	".text"
	.align 4
	.global main
	.type	main, #function
	.proc	0106
main:
	save	%sp, -280, %sp
	mov	16, %g1
	st	%g1, [%fp-12]
	add	%fp, -44, %g1
	mov	%g1, %o0
	mov	16, %o1
	call	fft_compute_split_twiddle, 0
	 nop
	sethi	%hi(.LC0), %g1
	or	%g1, %lo(.LC0), %g1
	add	%fp, -108, %g3
	mov	%g1, %g2
	mov	64, %g1
	mov	%g3, %o0
	mov	%g2, %o1
	mov	%g1, %o2
	call	memcpy, 0
	 nop
	add	%fp, -108, %g2
	add	%fp, -44, %g1
	mov	%g2, %o0
	mov	16, %o1
	mov	%g1, %o2
	call	realfft_split, 0
	 nop
	st	%g0, [%fp-4]
	st	%g0, [%fp-8]
	ld	[%fp-108], %f8
	st	%f8, [%fp-180]
	sethi	%hi(.LC4), %g1
	or	%g1, %lo(.LC4), %g1
	ld	[%g1], %f8
	st	%f8, [%fp-176]
	mov	2, %g1
	st	%g1, [%fp-4]
	mov	1, %g1
	st	%g1, [%fp-8]
	b	.L25
	 nop
.L26:
	ld	[%fp-8], %g1
	sll	%g1, 2, %g1
	add	%fp, %g1, %g1
	ld	[%g1-108], %f8
	ld	[%fp-4], %g1
	sll	%g1, 2, %g1
	add	%fp, %g1, %g1
	st	%f8, [%g1-180]
	ld	[%fp-4], %g1
	add	%g1, 1, %g1
	ld	[%fp-12], %g3
	ld	[%fp-8], %g2
	sub	%g3, %g2, %g2
	sll	%g2, 2, %g2
	add	%fp, %g2, %g2
	ld	[%g2-108], %f8
	sll	%g1, 2, %g1
	add	%fp, %g1, %g1
	st	%f8, [%g1-180]
	ld	[%fp-4], %g1
	add	%g1, 2, %g1
	st	%g1, [%fp-4]
	ld	[%fp-8], %g1
	add	%g1, 1, %g1
	st	%g1, [%fp-8]
.L25:
	ld	[%fp-4], %g2
	ld	[%fp-12], %g1
	cmp	%g2, %g1
	ble	.L26
	 nop
	add	%fp, -180, %g1
	mov	%g1, %i0
	restore
	jmp	%o7+8
	 nop
	.size	main, .-main
	.ident	"GCC: (Buildroot 2014.08-g03a6b53) 4.7.4"
	.section	.note.GNU-stack,"",@progbits
