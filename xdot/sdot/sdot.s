!author : Krithik sankar 
!email  : krithik.sankar10@gmail.com
!date   : 11th June 2021

!result is stored in f0 register
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

	clr  [ %fp + -8 ]	
     	ld [ %fp + -8 ],%f2	!temp result will be stored here

	mov 16, %g6		!values to increment array effectively 
	mov 24, %g7
	mov 8, %l5
	
     	and  %i0, 1, %g1	!checking if n is odd
     	cmp  %g1, 0
	be four 		!if n is even then branch
	clr %l4			!i=0


	!if n is odd one operation must be done in 32bit rest done in 64bits
	ld  [ %i1 ], %f9		!loading x[0]
	ld  [ %i3 ], %f8		!loading y[0]
	fmuls  %f9, %f8, %f2		!x[0]*y[0] !storing in temp result
	add  %l4, 4, %l4		!i=i+4
	add  %l5, 4, %l5
	sub %i0,1, %i0

four:	btst 3, %i0			!checking if n is a multiple of four	
	sll %i0,2,%i0			!i=i*4			
	be check
	cmp  %l4, %i0			!if i< n

	ldd [ %i1+%l4 ], %f8
	ldd  [ %i3+%l4 ], %f6		!load[y+i*4] pair in f6 f7
	vfmul32 %f8, %f6, %f10		
	fadds  %f10, %f11, %f6		!summing
	fadds  %f6, %f2, %f2
	add  %l4, 8, %l4		!i=i+8
	add  %l5, 8, %l5
	b check
	cmp  %l4, %i0			!if i< n


	!this loop processes 4 elements of each array in an iteration 
loop: 	ldd  [%i3+%l4], %f6		!load float values of array y into f6 f7
	
      	vfmul32  %f4, %f6, %f8		!multiplying x[i]*y[i]
	fadds %f8, %f9, %f8
      	fadds  %f2, %f8, %f2		!summing
      	!add  %l4, 8, %l4		!i=i+8

	ldd  [%i1+%l5], %f4		!load float first value of array x into f4 f5
	ldd  [%i3+%l5], %f6		!load float first value of array y into f6 f7
	

      	vfmul32  %f4, %f6, %f8		!multiplying x[i]*y[i]
	fadds %f8, %f9, %f8
      	fadds  %f2, %f8, %f2		!summing
      	!add  %l4, 8, %l4		!i=i+8
	vaddd32 %l4, %g6, %l4
	
     	cmp  %l4, %i0			!if i< n
check:  bl  loop 			!go to body of for
	ldd  [%i1+%l4], %f4		!load float values of array x into f4 f5	

store:	!set  datak, %g4		!results stored in mem
	!st %f2, [%g4]			!storing f9 (result) to memory
	fmovs  %f2, %f0
	
	restore
	retl
	nop







