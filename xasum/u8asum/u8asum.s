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

.section ".text"
.align 4
.global u8asum
.type u8scal, #function

u8asum:
		save  %sp, -104, %sp
        !  %i0	!n
        !  %i1	!arr0
        !  %i3	!incx
		set 0x80808080, %i4 ! mask for finding
		set 0x80808080, %i5 ! absolute

        cmp %i0,8
	   	bl o
	    mov %i1, %g3

		ldd [%g3], %l0			! %l0 %l1 contain data
		andd %l0, %i4, %o2		! %o2 %o3 %o4 %o5 used for
		srld %o2, 1,   %o4		! mask
		ord %o2, %o4,  %o2		!
		srld %o2, 2,   %o4		!
		ord %o2, %o4,  %o2		! to find the absolute
		srld %o2, 4,   %o4		!
		ord %o2, %o4,   %o2		!
		xord %l0, %o2, %l0		!
		vsubd8 %l0, %o2, %l0	

        b  while
       	add  %i0, -8, %i0		!n-=8 remaining elements


body:   ldd [%g3], %l2			! %l2 %l3 contain data
		andd %l2, %i4, %o2		! %o2 %o3 %o4 %o5 used for
		srld %o2, 1,   %o4		! mask
		ord %o2, %o4,  %o2		!
		srld %o2, 2,   %o4		!
		ord %o2, %o4,  %o2		! to find the absolute
		srld %o2, 4,   %o4		!
		ord %o2, %o4,   %o2		!
		xord %l2, %o2, %l2		!
		vsubd8 %l2, %o2, %l2	!

		vaddd8 %l0, %l2, %l0		
		add  %i0, -8, %i0		!n-=8 remaining elements
while:
     	cmp  %i0, 7
     	bg  body
     	add %g3, 8, %g3
		
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

	
def:	mov  %l0, %i0			! exit
        restore 
        retl 
        nop 
