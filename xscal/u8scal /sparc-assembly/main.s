	.file	"main.c"
	.section	".text"
	.align 4
	.global u8scal
	.type	u8scal, #function
	.proc	0114
u8scal:
	mov	%o2, %g1
	cmp	%o0, 0
	ble	.L7
	 add	%o2, %o0, %g3
	ldub	[%g1], %g2
.L9:
	smul	%o1, %g2, %g2
	stb	%g2, [%g1]
	add	%g1, 1, %g1
	cmp	%g1, %g3
	bne,a	.L9
	 ldub	[%g1], %g2
.L7:
	jmp	%o7+8
	 mov	%o2, %o0
	.size	u8scal, .-u8scal
	.section	.text.startup,"ax",@progbits
	.align 4
	.global main
	.type	main, #function
	.proc	0114
main:
	save	%sp, -96, %sp
	call	gen, 0
	 mov	100, %i0
	mov	3, %i1
	mov	%o0, %i2
	call	u8scal, 0
	 restore %g0, 1, %o3
	.size	main, .-main
	.ident	"GCC: (Buildroot 2014.08-g03a6b53) 4.7.4"
	.section	.note.GNU-stack,"",@progbits
