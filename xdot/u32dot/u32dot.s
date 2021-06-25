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

      	clr %l1		!i=0
	clr %g5 		!result will be stored in g5
	
     	and  %i0, 1, %g1
	sll %i0, 2, %i0
     	cmp  %g1, 0
	be  check
	cmp  %l1, %i0		!if i< n !delay slot filling

	!if n is odd one operation must be done in 32bit rest done in 64bits
	ld  [ %i1 ], %g1	!loading x[0]
	ld  [ %i3 ], %g2	!loading y[0]
	umul  %g1, %g2, %g5	!x[0]*y[0]
	mov  1, %l1
	b check
	cmp  %l1, %i0		!if i< n!delay slot filling

loop: 	
	!ld  [%g2+4], %l5	!load next value of array x into l5

	ldd  [%l1+%i3], %l6	!load first value of array y into l6
	!ld  [%g3+4], %l7	!load next value of array y into l7

      	vumuld32  %l4, %l6, %l2	!multiplying x[i]*y[i]
	add %l2, %l3, %l2
      	add  %g5, %l2, %g5	!summing
      	add  %l1, 8, %l1	!i=i+8
	
	cmp  %l1, %i0		!if i< n

check:  bl,a  loop 		!go to body of for
	ldd  [%i1+%l1], %l4		!load first value of array x into l4
	!sll  %l1, 2, %g1	!i*4!delay slot filling

	set  datak, %g4		!results stored in mem
	st   %g5, [%g4]		!storing g5 (result) to memory	
	mov  %g5, %i0
	
	restore
	retl
	nop







