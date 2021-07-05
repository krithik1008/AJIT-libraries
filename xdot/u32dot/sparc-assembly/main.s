	.file	"main.c"
	.section	".text"
	.align 4
	.global u32dot_1
	.type	u32dot_1, #function
	.proc	016
u32dot_1:
	cmp	%o0, 0
	ble	.L4
	 sll	%o2, 2, %o2
	sll	%o4, 2, %o4
	mov	0, %g2
	mov	0, %g1
.L3:
	ld	[%o3], %g4
	ld	[%o1], %g3
	add	%g1, 1, %g1
	smul	%g4, %g3, %g3
	add	%o1, %o2, %o1
	add	%g3, %g2, %g2
	cmp	%g1, %o0
	bne	.L3
	 add	%o3, %o4, %o3
	jmp	%o7+8
	 mov	%g2, %o0
.L4:
	jmp	%o7+8
	 mov	0, %o0
	.size	u32dot_1, .-u32dot_1
	.section	.text.startup,"ax",@progbits
	.align 4
	.global main
	.type	main, #function
	.proc	016
main:
	save	%sp, -96, %sp
	call	genx, 0
	 mov	0, %i0
	call	geny, 0
	 mov	%o0, %i5
	mov	0, %g1
.L8:
	ld	[%o0+%g1], %g3
	ld	[%i5+%g1], %g2
	add	%g1, 4, %g1
	smul	%g3, %g2, %g2
	cmp	%g1, 4000
	bne	.L8
	 add	%g2, %i0, %i0
	jmp	%i7+8
	 restore
	.size	main, .-main
	.ident	"GCC: (Buildroot 2014.08-g03a6b53-dirty) 4.7.4"
	.section	.note.GNU-stack,"",@progbits
