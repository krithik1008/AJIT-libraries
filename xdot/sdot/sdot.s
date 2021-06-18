!author : Krithik sankar 
!email  : krithik.sankar10@gmail.com
!date   : 11th June 2021

!result (float) is stored in %f0 reg and in memory 
!delay slot filled wherever possible 

.section ".bss"
.common datak,400,4

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

      	clr  [ %fp + -4 ]	!i=0
	clr  [ %fp + -8 ]	
     	ld [ %fp + -8 ],%f8	!result will be stored here
	
	ld  [ %fp + 0x44 ], %g1
     	and  %g1, 1, %g1
     	cmp  %g1, 0
	be,a  check
	ld  [ %fp + -4 ], %g2		!i for loop !delay slot filling

	!if n is odd one operation must be done in 32bit rest done in 64bits
	ld  [ %fp + 0x48 ], %g1	!loading x[0]
	ld  [ %g1 ], %f9
	ld  [ %fp + 0x50 ], %g1	!loading y[0]
	ld  [ %g1 ], %f8
	fmuls  %f9, %f8, %f8	!x[0]*y[0]
	st  %f8, [ %fp + -8 ]	!storing in temp result
	mov  1, %g1
	st  %g1, [ %fp + -4 ]
	b check
	ld  [ %fp + -4 ], %g2		!i for loop !delay slot filling

loop: 	sll  %g1, 2, %g1	!i*4
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
      	ld  [ %fp + -8 ], %f9
      	fadds  %f9, %f8, %f8	!summing
	st  %f8, [ %fp + -8 ]
      	ld  [ %fp + -4 ], %g1	!loading value of i
      	add  %g1,2,%g1		!i=i+2
      	st  %g1, [ %fp + -4 ]
	ld  [ %fp + -4 ], %g2		!i for loop

	
check:	ld  [ %fp + 0x44 ], %g1		!loading n
     	cmp  %g2, %g1			!if i< n
   	bl  loop 			!go to body of for
	ld  [ %fp + -4 ], %g1		!loading i into g1 !delay slot filling

store:	ld  [ %fp + -8 ], %f9
	set  datak, %g4		!results stored in mem
	st %f9, [%g4]		!storing f9 (result) to memory
	fmovs  %f9, %f0
	
	restore
	retl
	nop







