!author : Krithik sankar 
!email  : krithik.sankar10@gmail.com
!date   : 16th June 2021

.section ".bss"
.common datak,400,4

.section ".text"
.align 4
.global u16dot
.type u16dot, #function

   u16dot:	save  %sp, -104, %sp
      		st  %i0, [ %fp + 0x44 ]	!n
      		st  %i1, [ %fp + 0x48 ]	!arr x
      		st  %i2, [ %fp + 0x4c ]	!incx
		st  %i3, [ %fp + 0x50 ]	!arr y
		st  %i4, [ %fp + 0x54 ] !incy

		set  datak, %g4			!results stored in mem
		
		mov 0, %g5
		mov 0, %g7		
		sethi %hi(0xFFFFFFFF),%g6
		or    %g6,%lo(0xFFFFFFF),%g6
		
		b check	
		nop	

      loop:	
			/*     		
			lduh  [ %g2 ], %l0		!arr &x[0]
      			lduh [ %g2 + 2 ], %g3	
			sll %g3, 16, %g3
			or %g3, %l0, %l0
			lduh [ %g2 + 4 ], %l1	
			lduh [ %g2 + 6 ], %g3	
      			sll %g3, 16, %g3
			or %g3, %l1, %l1
			*/
		ldd [%i1+%g1], %l0

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
		ldd [%i3+%g1], %l2

		vumuld16 %l2, %l0, %l6		! (x*y)

		adddreduce16 %l6, %g6, %l0
		
		add %g7, %l0, %g7
		
		add  %i0, -4, %i0		! n=n-4
 		add  %g5, 4, %g5		! i=i+4	update i
	

      
     	check:	cmp  %i0, 3			!if i< n
     		bg  loop 			!go to body of for
     		add  %g5, %g5, %g1		!i !delay slot filling 



	!calculation of last 3 elements has to be done using 32 bit instructions

		cmp %i0, 1
		be one	
		lduh [%i1 + %g1], %g2

		cmp %i0, 2
		be two
		lduh [%i1 + %g1], %g2

		cmp %i0, 3
		bne store
		mov  %g7, %i0

		lduh [%i1 + %g1], %g2
		lduh [%i3 + %g1], %g3
		umul %g2, %g3, %g2
		add %g2, %g7, %g7
		add %g1, 2, %g1

		lduh [%i1 + %g1], %g2	
	two:	lduh [%i3 + %g1], %g3
		umul %g2, %g3, %g2
		add %g2, %g7, %g7
		add %g1, 2, %g1

		lduh [%i1 + %g1], %g2
	one:	lduh [%i3 + %g1], %g3
		umul %g2, %g3, %g2
		add %g2, %g7, %g7
		add %g1, 2, %g1
     			
     		mov  %g7, %i0			! returning the same array
     	store:	st %g7, [%g4]
		restore 
     		retl 
     		nop
