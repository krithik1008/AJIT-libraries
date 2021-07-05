	.file	"main.c"
	.section	".text"
	.align 4
	.global sscal
	.type	sscal, #function
	.proc	0106
sscal:
	add	%sp, -80, %sp
	st	%o1, [%sp+76]
	sll	%o0, 2, %g2
	ld	[%sp+76], %f9
	cmp	%o0, 0
	ble	.L7
	 mov	0, %g1
	ld	[%o2+%g1], %f8
.L9:
	fmuls	%f8, %f9, %f8
	st	%f8, [%o2+%g1]
	add	%g1, 4, %g1
	cmp	%g1, %g2
	bne,a	.L9
	 ld	[%o2+%g1], %f8
.L7:
	mov	%o2, %o0
	jmp	%o7+8
	 sub	%sp, -80, %sp
	.size	sscal, .-sscal
	.section	.rodata.cst4,"aM",@progbits,4
	.align 4
.LC0:
	.long	1069547520
	.section	.text.startup,"ax",@progbits
	.align 4
	.global main
	.type	main, #function
	.proc	0106
main:
	save	%sp, -96, %sp
	call	gen, 0
	 mov	1000, %i0
	sethi	%hi(.LC0), %g1
	mov	%o0, %i2
	ld	[%g1+%lo(.LC0)], %i1
	call	sscal, 0
	 restore %g0, 1, %o3
	.size	main, .-main
	.ident	"GCC: (Buildroot 2014.08-g03a6b53) 4.7.4"
	.section	.note.GNU-stack,"",@progbits
