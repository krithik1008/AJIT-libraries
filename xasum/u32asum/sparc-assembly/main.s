	.file	"main.c"
	.section	".text"
	.align 4
	.global u32asum
	.type	u32asum, #function
	.proc	04
u32asum:
	cmp	%o0, 0
	ble	.L6
	 sll	%o0, 2, %g4
	mov	0, %g1
	mov	0, %o0
	ld	[%o1+%g1], %g2
.L9:
	add	%o0, %g2, %g3
	cmp	%g2, 0
	bl	.L4
	 sub	%o0, %g2, %o0
	mov	%g3, %o0
.L4:
	add	%g1, 4, %g1
	cmp	%g1, %g4
	bne,a	.L9
	 ld	[%o1+%g1], %g2
	jmp	%o7+8
	 nop
.L6:
	jmp	%o7+8
	 mov	0, %o0
	.size	u32asum, .-u32asum
	.section	.text.startup,"ax",@progbits
	.align 4
	.global main
	.type	main, #function
	.proc	04
main:
	save	%sp, -96, %sp
	call	gen, 0
	 nop
	mov	0, %g1
	mov	0, %g3
.L13:
	ld	[%o0+%g1], %g2
	add	%g2, %g3, %g4
	cmp	%g2, 0
	bl	.L12
	 sub	%g3, %g2, %i0
	mov	%g4, %i0
.L12:
	add	%g1, 4, %g1
	cmp	%g1, 400
	bne	.L13
	 mov	%i0, %g3
	jmp	%i7+8
	 restore
	.size	main, .-main
	.ident	"GCC: (Buildroot 2014.08-g03a6b53) 4.7.4"
	.section	.note.GNU-stack,"",@progbits
