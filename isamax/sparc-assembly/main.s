	.file	"main.c"
	.section	.text.startup,"ax",@progbits
	.align 4
	.global main
	.type	main, #function
	.proc	04
main:
	save	%sp, -4096, %sp
	mov	0, %g1
	add	%sp, -8, %sp
	add	%fp, -4000, %o1
.L2:
	st	%g1, [%fp-4004]
	sll	%g1, 2, %g2
	ld	[%fp-4004], %f9
	fitos	%f9, %f8
	add	%g1, 1, %g1
	cmp	%g1, 1000
	bne	.L2
	 st	%f8, [%o1+%g2]
	mov	1, %o2
	call	isamax, 0
	 mov	1000, %o0
	jmp	%i7+8
	 restore %g0, %o0, %o0
	.size	main, .-main
	.ident	"GCC: (Buildroot 2014.08-g03a6b53-dirty) 4.7.4"
	.section	.note.GNU-stack,"",@progbits
