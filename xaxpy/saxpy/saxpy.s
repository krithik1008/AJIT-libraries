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
		st  %i4, [ %fp + 0x54 ]	!arr y
		st  %i5, [ %fp + 0x58 ] !incy
		
		set  datak, %g4			!results stored in mem

      		ld  [ %fp + 0x48 ], %f10	!alpha
      		fmovs %f10, %f11			!alpha

      		clr  [ %fp + -4 ]		!i=0
      		ld  [ %fp + 0x44 ], %g1		!loading vlue of n
      		and  %g1, 1, %g1
      		cmp  %g1, 0			
      		be check 			!if n is even then branch
      		ld  [ %fp + -4 ], %g1		!i for loop  

		
		!if n is odd one operation must be done in 32bit rest done in 64bits
      		ld  [ %fp + 0x4c ], %g1		!loading x[0]
		ld  [ %g1 ], %f9		
		fmuls %f9, %f10, %f9		!x*alpha
		ld  [ %fp + 0x54 ], %g1		!loading y[0]
		ld  [ %g1 ], %f8		
		fadds  %f9, %f8, %f9		!x*alpha+y
		ld  [ %fp + 0x54 ], %g1		!putting ans back into y[0]
		st  %f9, [ %g1 ]
		st  %f9, [ %g4 ]		!storing to memory
		mov  1, %g1			!i=1
		st  %g1, [ %fp + -4 ]
		b check
		ld  [ %fp + -4 ], %g1		!i for loop  

	loop:	sll  %g1, 2, %g1		!i*4
      		ld  [ %fp + 0x4c ], %g3		!arr &x[0]
      		add  %g3, %g1, %g3		!x=x+(i*4) o
      		ld  [ %g3 ], %f8		!load[x+i*4] pair in f8 f9
		ld  [ %g3 +4 ], %f9		
		vfmul32 %f8, %f10, %f2		!multiply (x*alpha)


		ld  [%fp+0x54],%g2		!arr &y[0]
      		add  %g2, %g1, %g2		!y=y+(i*4) d
		ld  [ %g2 ], %f6		!load[y+i*4] pair in f6 f7
		ld  [ %g2 +4 ], %f7
		vfadd32 %f6, %f2, %f8		!add (x*alpha)+y

      		st  %f8, [ %g2 ]		!storing back into y
		st  %f9, [ %g2 +4 ]		!storing back into y
		add  %g4, %g1, %g5		!mp=mp+(i*4) d => adjusting memory location	
		st  %f8, [ %g5 ]		!storing l1 to memory
		st  %f9, [ %g5 +4 ]		!storing l2 to memory

      		ld  [ %fp + -4 ], %g1		!i 
      		add  %g1, 2, %g1		! i=i+2
      		st  %g1, [ %fp + -4 ]		! update i 			
		      		
 
	check:	ld  [ %fp + 0x44 ], %g2		!loading n
     		cmp  %g1, %g2			!if i< n
     		bl  loop
		ld  [ %fp + -4 ], %g1

     		ld  [ %fp + 0x54 ], %g1 	! ld arr 
     		mov  %g1, %i0			! returning the same array
     		restore 
     		retl 
     		nop
