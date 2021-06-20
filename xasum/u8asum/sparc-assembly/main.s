	.file	"main.c"
	.section	.text.startup,"ax",@progbits
	.align 4
	.global main
	.type	main, #function
	.proc	03
main:
	save	%sp, -128, %sp
	mov	-1, %g1
	stb	%g0, [%fp-32]
	stb	%g1, [%fp-31]
	stb	%g1, [%fp-30]
	stb	%g1, [%fp-29]
	add	%fp, -28, %g2
	mov	0, %g1
	mov	-1, %g3
.L5:
	st	%g3, [%g2]
	add	%g1, 1, %g1
	cmp	%g1, 4
	bleu	.L5
	 add	%g2, 4, %g2
	add	%fp, -32, %o1
	mov	1, %o2
	call	u8asum, 0
	 mov	24, %o0
	sll	%o0, 16, %i0
	sra	%i0, 16, %i0
	jmp	%i7+8
	 restore
	.size	main, .-main
	.ident	"GCC: (Buildroot 2014.08-g03a6b53) 4.7.4"
	.section	.note.GNU-stack,"",@progbits
