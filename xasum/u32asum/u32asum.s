!author : Ayush Mittal 
!email  : mittalayush129@gmail.com
!date   : 17th June 2021
!Note 	: Result of the addition is in %i0
!delay slot filling is performed wherever possible.
! vector operations are done on l0 l1 l2 l3
! inline abs function is implemented
! sll optimization has been performed
! inefficient for n<4

.section ".bss"
.common datak,400,4


.section ".text"
.align 4
.global u32asum
.type u32asum, #function

u32asum:
       	save  %sp, -120, %sp
       	!st  %i0, [ %fp + 0x44 ]	!n
      	!st  %i1, [ %fp + 0x48 ]	!arr
       	!st  %i2, [ %fp + 0x4c ]	!incx
		sll %i0, 2 ,%i0

       	add  %i0, -4, %l5		!l5=n-1
       	mov  8, %l4				!l4=i=2
       
       	ld  [ %i1 ], %l0		!l0 =|arr[0]|
		sra %l0,31,%g1			!instructions to 
		xor %l0, %g1, %l0		!find the abs value
		sub %l0, %g1, %l0		!without branching
			
		cmp %i0 ,8				!if n<2
		bl,a end				!end the call
		mov  %l0, %i0
	
      	ld  [ %i1 + 4 ], %l1	!l1=|arr[1]|
		sra %l1,31,%g1			!
		xor %l1, %g1, %l1		!abs(x)
		sub %l1, %g1, %l1		!

     	cmp  %i0, 12			!if (n>=4) go to else
       	ble,a  else
       	add  %l0, %l1, %l0		!delay slot filling 
 
		and  %i0, 7, %g1		!n%2!=0
	 	cmp  %g1, 0				!if n is odd
       	be  for					!add the last element
		nop						!to the sum 
 		
      	add  %i1, %l5, %g1		!adding last element
      	ld  [ %g1 ], %g1		!to the sum 
		sra %g1,31,%g2
		xor %g1, %g2, %g1
		sub %g1, %g2, %g1
       	add  %l0, %g1, %l0		!|arr[0]|+=|arr[n-1]|
      	mov %l5, %i0
      	b  for
      	nop 

body:	
		ld [%g1], %l2
		sra %l2,31,%g2

		ld [%g1+4], %l3
		sra %l3,31,%g3

		xord %l2,%g2,%l2
		vsubd32 %l2,%g2,%l2
		
		vaddd32 %l0, %l2, %l0
      	add  %l4, 8, %l4

for:	cmp  %l4, %i0		! for loop to add array of 
     	bl,a  body			! even length 
     	add %l4, %i1, %g1

      	add  %l0, %l1, %l0
      	b  end
		mov  %l0, %i0
 
else:						! else statement to handel 
		cmp %i0 ,8			! no. of elements less than 4
		be,a end
		mov  %l0, %i0
		
		ld  [ %i1 + 8 ], %l1	!l1=|arr[1]|
		sra %l1,31,%g1
		xor %l1, %g1, %l1
		sub %l1, %g1, %l1
		add  %l0, %l1, %l0 
		mov  %l0, %i0     
end: 	
     	restore 
     	retl 
     	nop 

