!author : Krithik sankar 
!email  : krithik.sankar10@gmail.com
!date   : 14th June 2021

!result (unsigned int) is stored in %i0 reg and in memory 
!delay slot filling done wherever possible 

.section ".bss"
.common datak,400,4

.section ".text"
.align 4
.global u32dot
.type u32dot, #function

u32dot: save  %sp, -104, %sp
     	st  %i0, [ %fp + 0x44 ]	!value of n
      	st  %i1, [ %fp + 0x48 ]	!array x
      	st  %i2, [ %fp + 0x4c ]	!int incx
      	st  %i3, [ %fp + 0x50 ]	!array y
      	st  %i4, [ %fp + 0x54 ] !int incy

      	clr %l6		!i=0
	mov 16, %g6	!regs to increment array effectively 
	mov 24, %g7
	
	mov 8, %l7
     	and  %i0, 1, %g1	!checking if n is odd
     	cmp  %g1, 0
	be  four
	clr %g5			!result will be stored in g5

	!if n is odd one operation must be done in 32bit rest done in 64bits
	ld  [ %i1 ], %g1	!loading x[0]
	ld  [ %i3 ], %g2	!loading y[0]
	umul  %g1, %g2, %g5	!x[0]*y[0]
	add  %l6, 4, %l6		!i=i+4
	add  %l7, 4, %l7
	sub %i0,1, %i0
	
four:	btst 3, %i0			!checking if n is a multiple of 4
	sll %i0,2,%i0			!i=i*4!delay slot filling 			
	be check
	cmp  %l6, %i0			!if i< n
		
	ldd  [%i1+%l6], %l4		!load value of array x pair in l4 l5
	ldd  [%l6+%i3], %l1		!load value of array y pair in l6 l7
	vumuld32  %l4, %l1, %l4		!multiplying x[i]*y[i]
	add %l4, %l5, %l4
	add  %g5, %l4, %g5		!summing
	add  %l6, 8, %l6		!i=i+8 
	add  %l7, 8, %l7		
	b check		
	cmp  %l6, %i0

loop: 	ldd  [%l6+%i3], %l1		!load  value of array y into l6 l7	

      	vumuld32  %l4, %l1, %l4		!multiplying x[i]*y[i]
	add %l4, %l5, %l4
      	add  %g5, %l4, %g5		!summing


	ldd  [%i1+%l7], %l4		!load  value of array x into l4 l5
	ldd  [%l7+%i3], %l1		!load  value of array y into l6 l7
	
      	vumuld32  %l4, %l1, %l4		!multiplying x[i]*y[i]
	add %l4, %l5, %l4
      	add  %g5, %l4, %g5		!summing

	vaddd32 %l6, %g6, %l6
	
	cmp  %l6, %i0			!if i< n

check:  bl,a  loop 			!go to body of for
	ldd  [%i1+%l6], %l4		!load  value of array x into l4

	!set  datak, %g4		!results stored in mem
	!st   %g5, [%g4]		!storing g5 (result) to memory	
	mov  %g5, %i0
	restore
	retl
	nop







