!author : Krithik sankar 
!email  : krithik.sankar10@gmail.com
!date   : 12th June 2021

!Returns the array index (int) of the first maximum absolute value 
!result stored in %i0
!delay slot filling done wherever possible 

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

      		mov  1, %l1		!value of i=1
      		ld  [ %i1 ], %f1	!loading first val. of array (x[0])
		fabss %f1,%f1		!absolute value
      		b  check
      		mov  1, %l2		!storing result

      loop:	ld  [ %g1+%i1 ], %f9	!loading x[i]
		fabss %f9,%f9
      		fcmpes  %f9, %f1
      		fbule  check 
      		inc  %l1 
     
      		fmovs %f9, %f1	!updating temp maximux value
      		mov %l1, %l2	!storing index of largest
      		
      check:	cmp  %l1, %i0		!checking if i<n
      		bl  loop
      		sll  %l1, 2, %g1	!i*4 

        	mov  %l2, %i0
     		restore 
     		retl 
     		nop
