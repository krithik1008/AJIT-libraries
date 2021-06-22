!author : Ayush Mittal 
!email  : mittalayush129@gmail.com
!date   : 18th June 2021
!Note 	: Result of the addition is in %i0
! vector operations are done on l0 l1 l2 l3
! inline abs function is implemented
! without sll operation.
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
        clr %i4					!i=0
		clr %l0
		clr %l1
		sll %g1,1,%g1
		
        cmp  %g1, 6			!if(n<4)
        ble  cond			!go to cond
        clr %g3				!delay slot filling

		clr %l3
 		clr %l2


        ldsh  [ %i1 ], %l5
        slld %l5,16,%l5	

        ldsh  [ %i1 + 2 ], %l5
		slld %l5,16,%l5
   
	    ldsh  [ %i1 + 4 ], %l7
	    slld %l7,16,%l7

	    ldsh  [ %i1 + 6 ], %l7
	    slld %l7,16,%l7

		ldd [%i1], %l0
		mov %l6, %l5
		xord %l0, %l4, %l0
		vsubd16 %l0, %l4, %l0	!l0 and l1 contain absolute value
		
        add  %g1, -8, %g1		!n-=8

        b  while
        add  %i4, 8, %i4		!i+=8 delay slot filling
 
body:         
		ldsh  [ %g3 ], %l5
        slld %l5,16,%l5	

        ldsh  [ %g3 + 2 ], %l5
		slld %l5,16,%l5
   
	    ldsh  [ %g3 + 4 ], %l7
	    slld %l7,16,%l7

	    ldsh  [ %g3 + 6 ], %l7
	    slld %l7,16,%l7

		ldd [%g3], %l2
		mov %l6, %l5
		xord %l2, %l4, %l2
		vsubd16 %l2, %l4, %l2	!l2 and l3 contain absolute value

		vaddd16 %l0, %l2, %l0

      	add  %i4, 8, %i4
      	add  %g1, -8, %g1

while:	cmp  %g1, 6
      	bg  body
        add  %g2, %i4, %g3		!delay slot filling

 		mov -1, %l4
       	!adddreduce16 %l0, %l4,  %l0

cond:   cmp  %g1, 0
      	ble  end
        adddreduce16 %l0, %l4, %l0 !delay slot filling
		
        
      	ldsh  [ %g3 ], %l1
		sra %l1,15,%l4			!
	    xor %l1, %l4, %l1		!abs(x)
	    sub %l1, %l4, %l1		!

      	add  %g1, -2, %g1
      	cmp  %g1, 0
      	ble  end
      	add %l0, %l1, %l0
 
     	ldsh  [ %g3+2 ], %l1
		sra %l1,15,%l4			!
	    xor %l1, %l4, %l1		!abs(x)
	    sub %l1, %l4, %l1		!

      	add  %g1, -2, %g1
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
