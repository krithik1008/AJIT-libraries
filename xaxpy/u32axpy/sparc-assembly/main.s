	.file	"main.c"
	.section	.text.startup,"ax",@progbits
	.align 4
	.global main
	.type	main, #function
	.proc	0116
main:
	save	%sp, -160, %sp
	mov	2, %g2
	st	%g2, [%fp-60]
	mov	3, %g2
	st	%g2, [%fp-56]
	mov	4, %g2
	st	%g2, [%fp-52]
	mov	5, %g2
	mov	1, %g1
	st	%g2, [%fp-48]
	mov	6, %g2
	st	%g0, [%fp-40]
	st	%g0, [%fp-36]
	st	%g1, [%fp-64]
	st	%g0, [%fp-8]
	st	%g0, [%fp-4]
	st	%g2, [%fp-44]
	st	%g1, [%fp-32]
	st	%g1, [%fp-28]
	st	%g1, [%fp-24]
	st	%g1, [%fp-20]
	st	%g1, [%fp-16]
	st	%g1, [%fp-12]
	mov	3, %o1
	add	%fp, -64, %o2
	mov	1, %o3
	add	%fp, -32, %o4
	mov	1, %o5
	call	u32axpy, 0
	 mov	6, %o0
	jmp	%i7+8
	 restore %g0, %o0, %o0
	.size	main, .-main
	.ident	"GCC: (Buildroot 2014.08-g03a6b53-dirty) 4.7.4"
	.section	.note.GNU-stack,"",@progbits
