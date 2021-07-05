	.file	"main.c"
	.section	".text"
	.align 4
	.global u8asum
	.type	u8asum, #function
	.proc	02
u8asum:
	cmp	%o0, 0
	ble	.L2
	 mov	0, %g2
	add	%o1, %o0, %o0
	ldub	[%o1], %g1
.L9:
	add	%g1, %g2, %g3
	sub	%g2, %g1, %g2
	sll	%g1, 24, %g1
	cmp	%g1, 0
	bge,a	.L4
	 mov	%g3, %g2
.L4:
	add	%o1, 1, %o1
	cmp	%o1, %o0
	bne,a	.L9
	 ldub	[%o1], %g1
.L2:
	sll	%g2, 24, %o0
	jmp	%o7+8
	 sra	%o0, 24, %o0
	.size	u8asum, .-u8asum
	.section	.text.startup,"ax",@progbits
	.align 4
	.global main
	.type	main, #function
	.proc	02
main:
	save	%sp, -96, %sp
	call	gen, 0
	 nop
	mov	0, %g3
	mov	0, %g1
.L13:
	ldub	[%o0+%g1], %g2
	add	%g2, %g3, %i5
	sub	%g3, %g2, %g4
	sll	%g2, 24, %g2
	cmp	%g2, 0
	bge,a	.L12
	 mov	%i5, %g4
.L12:
	add	%g1, 1, %g1
	cmp	%g1, 1000
	bne	.L13
	 mov	%g4, %g3
	sll	%g4, 24, %i0
	sra	%i0, 24, %i0
	jmp	%i7+8
	 restore
	.size	main, .-main
	.ident	"GCC: (Buildroot 2014.08-g03a6b53) 4.7.4"
	.section	.note.GNU-stack,"",@progbits
