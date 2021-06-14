!author : Ayush Mittal, Krithik sankar 
!email  : mittalayush129@gmail.com, krithik.sankar10@gmail.com
!date   : 10th June 2021

.section ".bss"
.common datak, 400,4


.section ".text"
.align 4
.global sscal
.type sscal, #function

   sscal:	save  %sp, -104, %sp
      		st  %i0, [ %fp + 0x44 ]
      		st  %i1, [ %fp + 0x48 ]
      		st  %i2, [ %fp + 0x4c ]
      		st  %i3, [ %fp + 0x50 ]

      		ld  [ %fp + 0x48 ], %f10	!alpha
      		ld  [ %fp + 0x48 ], %f11	!alpha

      		clr  [ %fp + -4 ]		!k=0
      		clr  [ %fp + -8 ]		!i=0
      		ld  [ %fp + 0x44 ], %g1		! n is even ?
      		and  %g1, 1, %g1
      		cmp  %g1, 0			! n is even ?
      		bne  ac 			!b if odd  
      		nop 
      		ld  [ %fp + 0x44 ], %g1		!n is even
      		st  %g1, [ %fp + -4 ]
      		b  fc 				!b to for 
      		nop 
      ac:	ld  [ %fp + 0x44 ], %g1		!k=n-1
      		add  %g1, -1, %g1		!k=n-1
      		st  %g1, [ %fp + -4 ]		!k=n-1
      		b  fc 				!b to for
      		nop 
      c0:	ld  [ %fp + -8 ], %g1		!i
      		sll  %g1, 2, %g1		!i*4
      		set  datak, %g2			!results stored in mem
      		add  %g2, %g1, %g1		!mp=mp+(i*4) d
      		ld  [ %fp + -8 ], %g2		!i
      		sll  %g2, 2, %g2		!i*4
      		ld  [ %fp + 0x4c ], %g3		!&arr[0]
      		add  %g3, %g2, %g2		!arr=arr+(i*4) o
      		ld  [ %g2 ], %f8		!load[arr+i*4] pair in f8 f9
		ld  [ %g2 +4 ], %f9
      		vfmul32 %f8, %f10, %f12		!multiply
      		st  %f12, [ %g1 ]		!stroring in d
		st  %f13, [ %g1 +4 ]		!stroring in d
      		ld  [ %fp + -8 ], %g1		!i 
      		add  %g1, 2, %g1		! i=i+2
      		st  %g1, [ %fp + -8 ]		! update i 
      fc:	ld  [ %fp + -8 ], %g2	!i   for loop 
     		ld  [ %fp + -4 ], %g1	!k
     		cmp  %g2, %g1		!if i< k
     		bl  c0 			!go to body of for
     		nop 
     		ld  [ %fp + 0x44 ], %g1	! if n is odd
     		and  %g1, 1, %g1	! if n is odd
     		cmp  %g1, 0		! if n is odd 
     		be  fd 	
     		nop 
     		ld  [ %fp + 0x44 ], %g1	! load n 
     		add  %g1, -1, %g1	! n-1
     		sll  %g1, 2, %g1	! (n-1)*4
     		set datak, %g2 		! load mem addresss
     		add  %g2, %g1, %g1	! last element addr d
     		ld  [ %fp + 0x44 ], %g2 ! load n 
     		add  %g2, -1, %g2	! n-1
     		sll  %g2, 2, %g2	! (n-1)*4
     		ld  [ %fp + 0x4c ], %g3	! arr
     		add  %g3, %g2, %g2	! last element addr o
     		ld  [ %g2 ], %f9
     		fmuls  %f9, %f10, %f8	! last addition 
     		st  %f8, [ %g1 ]	! storing the last element
     fd:	set  datak, %g1 ! ld arr 
     		mov  %g1, %i0		! returning the same array
     		restore 
     		retl 
     		nop 
