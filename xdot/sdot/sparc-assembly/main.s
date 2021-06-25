	.file	"main.c"
	.section	.rodata.cst4,"aM",@progbits,4
	.align 4
.LC0:
	.long	1073741824
	.section	.text.startup,"ax",@progbits
	.align 4
	.global main
	.type	main, #function
	.proc	06
main:
	save	%sp, -4096, %sp
	sethi	%hi(.LC0), %g4
	add	%sp, -4008, %sp
	mov	0, %g2
	mov	0, %g1
	add	%fp, -4000, %o3
	ld	[%g4+%lo(.LC0)], %f9
.L2:
	sethi	%hi(-8192), %g4
	or	%g4, 188, %g4
	add	%g4, %fp, %g4
	st	%g1, [%g4]
	ld	[%g4], %f10
	sethi	%hi(-8192), %g4
	fitos	%f10, %f8
	or	%g4, 192, %g4
	st	%f9, [%o3+%g2]
	add	%fp, %g4, %o1
	st	%f8, [%g2+%o1]
	add	%g1, 1, %g1
	cmp	%g1, 1000
	bne	.L2
	 add	%g2, 4, %g2
	mov	1000, %o0
	mov	1, %o2
	call	sdot, 0
	 mov	1, %o4
	jmp	%i7+8
	 restore
	.size	main, .-main
	.ident	"GCC: (Buildroot 2014.08-g03a6b53-dirty) 4.7.4"
	.section	.note.GNU-stack,"",@progbits
