!author : Krithik sankar 
!email  : krithik.sankar10@gmail.com
!date   : 20th June 2021

!.section ".bss"
!.common datak,400,4

.section ".text"
.align 4
.global u8dot
.type u8dot, #function

   u8dot:	save  %sp, -104, %sp
      		st  %i0, [ %fp + 0x44 ]	!n
      		st  %i1, [ %fp + 0x48 ]	!arr x
      		st  %i2, [ %fp + 0x4c ]	!incx
		st  %i3, [ %fp + 0x50 ]	!arr y
		st  %i4, [ %fp + 0x54 ] !incy

		!set  datak, %g4			!results stored in mem
		
		clr %g5
		mov %i0, %l6
		clr %l7

		mov -8, %l4			!registers for effective array traversal
		mov 8, %l5		
		sethi %hi(0xFFFFFFFF),%g6	!mask for adddreduce8
		or    %g6,%lo(0xFFFFFFF),%g6
		
		b check	
		clr %g7				!temp result will be stored in g7

      loop:	! array y
		ldd [%i3+%l7], %l2		!loading value of array y in l2 l3

		vumuld8 %l2, %l0, %l2		! (x*y)

		adddreduce8 %l2, %g6, %l0
		
		add %g7, %l0, %g7
		
		vaddd32 %l6, %l4, %l6
		! n=n-4
 		! i=i+4	update i
	
     	check:	cmp  %l6, 7			!if n>7
     		bg  loop 			!go to body of for
		ldd [%i1+%l7], %l0     		!loading value of array x in l0 l1	!delay slot filling 


	!calculation of last 7 elements has to be done seperately
	!setting the mask for last 7 remaining elements accordingly 

		ldd [%i1+%l7], %l0
		ldd [%i3+%l7], %l2
		vumuld8 %l2, %l0, %l2
		
		cmp %l6, 1
		be,a store
		mov 128, %g6 	!128

		cmp %l6, 2
		be,a store
		mov 192, %g6 	!192 
	
		cmp %l6, 3
		be,a store
		mov 224, %g6 	!224 

		cmp %l6, 4
		be,a store
		mov 240, %g6 	!240 
	
		cmp %l6, 5
		be,a store
		mov 248, %g6 	!248 
	
		cmp %l6, 6
		be,a store
		mov 252, %g6 	!252 

		cmp %l6, 7
		be,a store
		mov 254, %g6 	!254 

     	store:	adddreduce8 %l2, %g6, %l0
		add %g7, %l0, %g7
		mov 255, %g6
		and %g7, %g6, %g7
		stub %g7, [ %fp + 0x44 ]
		ldub [ %fp + 0x44 ], %i0	! returning the result
		restore 
     		retl 
     		nop
