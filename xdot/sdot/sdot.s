!author : Krithik sankar 
!email  : krithik.sankar10@gmail.com
!date   : 11th June 2021

!result (float) is stored in %f0 reg and in memory 

.section ".bss"
.common datak,400,4

.section ".text"
.align 4
.global sdot
.type sdot, #function

sdot:   save  %sp, -112, %sp
     	st  %i0, [ %fp + 0x44 ]	!value of n
      	st  %i1, [ %fp + 0x48 ]	!array x
      	st  %i2, [ %fp + 0x4c ]	!int incx
      	st  %i3, [ %fp + 0x50 ]	!array y
      	st  %i4, [ %fp + 0x54 ] !int incy

	set  datak, %g4			!results stored in mem
      	clr  [ %fp + -4 ]	!k=0
	clr  [ %fp + -8 ]	!i=0
	clr  [ %fp + -12]
     	ld [ %fp + -12 ],%f8	!result will be stored here
	ld  [ %fp + 0x44 ], %g1
     	and  %g1, 1, %g1
     	cmp  %g1, 0
	bne  condt
	nop

	ld  [ %fp + 0x44 ], %g1	!if n is even : k=n
     	st  %g1, [ %fp + -4 ]
	b  check
	nop

condt:	ld  [ %fp + 0x44 ], %g1	!if n is odd : k=n-1
     	add  %g1, -1, %g1
     	st %g1, [ %fp + -4 ]
	b  check
	nop

loop: 	ld  [ %fp + -8 ], %g1	!loading i into g1
      	sll  %g1, 2, %g1	!i*4
      	ld  [ %fp + 0x48 ], %g2	!loadding array &x[0]
      	add  %g2, %g1, %g2	!x+(i*4)
      	ld  [%g2], %f4		!load float first value of array x into f4
	ld  [%g2+4], %f5	!load float next value of array x into f5

      	ld  [ %fp + 0x50 ], %g3	!loadding array &y[0]
      	add  %g3, %g1, %g3	!y+(i*4)
      	ld  [%g3], %f6		!load float first value of array y into f6
	ld  [%g3+4], %f7	!load float next value of array y into f7

      	vfmul32  %f4, %f6, %f8	!multiplying x[i]*y[i]
	fadds %f8, %f9, %f8
      	ld  [ %fp + -12 ], %f9
      	fadds  %f9, %f8, %f8	!summing
	st  %f8, [ %fp + -12 ]
      	ld  [ %fp + -8 ], %g1	!loading value of i
      	add  %g1,2,%g1		!i=i+2
      	st  %g1, [ %fp + -8 ]


check:	ld  [ %fp + -8 ], %g2	!loading value of i
      	ld  [ %fp + -4 ], %g1	!loading value if k
      	cmp  %g2, %g1		!if(i<k)
      	bl  loop
      	nop 

	ld  [ %fp + 0x44 ], %g1
     	and  %g1, 1, %g1
     	cmp  %g1, 0
     	be  store		!if n is even no need to compute for last element
	nop

	ld  [ %fp + 0x44 ], %g1	!loading value of n
     	add  %g1, -1, %g1	!n-1
     	sll  %g1, 2, %g1	!(n-1)*4
	ld  [ %fp + 0x48 ], %g2
	add  %g2, %g1, %g2
	ld  [ %g2 ], %f4	!loading x[n-1] in %f4

	ld  [ %fp + 0x50 ], %g3
	add  %g3, %g1, %g3
	ld  [%g3], %f5		!loading y[n-1] in %f5

	fmuls  %f5, %f4, %f5
	ld  [ %fp + -12 ], %f9
	fadds  %f9, %f5, %f9
	st  %f9, [ %fp + -12 ]

store:	ld  [ %fp + -12 ], %f9
	st %f9, [%g4]		!storing f9 (result) to memory
	fmovs  %f9, %f0
	
	restore
	retl
	nop







