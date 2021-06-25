	.file	"main.c"
	.section	.text.startup,"ax",@progbits
	.align 4
	.global main
	.type	main, #function
	.proc	0115
main:
	save	%sp, -496, %sp
	mov	0, %g2
	mov	0, %g1
	add	%fp, -400, %o2
	add	%fp, -200, %o4
	mov	2, %g3
.L2:
	sth	%g1, [%o2+%g2]
	sth	%g3, [%o4+%g2]
	add	%g1, 1, %g1
	cmp	%g1, 100
	bne	.L2
	 add	%g2, 2, %g2
	mov	3, %o1
	mov	1, %o3
	mov	1, %o5
	call	u16axpy, 0
	 mov	100, %o0
	jmp	%i7+8
	 restore %g0, %o0, %o0
	.size	main, .-main
	.ident	"GCC: (Buildroot 2014.08-g03a6b53-dirty) 4.7.4"
	.section	.note.GNU-stack,"",@progbits
