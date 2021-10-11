!author : Krithik sankar 
!email  : krithik.sankar10@gmail.com
!date   : 26th June 2021

!ensure the size of array y< size of array x
!starting of address of the arrays must be double word aligned

.section ".bss"
.common datak,400,4

.section ".text"
.align 4
.global u8dot
.type u8dot, #function

   u8dot:	save  %sp, -104, %sp
      		st  %i0, [ %fp + 0x44 ]	!nx (number of row elements of im2col)
      		st  %i1, [ %fp + 0x48 ]	!ny (number of cols in im2col)
      		st  %i2, [ %fp + 0x4c ]	!img x (im2col)
		st  %i3, [ %fp + 0x50 ]	!kernal 
		st  %i4, [ %fp + 0x54 ] !result

		mov %i4, %o2			!index of result
		clr %l7		
		clr %g1

		mov 8, %l4			!registers for effective array traversal
		mov 8, %l5		
		mov 255, %g6			!mask for addreduce

		
	
	outer:	clr %g7				!temp result will be stored in g7
		clr %l6
		ldd [%i2+%l7], %l0     		!loading value of array x in l0 l1

		
	loop:	!array y
		ldd [%i3+%l6], %l2		!loading value of array y in l2 l3
		

		vumuld8 %l2, %l0, %l2		! (x*y)

				
		adddreduce8 %l2, %g6, %l0
		
		add %g7, %l0, %g7
		
		!mov %g7, %g2
		!mov %l1, %g3
		!cmp %l6, 8		
		!be store
		!nop
		
		vaddd32 %l6, %l4, %l6		!l6 is used to traverse the kernal 
						!l7 is used to traverse the input matrix

	check:	cmp  %l6, %i0			!if n<16
     		bl,a  loop 			!go to body of for
		ldd [%i2+%l7], %l0     		!loading value of array x in l0 l1!delay slot

		stub %g7, [%o2]			!storing result 
		inc %o2		
			
		cmp %g1, %i1
		bl,a outer
		inc %g1		
		
	store:	mov %i4, %i0	! returning the result
		restore 
     		retl 
     		nop



		
		
