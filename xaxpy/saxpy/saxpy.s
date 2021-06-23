!author : Krithik sankar 
!email  : krithik.sankar10@gmail.com
!date   : 11th June 2021
!delay slot filling is performed wherever possible
!starting address of y array is returned as result


.section ".bss"
.common datak,400,4


.section ".text"
.align 4
.global saxpy
.type saxpy, #function

   saxpy:	save  %sp, -104, %sp
      		st  %i0, [ %fp + 0x44 ]	!n
      		st  %i1, [ %fp + 0x48 ]	!alpha
      		st  %i2, [ %fp + 0x4c ]	!arr x 
      		st  %i3, [ %fp + 0x50 ]	!incx
		st  %i4, [ %fp + 0x54 ]	!arr y	!54
		st  %i5, [ %fp + 0x58 ] !incy
		
		set  datak, %g4			!results stored in mem

      		ld  [ %fp + 0x48 ], %f10	!alpha
      		fmovs %f10, %f11		!alpha

      		mov %g0, %l1			!i=0
      		mov %i0, %l4			!loading vlue of n in l4
		add %l4, -1, %l4

      		and  %i0, 1, %g1
      		cmp  %g1, 0			
      		be check 			!if n is even then branch
		cmp  %l1, %i0			!if i< n
		
		!if n is odd one operation must be done in 32bit rest done in 64bits
		sll  %l4, 2, %g1		! g1=(n-1)*4
      		add  %i2, %g1, %g2		
		ld  [ %g2 ], %f9		
		fmuls %f9, %f10, %f9		!x*alpha
		add  %i4, %g1, %g3		
		ld  [ %g3 ], %f8		
		fadds  %f9, %f8, %f9		!x*alpha+y
		st  %f9, [ %g3 ]		!putting ans back into y[0]
		st  %f9, [ %g4 ]		!storing to memory
		add %g4, 4, %g4
		mov  %l4, %i0			!n
		b check
		cmp  %l1, %i0			!if i< n 

	loop:	add  %i2, %l2, %g3		!x=x+(i*4) o
      		ldd  [ %g3 ], %f8		!load[x+i*4] pair in f8 f9
		!ld  [ %g3 +4 ], %f9		
		vfmul32 %f8, %f10, %f2		!multiply (x*alpha)
			
		add  %i4, %l2, %g2		!y=y+(i*4) d
		ldd  [ %g2 ], %f6		!load[y+i*4] pair in f6 f7
		!ld  [ %g2 +4 ], %f7		
		vfadd32 %f6, %f2, %f8		!add (x*alpha)+y

      		std  %f8, [ %g2 ]		!storing back into y
		!st  %f9, [ %g2 +4 ]		!storing back into y
		
		add  %g4, %l2, %g5		!mp=mp+(i*4) d => adjusting memory location
		std  %f8, [ %g5 ]		!storing f8 to memory
		!st  %f9, [ %g5 +4 ]		!storing f9 to memory

      		add  %l1, 2, %l1		! i=i+2		
 
		cmp  %l1, %i0			!if i< n
     	check:	bl  loop
		sll  %l1, 2, %l2		!i*4

     		mov  %i4, %i0			! returning the same array
     		restore 
     		retl 
     		nop
