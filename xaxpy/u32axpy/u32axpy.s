!author : Krithik sankar 
!email  : krithik.sankar10@gmail.com
!date   : 14th June 2021

!In order to use double word load (ldd) and store (std) instructions the starting address of both arrays must be double word alligned 
!Therefore adjust the number of elements of array in main accordingly


!.section ".bss"
!.common datak,400,4

.section ".text"
.align 4
.global u32axpy
.type u32axpy, #function

   u32axpy:	save  %sp, -104, %sp
      		st  %i0, [ %fp + 0x44 ]	!n
      		st  %i1, [ %fp + 0x48 ]	!alpha
      		st  %i2, [ %fp + 0x4c ]	!arr x
      		st  %i3, [ %fp + 0x50 ]	!incx
		st  %i4, [ %fp + 0x54 ]	!arr y
		st  %i5, [ %fp + 0x58 ] !incy
		
		!set  datak, %g4		!results stored in mem
		
		mov %i1, %l4			!alpha
      		mov %l4, %l5			!alpha

		mov 16, %g6			!registers for efficient traversal of the array
		mov 24, %g7
		
		mov 8, %l7
      		and  %i0, 1, %g1	 
      		cmp  %g1, 0			
      		be four 			!if n is even then branch
		clr %l6				!i value
		
		!if n is odd one operation must be done in 32bit rest done in 64bits
		ld  [ %i2 ], %l1		!loading x[0]
		ld  [ %i4 ], %l2		!loading y[0]
		umul %l1, %l4, %l1		!x*alpha
		add  %l1, %l2, %l1		!x*alpha+y				
		st  %l1, [ %i4 ]		!putting ans back into y[0]
		add  %l6, 4, %l6		!i=i+4
		add  %l7, 4, %l7
		sub %i0,1, %i0			!n=n-1	

	four:	btst 3, %i0			!checking if n is a multiple of 4		
		sll %i0,2,%i0			!i=i*4			
		be check
		cmp  %l6, %i0			!if i< n
		
		ldd  [ %i2 + %l6 ], %l0		!load[x+i*4] pair in l0 l1
		ldd  [ %i4 + %l6 ], %l2		!load[y+i*4] pair in l2 l3
		vumuld32 %l0, %l4, %l0		!multiply (x*alpha)
		vaddd32 %l2, %l0, %l2		!add (x*alpha)+y
		std  %l2, [ %i4 + %l6 ]		!storing back into y
		add  %l6, 8, %l6		!i=i+8 
		add  %l7, 8, %l7		
		b check		
		cmp  %l6, %i0			!if i< n
	

      loop:	ldd  [ %i4 + %l6 ], %l2		!load[y+i*4] pair in l2 l3	
		
		vumuld32 %l0, %l4, %l0		!multiply (x*alpha)		
		vaddd32 %l2, %l0, %l2		!add (x*alpha)+y

      		std  %l2, [ %i4+%l6 ]		!storing back into y
		
		!add  %l6, 8, %l6
		
		ldd  [ %i2 + %l7 ], %l0		!load[x+i*4] pair in l0 l1
		ldd  [ %i4 + %l7 ], %l2		!load[y+i*4] pair in l2 l3
		
		vumuld32 %l0, %l4, %l0		!multiply (x*alpha)		
		vaddd32 %l2, %l0, %l2		!add (x*alpha)+y

      		std  %l2, [ %i4+%l7 ]		!storing back into y

		vaddd32 %l6, %g6, %l6		
		!add  %l6, 8, %l6		! i=i+8 
     		
     		cmp  %l6, %i0			!if i< n
     	check:	bl  loop 			!go to body of for
     		ldd  [ %i2 + %l6 ], %l0		!load[x+i*4] pair in l0 l1			
		
     		mov  %i4, %i0			! returning the same array
     		restore 
     		retl 
     		nop

