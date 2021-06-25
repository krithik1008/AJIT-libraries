	.file	"main.c"
	.section	.text.startup,"ax",@progbits
	.align 4
	.global main
	.type	main, #function
	.proc	015
main:
	save	%sp, -4096, %sp
	mov	0, %g2
	mov	0, %g1
	add	%fp, -4000, %o1
	add	%fp, -2000, %o3
	mov	2, %g3
.L2:
	sth	%g1, [%o1+%g2]
	sth	%g3, [%o3+%g2]
	add	%g1, 1, %g1
	cmp	%g1, 1000
	bne	.L2
	 add	%g2, 2, %g2
	mov	1, %o2
	mov	1, %o4
	call	u16dot, 0
	 mov	1000, %o0
	sll	%o0, 16, %i0
	srl	%i0, 16, %i0
	jmp	%i7+8
	 restore
	.size	main, .-main
	.ident	"GCC: (Buildroot 2014.08-g03a6b53-dirty) 4.7.4"
	.section	.note.GNU-stack,"",@progbits
