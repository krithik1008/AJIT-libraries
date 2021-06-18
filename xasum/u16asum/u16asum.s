!author : Ayush Mittal 
!email  : mittalayush129@gmail.com
!date   : 18th June 2021
!Note 	: Result of the addition is in %i0
!delay slot filling is performed wherever possible.
! vector operations are done on l0 l1 l2 l3
! inline abs function is implemented

.section ".bss"
.common datak,400,4


.section ".text"
.align 4
.global u16asum
.type u16asum, #function

u16asum:
		save  %sp, -96, %sp
		mov  %i0, %g1			!g1=n
        mov  %i1, %g2			!g2=arr
        clr %i4				!i=0
		clr %l0
		clr %l1
		
        cmp  %g1, 3			!if(n<4)
        ble  cond			!go to cond
        clr %g3				!delay slot filling

		clr %l3
 		clr %l2

        ldsh  [ %g2 ], %l0
        sra %l0,15,%l4			!
	    xor %l0, %l4, %l0		!abs(x)
	    sub %l0, %l4, %l0		!

        ldsh  [ %g2 + 2 ], %i3
	    sra %i3,15,%l4			!
	    xor %i3, %l4, %i3		!abs(x)
	    sub %i3, %l4, %i3		!
	    sll %i3, 16, %i3
	    or %i3, %l0, %l0

	    ldsh  [ %g2 + 4 ], %l1
	    sra %l1,15,%l4			!
	    xor %l1, %l4, %l1		!abs(x)
	    sub %l1, %l4, %l1		!

	    ldsh  [ %g2 + 6 ], %i3
	    sra %i3,15,%l4			!
	    xor %i3, %l4, %i3		!abs(x)
	    sub %i3, %l4, %i3		!
	    sll %i3, 16, %i3
	    or %i3, %l1, %l1

        add  %g1, -4, %g1		!n+=4

        b  while
        add  %i4, 4, %i4		!i+=4 delay slot filling
 
body:   add  %g2, %g3, %g3      

		ldsh  [ %g3 ], %l2
        sra %l2,15,%l4			!
	    xor %l2, %l4, %l2		!abs(x)
	    sub %l2, %l4, %l2		!

        ldsh  [ %g3 + 2 ], %i3
	    sra %i3,15,%l4			!
	    xor %i3, %l4, %i3		!abs(x)
	    sub %i3, %l4, %i3		!
	    sll %i3, 16, %i3
	    or %i3, %l2, %l2

	    ldsh  [ %g3 + 4 ], %l3
	    sra %l3,15,%l4			!
	    xor %l3, %l4, %l3		!abs(x)
	    sub %l3, %l4, %l3		!

	    ldsh  [ %g3 + 6 ], %i3
	    sra %i3,15,%l4			!
	    xor %i3, %l4, %i3		!abs(x)
	    sub %i3, %l4, %i3		!
	    sll %i3, 16, %i3
	    or %i3, %l3, %l3

		vaddd16 %l0, %l2, %l0

      	add  %i4, 4, %i4
      	add  %g1, -4, %g1

while:	cmp  %g1, 3
      	bg  body
        add  %i4, %i4, %g3		!delay slot filling

 		mov -1, %l4
       	adddreduce16 %l0, %l4,  %l0

cond:   cmp  %g1, 0
      	ble  end
       
		!add  %i4, %i4, %g3		!already computed in while delay slot
        add  %g2, %g3, %g3		!delay slot filling

      	ldsh  [ %g3 ], %l1
		sra %l1,15,%l4			!
	    xor %l1, %l4, %l1		!abs(x)
	    sub %l1, %l4, %l1		!

      	add  %g1, -1, %g1
      	cmp  %g1, 0
      	ble  end
      	add %l0, %l1, %l0
 
     	ldsh  [ %g3+2 ], %l1
		sra %l1,15,%l4			!
	    xor %l1, %l4, %l1		!abs(x)
	    sub %l1, %l4, %l1		!

      	add  %g1, -1, %g1
      	cmp  %g1, 0
      	ble  end
      	add %l0, %l1, %l0

		ldsh  [ %g3+4 ], %l1
		sra %l1,15,%l4			!
	    xor %l1, %l4, %l1		!abs(x)
	    sub %l1, %l4, %l1		!
		add %l0, %l1, %l0

end:
      	mov  %l0, %i0
      	restore 
     	retl 
      	nop 
