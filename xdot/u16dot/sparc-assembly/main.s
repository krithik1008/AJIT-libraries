	.file	"main.c"
	.section	.text.startup,"ax",@progbits
	.align 4
	.global main
	.type	main, #function
	.proc	015
main:
	save	%sp, -128, %sp
	mov	2, %g2
	sth	%g2, [%fp-30]
	mov	3, %g2
	sth	%g2, [%fp-28]
	mov	4, %g2
	sth	%g2, [%fp-26]
	mov	5, %g2
	sth	%g2, [%fp-24]
	mov	6, %g2
	mov	1, %g1
	st	%g0, [%fp-20]
	st	%g0, [%fp-4]
	sth	%g2, [%fp-22]
	mov	7, %g2
	sth	%g1, [%fp-32]
	sth	%g1, [%fp-16]
	sth	%g2, [%fp-20]
	sth	%g1, [%fp-14]
	sth	%g1, [%fp-12]
	sth	%g1, [%fp-10]
	sth	%g1, [%fp-8]
	sth	%g1, [%fp-6]
	sth	%g1, [%fp-4]
	add	%fp, -32, %o1
	mov	1, %o2
	add	%fp, -16, %o3
	mov	1, %o4
	call	u16dot, 0
	 mov	8, %o0
	sll	%o0, 16, %i0
	srl	%i0, 16, %i0
	jmp	%i7+8
	 restore
	.size	main, .-main
	.ident	"GCC: (Buildroot 2014.08-g03a6b53-dirty) 4.7.4"
	.section	.note.GNU-stack,"",@progbits
