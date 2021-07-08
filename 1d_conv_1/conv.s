!author : Krithik sankar 
!email  : krithik.sankar10@gmail.com
!date   : 20th June 2021

!ensure the size of array y< size of array x
!starting of address of the arrays must be double word aligned

!.section ".bss"
!.common datak,400,4

.section ".text"
.align 4
.global u8dot
.type u8dot, #function

   u8dot:	save  %sp, -104, %sp
      		st  %i0, [ %fp + 0x44 ]	!nx
      		st  %i1, [ %fp + 0x48 ]	!arr x
      		st  %i2, [ %fp + 0x4c ]	!ny
		st  %i3, [ %fp + 0x50 ]	!arr y
		st  %i4, [ %fp + 0x54 ] !load
		st  %i5, [ %fp + 0x58 ] !shift

		!mov 2, %g3
		
		!set  datak, %g4			!results stored in mem
		
		mov %i2, %l6
		mov %i4, %l7

		!mov 1, %o2
		umul %i5, 8, %g2

		mov -8, %g4			!registers for effective array traversal
		mov 8, %g5		
		sethi %hi(0xFFFFFFFF),%g6	!mask for adddreduce8
		or    %g6,%lo(0xFFFFFFF),%g6


		sub %g5, %i5, %g1
		umul %g1, 8, %g1
		
		b check	
		clr %g7				!temp result will be stored in g7

      loop:	!array y
		ldd [%i3+%l7], %l2		!loading value of array y in l2 l3
		srld %l2, %g2, %l2

		!mov 2, %g3
	
		cmp %o2,1
		be iter 
		clr %o2
		sub %l7, 8, %i6
		ldd [%i3+%i6], %l4
		slld %l4, %g1, %l4
		ord %l2, %l4, %l2

	iter:	vumuld8 %l2, %l0, %l2		! (x*y)

		adddreduce8 %l2, %g6, %l0
		
		add %g7, %l0, %g7

		!mov 2, %g3		!!!!!
		
		
		vaddd32 %l6, %g4, %l6
		! n=n-4
 		! i=i+4	update i
		add %l6, %i5, %l6
		
	

      
     	check:	cmp  %l6, 7			!if n>7
     		bg,a  loop 			!go to body of for
		ldd [%i1+%l7], %l0     		!loading value of array x in l0 l1	!delay slot filling 



	!calculation of last 7 elements has to be done seperately
	!setting the mask for last 7 remaining elements accordingly 
		
		cmp %i2, 7
		bg part1
		nop 		
		add %l6, %i5, %l6		
		ldd [%i1+%l7], %l0
		ldd [%i3+%l7], %l2
		slld %l0, %g2, %l0
		add %l7, 8, %l7
		ldd [%i1+%l7], %l4
		srld %l4, %g1, %l4
		ord %l0, %l4, %l0
		b calc
		nop

part1:		add %l6, %i5, %l6		
		ldd [%i1+%l7], %l0
		ldd [%i3+%l7], %l2
		srld %l2, %g2, %l2
		sub %l7, 8, %l7
		ldd [%i3+%l7], %l4
		slld %l4, %g1, %l4
		ord %l2, %l4, %l2
		

calc:		vumuld8 %l2, %l0, %l2

		clr %g6
		
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
		mov %g7, %i0	! returning the result
		restore 
     		retl 
     		nop
