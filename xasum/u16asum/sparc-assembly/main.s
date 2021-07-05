	.file	"main.c"
	.section	.text.startup,"ax",@progbits
	.align 4
	.global main
	.type	main, #function
	.proc	03
main:
	save	%sp, -96, %sp
	call	gen, 0
	 mov	1000, %i0
	mov	1, %i2
	call	u16asum, 0
	 restore %g0, %o0, %o1
	.size	main, .-main
	.ident	"GCC: (Buildroot 2014.08-g03a6b53) 4.7.4"
	.section	.note.GNU-stack,"",@progbits
