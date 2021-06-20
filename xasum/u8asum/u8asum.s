!author : Ayush Mittal 
!email  : mittalayush129@gmail.com
!date   : 20th June 2021
!Note 	: Result is 8 bit sum 
!delay slot filling is performed wherever possible.
!more optimized code than compiler generates.
!info about load store
!m8 m7 m6 .... m0 in memory m0 = byte
!a0 a1 a2......a7 in register a = byte
!m0 m1 m2 .....m7

.section ".bss"
.common datak, 400,4

.section ".text"
.align 4
.global u8asum
.type u8scal, #function

u8asum:
		save  %sp, -104, %sp
        !  %i0	!n
        !  %i1	!arr0
        !  %i3	!incx
	    !set 0x40000000, %g1	!arr

								!g3 contain arr in the beginning
								!in while loop in contain the exact
								!address
        cmp %i0,8
	   	bl o
	    mov %i1, %g3

		ldsb  [ %g3 ], %l5		!mask formation in 		
		slld %l5,8,%l5			!%l4 and %l6

		ldsb  [ %g3 + 1 ], %l5	!mask look like:
		slld %l5,8,%l5			!0xff00ff00 if second 
								!and fourth byte is negative
		ldsb  [ %g3 + 2 ], %l5
		slld %l5,8,%l5		

		ldsb  [ %g3 + 3 ], %l5
		slld %l5,8,%l5				 

		ldsb  [ %g3 + 4 ], %l7			
		slld %l7,8,%l7   

		ldsb  [ %g3 + 5 ], %l7		
		slld %l7,8,%l7

		ldsb  [ %g3 + 6 ], %l7
		slld %l7,8,%l7	

		ldsb  [ %g3 + 7 ], %l7
		slld %l7,8,%l7	

		ldd [%g3], %l0			!%l4 contain mask for %l0	
								!%l5 contain mask for %l1
		mov %l6, %l5			
		xord %l0, %l4, %l0
		vsubd8 %l0, %l4, %l0	!l0 and l1 contain absolute value

       
		add  %i0, -8, %i0		!n-=8 remaining elements
  
        b  while
       	mov 8, %i4				!i=0 delay slot


body:   ldsb  [ %g3 ], %l5		!mask formation in 		
		slld %l5,8,%l5			!%l4 and %l6

		ldsb  [ %g3 + 1 ], %l5	!mask look like:
		slld %l5,8,%l5			!0xff00ff00 if second 
								!and fourth byte is negative
		ldsb  [ %g3 + 2 ], %l5
		slld %l5,8,%l5		

		ldsb  [ %g3 + 3 ], %l5
		slld %l5,8,%l5				 

		ldsb  [ %g3 + 4 ], %l7			
		slld %l7,8,%l7   

		ldsb  [ %g3 + 5 ], %l7		
		slld %l7,8,%l7

		ldsb  [ %g3 + 6 ], %l7
		slld %l7,8,%l7	

		ldsb  [ %g3 + 7 ], %l7
		slld %l7,8,%l7	

		ldd [%g3], %l2			!%l4 contain mask for %l2	
								!%l5 contain mask for %l3
		mov %l6, %l5			!%l4 and %l5 contain mask
		xord %l2, %l4, %l2
		vsubd8 %l2, %l4, %l2
	  
		vaddd8 %l0, %l2, %l0		

		add  %i0, -8, %i0		!n-=8 remaining elements
		add  %i4, 8, %i4		!i+=8 address index

while:
     	cmp  %i0, 7
     	bg  body
     	add %i1, %i4 ,%g3		!delay slot
		
		mov -1, %g4
		adddreduce8 %l0, %g4, %l0		

 
	  	cmp  %i0 ,0			! if no elements left
	  	be def				! exit the function

!xxxxxxxxxxxx processing remainng elements xxxxxxxxxxx! 


o:	    ldsb [ %g3 ], %l1
	    sra %l1,8,%l4			!
	    xor %l1, %l4, %l1		!abs(x)
	    sub %l1, %l4, %l1		!
        cmp  %i0 ,1
	    be def
	    add %l0, %l1, %l0

tw:	    ldsb [ %g3 + 1 ], %l1
	    sra %l1,8,%l4			!
	    xor %l1, %l4, %l1		!abs(x)
	    sub %l1, %l4, %l1		!
        cmp  %i0 ,2
	    be def
	    add %l0, %l1, %l0
	
th:	    ldsb [ %g3 + 2 ], %l1
	    sra %l1,8,%l4			!
	    xor %l1, %l4, %l1		!abs(x)
	    sub %l1, %l4, %l1		!
        cmp  %i0 ,3
	    be def
	    add %l0, %l1, %l0

fr:	    ldsb [ %g3 + 3 ], %l1
	    sra %l1,8,%l4			!
	    xor %l1, %l4, %l1		!abs(x)
	    sub %l1, %l4, %l1		!
        cmp  %i0 ,4
	    be def
	    add %l0, %l1, %l0

fv:	    ldsb [ %g3 + 4 ], %l1
	    sra %l1,8,%l4			!
	    xor %l1, %l4, %l1		!abs(x)
	    sub %l1, %l4, %l1		!
        cmp  %i0 ,5
	    be def
	    add %l0, %l1, %l0

sx:	    ldsb [ %g3 + 5 ], %l1
	    sra %l1,8,%l4			!
	    xor %l1, %l4, %l1		!abs(x)
	    sub %l1, %l4, %l1		!
        cmp  %i0 ,6
	    be def
	    add %l0, %l1, %l0

sv:	    ldsb [ %g3 + 5 ], %l1
	    sra %l1,8,%l4			!
	    xor %l1, %l4, %l1		!abs(x)
	    sub %l1, %l4, %l1		!
        cmp  %i0 ,7
	    be def
	    add %l0, %l1, %l0

	
def:
        mov  %l0, %i0			! exit
        restore 
        retl 
        nop 
