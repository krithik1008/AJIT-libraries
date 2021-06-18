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

      	clr  [ %fp + -4 ]	!i=0
	clr  [ %fp + -8 ]	!result will be stored here
	
	ld  [ %fp + 0x44 ], %g1
     	and  %g1, 1, %g1
     	cmp  %g1, 0
	be  check
	ld  [ %fp + -4 ], %g1		!i for loop !delay slot filling

	!if n is odd one operation must be done in 32bit rest done in 64bits
	ld  [ %fp + 0x48 ], %g1	!loading x[0]
	ld  [ %g1 ], %g1
	ld  [ %fp + 0x50 ], %g2	!loading y[0]
	ld  [ %g2 ], %g2
	umul  %g1, %g2, %g1	!x[0]*y[0]
	st  %g1, [ %fp + -8 ]	!storing in temp result
	mov  1, %g1
	st  %g1, [ %fp + -4 ]
	b check
	ld  [ %fp + -4 ], %g1		!i for loop !delay slot filling

loop: 	sll  %g1, 2, %g1	!i*4
      	ld  [ %fp + 0x48 ], %g2	!loadding array &x[0]
      	add  %g2, %g1, %g2	!x+(i*4)
      	ld  [%g2], %l4		!load first value of array x into l4
	ld  [%g2+4], %l5	!load next value of array x into l5

      	ld  [ %fp + 0x50 ], %g3	!loadding array &y[0]
      	add  %g3, %g1, %g3	!y+(i*4)
      	ld  [%g3], %l6		!load first value of array y into l6
	ld  [%g3+4], %l7	!load next value of array y into l7

      	vumuld32  %l4, %l6, %l2	!multiplying x[i]*y[i]
	add %l2, %l3, %l2
      	ld  [ %fp + -8 ], %g2
      	add  %g2, %l2, %g2	!summing
	st  %g2, [ %fp + -8 ]
      	ld  [ %fp + -4 ], %g1	!loading value of i
      	add  %g1,2,%g1		!i=i+2
      	st  %g1, [ %fp + -4 ]
	
check:	ld  [ %fp + 0x44 ], %g2		!loading n
     	cmp  %g1, %g2			!if i< n
   	bl  loop 			!go to body of for
	ld  [ %fp + -4 ], %g1		!loading i into g1 !delay slot filling

	ld  [ %fp + -8 ], %g2
	set  datak, %g4		!results stored in mem
	st %g2, [%g4]		!storing f9 (result) to memory
	!st %g1, [%g4+4]
	mov  %g2, %i0
	
	restore
	retl
	nop







