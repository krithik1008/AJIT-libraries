!author : Krithik sankar 
!email  : krithik.sankar10@gmail.com
!date   : 12th June 2021

!Returns the array index (int) of the first maximum absolute value 
!result stored in %i0

.section ".bss"
.common datak,400,4

.section ".text"
.align 4
.global isamax
.type isamax, #function

     isamax:	save  %sp, -120, %sp

      		st  %i0, [ %fp + 0x44 ]	!value of n (no of elements)
      		st  %i1, [ %fp + 0x48 ]	!array x
      		st  %i2, [ %fp + 0x4c ]	!value of incx

      		mov  1, %g1		!value of i=1
      		st  %g1, [ %fp + -4 ]	!storing val of i
      		ld  [ %fp + 0x48 ], %g1	
      		ld  [ %g1 ], %f8	!loading first val. of array (x[0])
		fabss %f8,%f8		!absolute value
      		st  %f8, [ %fp + -8 ]	! storing x[0] at %fp-8 (temp)
      		clr  [ %fp + -12 ]
      		b  check
      		nop 

      loop:	ld  [ %fp + -4 ], %g1	!loading value of i
      		sll  %g1, 2, %g1	!i*4
      		ld  [ %fp + 0x48 ], %g2	!loading first val of array
      		add  %g2, %g1, %g2	
      		ld  [ %g2 ], %f9	!loading x[i]
		fabss %f9,%f9
      		ld  [ %fp + -8 ], %f8
      		fcmpes  %f9, %f8
      		nop 
      		fbule  smaller 
      		nop 
     
      		st  %f9, [ %fp + -8 ]	!updating temp maximux value
      		ld  [ %fp + -4 ], %g1
      		st  %g1, [ %fp + -12 ]	!storing index of largest
      smaller:	ld  [ %fp + -4 ], %g1
      		inc  %g1
      		st  %g1, [ %fp + -4 ]
      check:	ld  [ %fp + -4 ], %g2	!loading value of i
      		ld  [ %fp + 0x44 ], %g1	!loading value of n
      		cmp  %g2, %g1		!checking if i<n
      		bl  loop
      		nop 

        	ld  [ %fp + -12 ], %g1
        	mov  %g1, %i0
     		restore 
     		retl 
     		nop
