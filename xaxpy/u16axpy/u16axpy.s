!author : Krithik sankar 
!email  : krithik.sankar10@gmail.com
!date   : 16th June 2021

!.section ".bss"
!.common datak,400,4

.section ".text"
.align 4
.global u16axpy
.type u16axpy, #function

   u16axpy:	save  %sp, -104, %sp
      		st  %i0, [ %fp + 0x44 ]	!n
      		sth  %i1, [ %fp + 0x48 ]!alpha
      		st  %i2, [ %fp + 0x4c ]	!arr x
      		st  %i3, [ %fp + 0x50 ]	!incx
		st  %i4, [ %fp + 0x54 ]	!arr y
		st  %i5, [ %fp + 0x58 ] !incy

		!set  datak, %g4			!results stored in mem
		
		mov 0, %g5		
		
		mov  %i1, %l4			!alpha
		sll %l4, 16, %g1
		or %l4, %g1, %l4
      		mov %l4,%l5			!alpha

		b check	
		nop	

      loop:	/*      		
		lduh  [ %g2 ], %l0		!arr &x[0]
      		lduh [ %g2 + 2 ], %g3	
		sll %g3, 16, %g3
		or %g3, %l0, %l0
		lduh [ %g2 + 4 ], %l1	
		lduh [ %g2 + 6 ], %g3	
      		sll %g3, 16, %g3
		or %g3, %l1, %l1
		*/
		ldd [%i2+%g1], %l0
	
		vumuld16 %l0, %l4, %l6		!multiply (x*alpha)
		/*      		
		lduh  [ %g2 ], %l2		!arr &y[0]
      		lduh [ %g2 + 2 ], %g3	
		sll %g3, 16, %g3
		or %g3, %l2, %l2
		lduh [ %g2 + 4 ], %l3	
		lduh [ %g2 + 6 ], %g3	
      		sll %g3, 16, %g3
		or %g3, %l3, %l3
		*/
		ldd [%i4+ %g1], %l2

		vaddd16 %l2, %l6, %l0		!add (x*alpha)+y

		/*		
		sth %l0, [%g4 + %g1]		!storing back into y
	
		srl %l0, 16, %l0
		add %g1, 2, %g1
		sth %l0, [%g4 + %g1]

		add %g1, 2, %g1
		sth %l1, [%g4 + %g1]

		srl %l1, 16, %l1
		add %g1, 2, %g1
		sth %l1, [%g4 + %g1]
		*/
		
		std %l0, [%i4+%g1]
		!std %l0, [%g4+%g1]

		add  %i0, -4, %i0		! n=n-4
 		add  %g5, 4, %g5		! i=i+4	update i
	

      
     	check:	cmp  %i0, 3			!if i< n
     		bg  loop 			!go to body of for
     		add  %g5, %g5, %g1		!i !delay slot filling 



	!calculation of last 3 elements has to be done using 32 bit instructions

		cmp %i0, 1
		be one	
		lduh [%i2 + %g1], %g2

		cmp %i0, 2
		be two
		lduh [%i2 + %g1], %g2

		cmp %i0, 3
		bne store
		mov  %i4, %i0			! returning the same array

		lduh [%i2 + %g1], %g2
		umul %g2, %i1, %g2
		lduh [%i4 + %g1], %g3
		add %g2, %g3, %g2
		!sth %g2, [%g4+%g1]
		sth %g2, [%i4+%g1]
		add %g1, 2, %g1

		lduh [%i2 + %g1], %g2	
	two:	umul %g2, %i1, %g2
		lduh [%i4 + %g1], %g3
		add %g2, %g3, %g2
		!sth %g2, [%g4+%g1]
		sth %g2, [%i4+%g1]
		add %g1, 2, %g1

		lduh [%i2 + %g1], %g2
	one:	umul %g2, %i1, %g2
		lduh [%i4 + %g1], %g3
		add %g2, %g3, %g2
		!sth %g2, [%g4+%g1]
		sth %g2, [%i4+%g1]
		add %g1, 2, %g1	
     			
     		mov  %i4, %i0			! returning the same array
     	store:	restore 
     		retl 
     		nop
