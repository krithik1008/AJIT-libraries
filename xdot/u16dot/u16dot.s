!author : Krithik sankar 
!email  : krithik.sankar10@gmail.com
!date   : 16th June 2021

!.section ".bss"
!.common datak,400,4

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

		!set  datak, %g4			!results stored in mem
		
		clr %g5
		mov %i0, %l6
		clr %l7
		mov -4, %l4				!registers for effective array traversal
		mov 8, %l5		
		sethi %hi(0xFFFFFFFF),%g6		!mask for adddreduce16
		or    %g6,%lo(0xFFFFFFF),%g6
		
		b check	
		clr %g7					!temp result will be stored here	

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
			lduh  [ %g2 ], %l2		!arr &y[0]
      			lduh [ %g2 + 2 ], %g3	
			sll %g3, 16, %g3
			or %g3, %l2, %l2
			lduh [ %g2 + 4 ], %l3	
			lduh [ %g2 + 6 ], %g3	
      			sll %g3, 16, %g3
			or %g3, %l3, %l3
			*/

		ldd [%i3+%l7], %l2		!loading value of array y in l2 l3

		vumuld16 %l2, %l0, %l2		! (x*y)

		adddreduce16 %l2, %g6, %l0	!summing
		
		add %g7, %l0, %g7		!adding value to temp
		
		vaddd32 %l6, %l4, %l6
		!add  %l6, -4, %l6		! n=n-4
 		!add  %g5, 4, %g5		! i=i+4	update i
	

      
     	check:	cmp  %l6, 3			!if n>3
     		bg  loop 			!go to body of for
		ldd [%i1+%l7], %l0		!loading value of array x in l0 l1		!delay slot filling 



	!calculation of last 3 elements has to be done using 32 bit instructions

		cmp %l6, 1
		be one	
		lduh [%i1 + %l7], %g2

		cmp %l6, 2
		be two
		lduh [%i1 + %l7], %g2

		cmp %l6, 3
		bne store
		mov  %g7, %i0

		lduh [%i1 + %l7], %g2
		lduh [%i3 + %l7], %g3
		umul %g2, %g3, %g2
		add %g2, %g7, %g7
		add %l7, 2, %l7

		lduh [%i1 + %l7], %g2	
	two:	lduh [%i3 + %l7], %g3
		umul %g2, %g3, %g2
		add %g2, %g7, %g7
		add %l7, 2, %l7

		lduh [%i1 + %l7], %g2
	one:	lduh [%i3 + %l7], %g3
		umul %g2, %g3, %g2
		add %g2, %g7, %g7
		add %l7, 2, %l7
     			
     		mov  %g7, %i0			! returning the result
     	store:	!st %g7, [%g4]
		restore 
     		retl 
     		nop
