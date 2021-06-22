!author : Ayush Mittal, Krithik sankar 
!email  : mittalayush129@gmail.com, krithik.sankar10@gmail.com
!date   : 10th June 2021
!ldd instruction used instead of loading every word.
!sll optimization
.section ".bss"
.common datak, 400,4


.section ".text"
.align 4
.global sscal
.type sscal, #function
sscal:
		save  %sp, -104, %sp
		!st  %i0, [ %fp + 0x44 ]		!n
		sll %i0, 2, %i0

       	st  %i1, [ %fp + -4 ]
       	ld  [ %fp + -4 ], %f8		!alphas in l8
		
       	mov  %i2, %g1				!arr
       	clr  %i5					!i=0
       	add  %i0, -4, %i4			!x=n-1

       	and  %i0, 7, %g2			!n%2!=0
       	cmp  %g2, 0
       	be  for
       	fmovs %f8, %f9			!l9 delay slot
						
       	add  %g1, %i4, %g2

       	ld  [ %g2 ], %f10
       	fmuls  %f10, %f8, %f10
       	st  %f10, [ %g2 ]
	
       	b  for
       	mov %i4, %i0 			!delay slot filling

body:  
       	ldd  [ %g2 ], %f10
		vfmul32 %f8, %f10, %f10
       	std  %f10, [ %g2 ]
       	add  %i5, 8, %i5
for:	
       	cmp  %i5, %i0
       	bl,a  body
       	add  %g1, %i5, %g2
 
      	mov  %g1, %i0
      	restore 
      	retl 
      	nop 
