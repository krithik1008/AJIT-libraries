	.file	"main.c"
	.section	.text.startup,"ax",@progbits
	.align 4
	.global main
	.type	main, #function
	.proc	014
main:
	save	%sp, -128, %sp
	mov	4, %g4
	st	%g0, [%fp-28]
	st	%g0, [%fp-12]
	mov	5, %g3
	mov	6, %g2
	mov	7, %g1
	mov	1, %i3
	mov	2, %i4
	mov	3, %i5
	sth	%g0, [%fp-24]
	stb	%i3, [%fp-32]
	stb	%i4, [%fp-31]
	stb	%i5, [%fp-30]
	stb	%g4, [%fp-29]
	stb	%g3, [%fp-28]
	stb	%g2, [%fp-27]
	stb	%g1, [%fp-26]
	sth	%g0, [%fp-8]
	stb	%i3, [%fp-16]
	stb	%i4, [%fp-15]
	stb	%i5, [%fp-14]
	stb	%g4, [%fp-13]
	stb	%g3, [%fp-12]
	stb	%g2, [%fp-11]
	stb	%g1, [%fp-10]
	add	%fp, -32, %o1
	mov	1, %o2
	add	%fp, -16, %o3
	mov	1, %o4
	call	u8dot, 0
	 mov	6, %o0
	and	%o0, 0xff, %i0
	jmp	%i7+8
	 restore
	.size	main, .-main
	.ident	"GCC: (Buildroot 2014.08-g03a6b53-dirty) 4.7.4"
	.section	.note.GNU-stack,"",@progbits
