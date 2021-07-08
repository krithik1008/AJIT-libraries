!author : Krithik sankar 
!email  : krithik.sankar10@gmail.com
!date   : 20th June 2021

!.section ".bss"
!.common datak,400,4

.section ".text"
.align 4
.global conv
.type conv, #function
	
   conv:	save  %sp, -104, %sp
		st  %i0, [ %fp + 0x44 ]	!nx (sx)
      		st  %i1, [ %fp + 0x48 ]	!arr x
      		st  %i2, [ %fp + 0x4c ]	!ny (sy)
		st  %i3, [ %fp + 0x50 ]	!arr y
		st  %i4, [ %fp + 0x54 ] !arr res


		mov -8, %g4			!registers for effective array traversal
		mov 8, %g5		
		
		

		clr %g2			!tx=0			
		mov %i2, %g3		!ty=ny
		clr %g1			!i=0
		st %i2, [ %fp  + -4 ]	!temp=ny
		clr %l6			!no=0

		add  %i0, %i2, %i5	!i5=nx+ny-1
		add  %i5, -1, %i5
		
		b check_conv
  

  loop_conv:	!cmp %g1, %i2
		bge,a p1
		inc %g2
		add %g3, -1, %g3
		cmp %l6, %i0
		bge p3
		nop
		inc %l6

   p3:		b u8dot			!res[i]=u8dot(no,&x[tx],1,&y[ty],1);
		nop	


   p1:		!inc %g2
		ld [ %fp + -4], %l0
		cmp %l0, %i0
		ble p2
		inc %l0
		add %l6, -1, %l6

   p2:		!inc %l0
		st %l0, [ %fp + -4]
		b u8dot				!res[i]=u8dot(no,&x[tx],1,&y[ty],1)
		nop	


  check_conv:	cmp %i5, %g1
		bg,a loop_conv
		cmp %g1, %i2
		mov %i5, %i0		!returning starting add. of result array
		restore 
     		retl 
     		nop
		
		
		

   u8dot:	

		sethi %hi(0xFFFFFFFF),%g6	!mask for adddreduce8
		or    %g6,%lo(0xFFFFFFF),%g6
		!mov %i0, %l6
		
		sll %g2, 1, %l5
		sll %g3, 1, %l7		
		
		b check	
		clr %g7				!temp result will be stored in g7

      loop:	!array y
		ldd [%i3+%l7], %l2		!loading value of array y in l2 l3

		vumuld8 %l2, %l0, %l2		! (x*y)

		adddreduce8 %l2, %g6, %l0
		
		add %g7, %l0, %g7
		
		vaddd32 %l6, %g4, %l6
		! n=n-4
 		! i=i+4	update i
		add %l5, %g5, %l5 
	

      
     	check:	cmp  %l6, 7			!if n>7
     		bg,a  loop 			!go to body of for
		ldd [%i1+%l5], %l0     		!loading value of array x in l0 l1	!delay slot filling 



	!calculation of last 7 elements has to be done seperately
	!setting the mask for last 7 remaining elements accordingly 

		!ldd [%i1+%l5], %l0
		!ldd [%i3+%l7], %l2
		ld [%i1+%l5], %l0
		!add %l5, 4, %l5
		!ld [%i1+%l5], %l1
		!ld [%i3+%l7], %l2
		!add %l7, 4, %l7
		!ld [%i3+%l7], %l2
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
		sll %g1, 1, %l1
		stub %g7, [ %i5 + %l1 ]	! returning the result
		b check_conv
		inc %g1
