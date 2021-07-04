!author : Krithik sankar 
!email  : krithik.sankar10@gmail.com
!date   : 11th June 2021
!delay slot filling is performed wherever possible
!starting address of y array is returned as result


!In order to use double word load (ldd) and store (std) instructions the starting address of both arrays must be double word alligned 
!Therefore adjust the number of elements of array in main accordingly

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
		
		ld [ %fp + 0x48 ], %f10		!alpha
      		fmovs %f10, %f11		!alpha
      		
      		and  %i0, 1, %g1		!checking if n is odd
      		cmp  %g1, 0			
      		be four 			!if n is even then branch
		clr %l1				!i=0
		
		!if n is odd one operation must be done in 32bit rest done in 64bits		
		ld  [ %i2 ], %f9				
		ld  [ %i4 ], %f8		
		fmuls %f9, %f10, %f9		!x*alpha
		fadds  %f9, %f8, %f9		!x*alpha+y
		st  %f9, [ %i4 ]		!putting ans back into y[0]
		add  %l1, 4, %l1		!n=4
		sub %i0,1, %i0			!n=n-1


	four:	btst 3, %i0			!checking n is a multiple of 4
		sll %i0,2,%i0			!i=i*4			
		be check
		cmp  %l1, %i0			!if i< n

		ldd [ %i2+%l1 ], %f8		!load x value pair in f6 f7
		ldd  [ %i4+%l1 ], %f6		!load y value pair in f6 f7
		vfmul32 %f8, %f10, %f2		!multiply (x*alpha)
		vfadd32 %f6, %f2, %f8		!add (x*alpha)+y
		std  %f8, [ %i4+%l1 ]		!storing back into y
		add  %l1, 8, %l1		!i=i+8
		b check
		cmp  %l1, %i0			!if i< n

	loop:	ldd [ %i2+%l1 ], %f0		!load[x+i*4] pair in f0 f1
		ldd [ %i4+%l1 ], %f2		!load[y+i*4] pair in f2 f3
		ldd [ %i2+%l2 ], %f4		!load[x+i*4] next pair in f4 f5
		ldd [ %i4+%l2 ], %f6		!load[y+i*4] next pair in f6 f7
		vfmul32 %f0, %f10, %f8		!multiply (x*alpha)
		vfadd32 %f2, %f8, %f12		!add (x*alpha)+y f12 f13
		vfmul32 %f4, %f10, %f8		!multiply (x*alpha)
		vfadd32 %f6, %f8, %f14		!add (x*alpha)+y f14 f15

      		std  %f12, [ %i4+%l1 ]		!storing back into y
		std  %f14, [ %i4+%l2 ]		!storing back into y
		add  %l1, 16, %l1		!i=i+16		
 
		cmp  %l1, %i0			!if i< n
     	check:	bl  loop
		add  %l1, 8, %l2		
		
		mov  %i4, %i0			! returning the same array
     		restore 
     		retl 
     		nop
