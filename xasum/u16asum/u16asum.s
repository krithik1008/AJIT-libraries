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
        mov  %i1, %g3			!g2=arr
		set 0x80008000, %i4 ! mask for finding
		set 0x80008000, %i5 ! absolute
		set -1, %o0			! used for finding
		set -1, %o1			! absolute
		clr %l0
	
        cmp  %g1, 3			!if(n<4)
        ble  cond			!go to cond
        clr %l1

		ldd [%g3], %l0			! %l0 %l1 contain data
		anddn %i4, %l0, %o2		! forming mask with sign
		srld %o2, 15, %o2		! bit
		vaddd16 %o0, %o2, %o2
		xord %l0, %o2, %l0		! finding absolute
		vsubd16 %l0, %o2, %l0	
        b  while
        add  %g1, -4, %g1		!n-=8
 
body:   ldd [%g3], %l2			! %l0 %l1 contain data
		add  %g1, -4, %g1
		anddn %i4, %l2, %o2		! forming mask with sign
		srld %o2, 15, %o2		! bit
		vaddd16 %o0, %o2, %o2
		xord %l2, %o2, %l2  	! finding absolute
		vsubd16 %l2, %o2, %l2	
		vaddd16 %l0, %l2, %l0
      	
while:	cmp  %g1, 3
      	bg  body
        add  %g3, 8, %g3		!delay slot filling

 		mov -1, %l4
       	!adddreduce16 %l0, %l4,  %l0

cond:   cmp  %g1, 0
      	ble  end
        adddreduce16 %l0, %l4, %l0 !delay slot filling
		
        
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
