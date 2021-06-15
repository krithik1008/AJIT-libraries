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
		
		set  datak, %g4			!results stored in mem
		
		ld  [ %fp + 0x48 ], %l4	!alpha
      		mov %l4,%l5		!alpha

      		clr  [ %fp + -4 ]		!i value
      		ld  [ %fp + 0x44 ], %g1		!loading vlue of n
      		and  %g1, 1, %g1
      		cmp  %g1, 0			
      		bn check 			!if n is even then branch
      		ld  [ %fp + -4 ], %g2		!i for loop !delay slot filling 
		
		!if n is odd one operation must be done in 32bit rest done in 64bits
      		ld  [ %fp + 0x4c ], %g1		!loading x[0]
		ld  [ %g1 ], %g1		
		ld  [ %fp + 0x48 ], %g2		!loading alpha
		umul %g2, %g1, %g2		!x*alpha
		ld  [ %fp + 0x54 ], %g1		!loading y[0]
		ld  [ %g1 ], %g1		
		add  %g2, %g1, %g2		!x*alpha+y
		ld  [ %fp + 0x54 ], %g1		!putting ans back into y[0]
		st  %g2, [ %g1 ]
		st  %g2, [ %g4 ]		!storing to memory
		mov  1, %g1			!i=1
		st  %g1, [ %fp + -4 ]
		b check
		ld  [ %fp + -4 ], %g2		!i for loop !delay slot filling 

      loop:	sll  %g1, 2, %g1		!i*4
      		ld  [ %fp + 0x4c ], %g3		!arr &x[0]
      		add  %g3, %g1, %g3		!x=x+(i*4) o
      		ld  [ %g3 ], %l0		!load[x+i*4] pair in l1 l2
		ld  [ %g3 +4 ], %l1		
		vumuld32 %l0, %l4, %l6		!multiply (x*alpha)


		ld  [%fp+0x54],%g2		!arr &y[0]
      		add  %g2, %g1, %g2		!y=y+(i*4) d
		ld  [ %g2 ], %l2		!load[y+i*4] pair in l3 l4
		ld  [ %g2 +4 ], %l3
		vaddd32 %l2, %l6, %l0		!add (x*alpha)+y

      		st  %l0, [ %g2 ]		!storing back into y
		st  %l1, [ %g2 +4 ]		!storing back into y
		add  %g4, %g1, %g5		!mp=mp+(i*4) d => adjusting memory location	
		st  %l0, [ %g5 ]		!storing l1 to memory
		st  %l1, [ %g5 +4 ]		!storing l2 to memory

      		ld  [ %fp + -4 ], %g1		!i 
      		add  %g1, 2, %g1		! i=i+2
      		st  %g1, [ %fp + -4 ]		! update i 
      
		ld  [ %fp + -4 ], %g2		!i for loop 
     	check:	ld  [ %fp + 0x44 ], %g1		!loading n
     		cmp  %g2, %g1			!if i< n
     		bl  loop 			!go to body of for
     		ld  [ %fp + -4 ], %g1		!i !delay slot filling 

     					
     		ld  [ %fp + 0x54 ], %g1 	! ld arr 
     		mov  %g1, %i0		! returning the same array
     		restore 
     		retl 
     		nop
