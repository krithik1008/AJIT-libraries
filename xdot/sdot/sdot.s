!author : Krithik sankar 
!email  : krithik.sankar10@gmail.com
!date   : 11th June 2021

!result (float) is stored in %f0 reg and in memory 
!delay slot filled wherever possible 

!.section ".bss"
!.common datak,400,4

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

      	mov 0, %l4		!i=0
	clr  [ %fp + -8 ]	
     	ld [ %fp + -8 ],%f2	!result will be stored here
	
     	and  %i0, 1, %g1
     	cmp  %g1, 0
	sll %i0, 2, %i0
	be  check
	cmp  %l4, %i0		!if i< n!delay slot filling

	!if n is odd one operation must be done in 32bit rest done in 64bits
	ld  [ %i1 ], %f9	!loading x[0]
	ld  [ %i3 ], %f8	!loading y[0]
	fmuls  %f9, %f8, %f2	!x[0]*y[0] !storing in temp result
	mov  4, %l4
	b check
	cmp  %l4, %i0		!if i< n!delay slot filling

loop: 	!loadding array &x[0]
	

      	!loadding array &y[0]
      	!add  %i3, %l4, %g3		!y+(i*4)
      	ldd  [%i3+%l4], %f6		!load float first value of array y into f6 f7
	

      	vfmul32  %f4, %f6, %f8	!multiplying x[i]*y[i]
	fadds %f8, %f9, %f8
      	fadds  %f2, %f8, %f2	!summing
      	add  %l4, 8, %l4	!i=i+8
	
     	cmp  %l4, %i0		!if i< n
check:  bl  loop 		!go to body of for
	ldd  [%i1+%l4], %f4	!load float first value of array x into f4 f5	
	!add  %i1, %l4, %g2	!x+(i*4)delay slot filling

store:	!set  datak, %g4		!results stored in mem
	!st %f2, [%g4]		!storing f9 (result) to memory
	fmovs  %f2, %f0
	
	restore
	retl
	nop







