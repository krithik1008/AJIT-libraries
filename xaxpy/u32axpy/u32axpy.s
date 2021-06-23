!author : Krithik sankar 
!email  : krithik.sankar10@gmail.com
!date   : 14th June 2021

.section ".bss"
.common datak,400,4

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
		
		set  datak, %g4		!results stored in mem
		
		mov %i1, %l4		!alpha
      		mov %l4, %l5		!alpha

      		mov  %g0, %g6		!i value
      		and  %i0, 1, %g1	!loading vlue of n
      		cmp  %g1, 0			
      		be check 			!if n is even then branch
      		cmp  %g6, %i0			!if i< n !delay slot filling 
		
		!if n is odd one operation must be done in 32bit rest done in 64bits
		ld  [ %i2 ], %g1		!loading x[0]
		umul %g1, %l4, %g2		!x*alpha
		ld  [ %i4 ], %g1		!loading y[0]
		add  %g2, %g1, %g2		!x*alpha+y		
		st  %g2, [ %g4 ]		!storing to memory		
		st  %g2, [ %i4 ]		!putting ans back into y[0]
		
		mov  1, %g6			!i=1
		b check
		cmp  %g6, %i0			!if i< n!delay slot filling 

      loop:	add  %i2, %g1, %g3		!x=x+(i*4) o
      		ldd  [ %g3 ], %l0		!load[x+i*4] pair in l0 l1
		!ld  [ %g3 +4 ], %l1		
		vumuld32 %l0, %l4, %l6		!multiply (x*alpha)

      		add  %i4, %g1, %g2		!y=y+(i*4) d
		ldd  [ %g2 ], %l2		!load[y+i*4] pair in l2 l3
		!ld  [ %g2 +4 ], %l3
		vaddd32 %l2, %l6, %l0		!add (x*alpha)+y

      		std  %l0, [ %g2 ]		!storing back into y
		!st  %l1, [ %g2 +4 ]		!storing back into y
		add  %g4, %g1, %g5		!mp=mp+(i*4) d => adjusting memory location	
		std  %l0, [ %g5 ]		!storing l0 to memory
		!st  %l1, [ %g5 +4 ]		!storing l1 to memory

      		add  %g6, 2, %g6		! i=i+2 
     		
     		cmp  %g6, %i0			!if i< n
     	check:	bl  loop 			!go to body of for
     		sll  %g6, 2, %g1		!i*4 !delay slot filling 
			
     		mov  %i4, %i0			! returning the same array
     		restore 
     		retl 
     		nop
