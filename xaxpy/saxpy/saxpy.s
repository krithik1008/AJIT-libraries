!author : Krithik sankar 
!email  : krithik.sankar10@gmail.com
!date   : 11th June 2021
!delay slot filling is performed wherever possible
!starting address of y array is returned as result


!In order to use double word load (ldd) and store (std) instructions the starting address of both arrays must be double word alligned 
!Therefore adjust the number of elements of array in main accordingly

!.section ".bss"
!.common datak,400,4


.section ".text"
.align 4
.global saxpy
.type saxpy, #function

   saxpy:	save  %sp, -104, %sp
      		st  %i0, [ %fp + 0x44 ]	!n
      		st  %i1, [ %fp + 0x48 ]	!alpha
      		st  %i2, [ %fp + 0x4c ]	!arr x 
      		st  %i3, [ %fp + 0x50 ]	!incx
		st  %i4, [ %fp + 0x54 ]	!arr y	
		st  %i5, [ %fp + 0x58 ] !incy
		
			!set  datak, %g4	!results stored in mem

      		ld  [ %fp + 0x48 ], %f10	!alpha
      		fmovs %f10, %f11		!alpha

      		mov 0, %l1			!i=0
      		
      		and  %i0, 1, %g1
      		cmp  %g1, 0
		sll %i0,2,%i0    		!n*8=n			
      		be check 			!if n is even then branch
		cmp  %l1, %i0			!if i<n
		
		!if n is odd one operation must be done in 32bit rest done in 64bits		
		ld  [ %i2 ], %f9		
		fmuls %f9, %f10, %f9		!x*alpha		
		ld  [ %i4 ], %f8		
		fadds  %f9, %f8, %f9		!x*alpha+y
		st  %f9, [ %i4 ]		!putting ans back into y[0]
			!st  %f9, [ %g4 ]	!storing to memory
			!add %g4, 4, %g4
		mov  4, %l1			!n
		b check
		cmp  %l1, %i0			!if i< n 

	loop:	vfmul32 %f8, %f10, %f2		!multiply (x*alpha)
			
		ldd  [ %i4+%l1 ], %f6		!load[y+i*4] pair in f6 f7
		vfadd32 %f6, %f2, %f8		!add (x*alpha)+y

      		std  %f8, [ %i4+%l1 ]		!storing back into y
			!add  %g4, %l1, %g5		!mp=mp+(i*4) d => adjusting memory location
			!std  %f8, [ %g5 ]		!storing f8 and f9 to memory
			
		add  %l1, 8, %l1		!i=i+8		
 
		cmp  %l1, %i0			!if i< n
     	check:	bl  loop
		ldd [ %i2+%l1 ], %f8		!load[x+i*4] pair in f8 f9

     		mov  %i4, %i0			! returning the same array
     		restore 
     		retl 
     		nop
