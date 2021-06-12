.section ".text"
.align 4
.global sdot
.type sdot, #function

sdot:   save  %sp, -104, %sp
     	st  %i0, [ %fp + 0x44 ]	!value of n
      	st  %i1, [ %fp + 0x48 ]	!array x
      	st  %i2, [ %fp + 0x4c ]	!int incx
      	st  %i3, [ %fp + 0x50 ]	!array y
      	st  %i4, [ %fp + 0x54 ] !int incy

	set  datak, %g4			!results stored in mem
      	clr  [ %fp + -4 ]
	clr  [ %fp + -8 ]
     	ld [ %fp + -8 ],%f8
      	b  check
      	nop 

 loop: 	ld  [ %fp + -4 ], %g1	!loading i into g1
      	sll  %g1, 2, %g1	!i*4
      	ld  [ %fp + 0x48 ], %g2	!loadding array &x[0]
      	add  %g2, %g1, %g2	!x+(i*4)
      	ld  [%g2], %f9		!load float value of array x into f9
      	ld  [ %fp + 0x50 ], %g3	!loadding array &y[0]
      	add  %g3, %g1, %g3	!y+(i*4)
      	ld  [%g3], %f8		!load float value of array y into f9
      	fmuls  %f9, %f8, %f8	!multiplying x[i]*y[i]
      	ld  [ %fp + -8 ], %f9
      	fadds  %f9, %f8, %f8	!summing
	st  %f8, [ %fp + -8 ]
      	ld  [ %fp + -4 ], %g1	!loading value of i
      	inc  %g1		!i=i+1
      	st  %g1, [ %fp + -4 ]

check:	ld  [ %fp + -4 ], %g2	!loading value of i
      	ld  [ %fp + 0x44 ], %g1	!loading value if n in g1
      	cmp  %g2, %g1		!if(i<n)
      	bl  loop
      	nop 
     	ld [ %fp + -8 ], %f8
	st %f8, [%g4]		!storing f8 to memory      	
	fmovs  %f8, %f0
      	restore 
      	retl 
      	nop 
