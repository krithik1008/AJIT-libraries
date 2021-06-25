	.file	"main.c"
	.section	.rodata.cst4,"aM",@progbits,4
	.align 4
.LC0:
	.long	1073741824
	.align 4
.LC1:
	.long	1066192077
	.section	.text.startup,"ax",@progbits
	.align 4
	.global main
	.type	main, #function
	.proc	0106
main:
	save	%sp, -904, %sp
	sethi	%hi(.LC0), %g3
	mov	0, %g2
	mov	0, %g1
	add	%fp, -800, %o2
	add	%fp, -400, %o4
	ld	[%g3+%lo(.LC0)], %f9
.L2:
	st	%g1, [%fp-804]
	ld	[%fp-804], %f10
	st	%f9, [%o4+%g2]
	fitos	%f10, %f8
	st	%f8, [%o2+%g2]
	add	%g1, 1, %g1
	cmp	%g1, 100
	bne	.L2
	 add	%g2, 4, %g2
	sethi	%hi(.LC1), %g1
	mov	1, %o3
	ld	[%g1+%lo(.LC1)], %o1
	mov	1, %o5
	call	saxpy, 0
	 mov	100, %o0
	jmp	%i7+8
	 restore %g0, %o0, %o0
	.size	main, .-main
	.ident	"GCC: (Buildroot 2014.08-g03a6b53-dirty) 4.7.4"
	.section	.note.GNU-stack,"",@progbits
