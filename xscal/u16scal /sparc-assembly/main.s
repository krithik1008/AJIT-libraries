	.file	"main.c"
	.section	.text.startup,"ax",@progbits
	.align 4
	.global main
	.type	main, #function
	.proc	0115
main:
	save	%sp, -96, %sp
	call	gen, 0
	 mov	1000, %i0
	mov	5, %i1
	mov	%o0, %i2
	call	u16scal, 0
	 restore %g0, 1, %o3
	.size	main, .-main
	.ident	"GCC: (Buildroot 2014.08-g03a6b53) 4.7.4"
	.section	.note.GNU-stack,"",@progbits
