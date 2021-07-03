	.file	"main.c"
	.section	.text.startup,"ax",@progbits
	.align 4
	.global main
	.type	main, #function
	.proc	015
main:
	save	%sp, -96, %sp
	call	genx, 0
	 mov	1000, %i0
	mov	%o0, %i1
	call	geny, 0
	 mov	1, %i2
	mov	1, %i4
	call	u16dot, 0
	 restore %g0, %o0, %o3
	.size	main, .-main
	.ident	"GCC: (Buildroot 2014.08-g03a6b53-dirty) 4.7.4"
	.section	.note.GNU-stack,"",@progbits
