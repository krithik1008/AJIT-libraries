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

       	st  %i1, [ %fp + -4 ]		!storing alpha in memory
		mov  %i2, %g1				!arr
       	clr  %i5					!i=0
       	ld  [ %fp + -4 ], %f8		!alphas in f8
       	add  %i0, -4, %i4			!x=n-1(scaled version)

       	and  %i0, 7, %g2			!n%2!=0
       	cmp  %g2, 0
       	be  for
       	fmovs %f8, %f9			!l9 delay slot
		
       	ld  [ %g1 + %i4 ], %f10
       	fmuls  %f10, %f8, %f10
       	st  %f10, [ %g1 + %i4 ]
	
       	b  for
       	mov %i4, %i0 			!delay slot filling

body:	vfmul32 %f8, %f10, %f10
       	std  %f10, [ %g1 + %i5 ]
		add  %i5, 8, %i5
for:	cmp  %i5, %i0
       	bl,a  body
        ldd  [ %g1 + %i5 ], %f10
 
      	mov  %g1, %i0
      	restore 
      	retl 
      	nop 
