	.file	"main.c"
	.section	".text"
	.align 4
	.global u32scal
	.type	u32scal, #function
	.proc	0116
u32scal:
	sll	%o0, 2, %g3
	cmp	%o0, 0
	ble	.L7
	 mov	0, %g1
	ld	[%o2+%g1], %g2
.L9:
	smul	%g2, %o1, %g2
	st	%g2, [%o2+%g1]
	add	%g1, 4, %g1
	cmp	%g1, %g3
	bne,a	.L9
	 ld	[%o2+%g1], %g2
.L7:
	jmp	%o7+8
	 mov	%o2, %o0
	.size	u32scal, .-u32scal
	.section	.text.startup,"ax",@progbits
	.align 4
	.global main
	.type	main, #function
	.proc	0116
main:
	save	%sp, -96, %sp
	call	gen, 0
	 mov	1000, %i0
	mov	100, %i1
	mov	%o0, %i2
	call	u32scal, 0
	 restore %g0, 1, %o3
	.size	main, .-main
	.ident	"GCC: (Buildroot 2014.08-g03a6b53) 4.7.4"
	.section	.note.GNU-stack,"",@progbits
