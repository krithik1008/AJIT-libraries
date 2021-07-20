	.file	"main.c"
	.section	.rodata.cst4,"aM",@progbits,4
	.align 4
.LC0:
	.long	1077516698
	.section	.text.startup,"ax",@progbits
	.align 4
	.global main
	.type	main, #function
	.proc	0106
main:
	save	%sp, -96, %sp
	call	genx, 0
	 mov	100, %i0
	call	geny, 0
	 mov	%o0, %i2
	sethi	%hi(.LC0), %g1
	mov	1, %i3
	ld	[%g1+%lo(.LC0)], %i1
	mov	%o0, %i4
	call	saxpy, 0
	 restore %g0, 1, %o5
	.size	main, .-main
	.ident	"GCC: (Buildroot 2014.08-g03a6b53-dirty) 4.7.4"
	.section	.note.GNU-stack,"",@progbits
