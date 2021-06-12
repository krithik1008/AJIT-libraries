.section	".data"
.align 8
      ZERO: .double 0



.section ".text"
.align 4
.global conv_1d
.type conv_1d, #function

conv_1d:	save %sp, -96, %sp
		set 0, %l0			! equivalent to i of outer loop
		add %i2, %i3, %l1
		sub %l1, 1, %l1			! l1=> m+n-1 (part of outer loop)
		set ZERO, %g4
		ldd [%g4], %f0
		set set_data,%g2
		
outer:		set 0, %l2
		fmovs %f8, %f7
		
inner:		umul %l2, 4, %l3
		sub %l0, %l2, %l4
		umul %l4, 4, %l4
		ld [%i0 + %l3], %f0		! load (j*4+x)
		ld [%i1 + %l4], %f2		! load (i-j)*4+h
		add %l2, 1, %l3		
		umul %l3, 4, %l3
		ld [%i0 + %l3], %f1		! load (j+1)*4+x
		sub %l4, 4, %l4
		ld [%i1 + %l4], %f3 		! load (i-j-1)*4+h
		vfmul32 %f0, %f2, %f4
		fadds %f4, %f5, %f6
		fadds %f6, %f7, %f7		
		add %l2 , 2, %l2
		cmp %l2, %l0
		
		ble inner
		nop
		nop
		st %l1,[%g2]
                add %g2,4,%g2
		!store result (f7)
		add %l0, 1, %l0
		cmp %l0, %l1
		bl outer
		nop
		nop		
		
		restore
		retl
		nop


end:		ta 0

