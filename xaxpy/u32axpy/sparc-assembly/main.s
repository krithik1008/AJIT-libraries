	.file	"main.c"
	.section	.text.startup,"ax",@progbits
	.align 4
	.global main
	.type	main, #function
	.proc	0116
main:
	save	%sp, -4096, %sp
	mov	0, %g2
	add	%sp, -4000, %sp
	mov	0, %g1
	add	%fp, -4000, %o4
	mov	2, %g3
.L2:
	sethi	%hi(-8192), %i5
	st	%g3, [%o4+%g2]
	or	%i5, 192, %i5
	add	%fp, %i5, %o2
	st	%g1, [%g2+%o2]
	add	%g1, 1, %g1
	cmp	%g1, 1000
	bne	.L2
	 add	%g2, 4, %g2
	mov	3, %o1
	mov	1, %o3
	mov	1, %o5
	call	u32axpy, 0
	 mov	1000, %o0
	jmp	%i7+8
	 restore %g0, %o0, %o0
	.size	main, .-main
	.ident	"GCC: (Buildroot 2014.08-g03a6b53-dirty) 4.7.4"
	.section	.note.GNU-stack,"",@progbits
