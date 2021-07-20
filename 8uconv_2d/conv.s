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
      		st  %i0, [ %fp + 0x44 ]	!nx
      		st  %i1, [ %fp + 0x48 ]	!ny
      		st  %i2, [ %fp + 0x4c ]	!img x
		st  %i3, [ %fp + 0x50 ]	!kernal 
		st  %i4, [ %fp + 0x54 ] !result
		
		mov 0, %o3
		clr %g1			!i=0
		clr %g5			!j=0
		clr %g7			!temp variable
		st %g7, [%fp + -4]

		mov %i4, %o2
		mov 224, %g3		!mask for adddreduce

		sub %i0, 3, %l7
		st %l7, [%fp + -8]	!nx-3

		sub %i1, 3, %l7
		st %l7, [%fp + -12]	!ny-3

		ld [%i3], %g2		!loading the values of the kernal
		ld [%i3+4], %g4
		ld [%i3+8], %g6

		ld [%fp + -4], %g7	!loading val of first window of input matrix
		ldd [%i2 + %g7], %l0
		add %g7, %i1, %g7
		st %g7, [%fp + -4]
		ldd [%i2 + %g7], %l2
		add %g7, %i1, %g7
		ldd [%i2 + %g7], %l4
			
		st %g7, [%fp + -16]
	
		b first
		vumuld8 %l0, %g2, %l6
	
		ld [%fp + -4], %g7	!shifting the input matrix window to the next row
loop1:		ldd [%i2 + %g7], %l0
		add %g7, %i1, %g7
		st %g7, [%fp + -4]
		ldd [%i2 + %g7], %l2
		add %g7, %i1, %g7
		ldd [%i2 + %g7], %l4
		st %g7, [%fp + -16]
		cmp %g1, 0	
		be,a first	
		vumuld8 %l0, %g2, %l6
			
		
loop2:		mov 224, %g3		!shifting the input matrix window to the right
		ld [%fp + -16], %g7		
		add %g1, 7, %l7
		add %g7, %l7, %g7
		slld %l4, 8, %l4
			
		ldub [%i2 + %g7], %l7
		or %l5, %l7, %l5
		sub %g7, %i1, %g7
		slld %l2, 8, %l2
		ldub [%i2 + %g7], %l7
		or %l3, %l7, %l3
		sub %g7, %i1, %g7
		slld %l0, 8, %l0
		ldub [%i2 + %g7], %l7
		or %l1, %l7, %l1
		
		vumuld8 %l0, %g2, %l6		!multiply and add operations
first:		adddreduce8 %l6, %g3, %l6
						
		add %o3, %l6, %o3
		
		vumuld8 %l2, %g4, %l6
		adddreduce8 %l6, %g3, %l6
			
		add %o3, %l6, %o3
			
		vumuld8 %l4, %g6, %l6
		adddreduce8 %l6, %g3, %l6
		
		add %o3, %l6, %o3
			
		stub %o3, [%o2]			!storing result 
		inc %o2
		inc %g1				!j=j+1
		
check:		ld [%fp + -12], %l7		!load ny-3
		cmp %g1, %l7			!if j<ny-3
		ble loop2
		mov 0, %o3			!clearing temp result variable
		clr %g1				!j=0
		inc %g5				!i=i+1
		ld [%fp + -8], %l7		!load nx-3
		cmp %g5, %l7			!if i<nx-3
		ble loop1
		ld [%fp + -4], %g7
     
store:		mov %i4, %i0	! returning the result
		restore 
     		retl 
     		nop
