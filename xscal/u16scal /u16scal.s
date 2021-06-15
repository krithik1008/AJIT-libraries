!author : Ayush Mittal 
!email  : mittalayush129@gmail.com
!date   : 14th June 2021
!Note 	: Result is pointer to the input array 
!delay slot filling is performed wherever possible.
!more optimized code than compiler generated.

.section ".bss"
.common datak, 400,4

.section ".text"
.align 4
.global u16scal
.type u16scal, #function
u16scal:
       	save  %sp, -104, %sp
      	st  %i0, [ %fp + 0x44 ]	!n
       	st  %i2, [ %fp + 0x4c ]	!arr
      	st  %i3, [ %fp + 0x50 ]	!incx
       	sth %i1, [ %fp + 0x48 ]	!alpha

	mov %i2, %g4
	!set 0x40000024, %g4
	
	mov %i1, %l0
	sll %l0, 16, %g1
	or %l0, %g1, %l0	! l0 , l1 contain 

	mov %g0, %l4 		! i=0 l4

      	b  while
        mov %l0, %l1		! 4 alphas delay slot filling

body: 
      	add  %l4, %l4, %g1	! base i with offser
      	add  %i2, %g1, %g2	! arr + 0
     	lduh [ %g2 ], %l2	![arr]
	lduh [ %g2 + 2 ], %g3	![arr+1]
	sll %g3, 16, %g3
	or %g3, %l2, %l2
	lduh [ %g2 + 4 ], %l3	![arr+2]
	lduh [ %g2 + 6 ], %g3	![arr+3]
	sll %g3, 16, %g3
	or %g3, %l3, %l3

     	vumuld16 %l0, %l2, %l2
	
	sth %l2, [%g4 + %g1]
	
	srl %l2, 16, %l2
	add %g1, 2, %g1
	sth %l2, [%g4 + %g1]

	add %g1, 2, %g1
	sth %l3, [%g4 + %g1]

	srl %l3, 16, %l3
	add %g1, 2, %g1
	sth %l3, [%g4 + %g1]

	add  %i0, -4, %i0	! n=n-4
 	add  %l4, 4, %l4	! i=i+4
while:  
        cmp  %i0, 3
 	bg  body
	nop

	add %l4, %l4, %g1
case: 
      	cmp  %i0, 2
        be  two
      	nop
 
      	cmp  %i0, 3
      	be  three
      	nop
 
one:    cmp  %i0, 1
        bne  def
	
      	lduh  [ %i2 + %g1 ], %g2
	umul %g2, %i1, %g2
        sth  %g2, [ %g4 + %g1 ]
        b  def
        nop 

two:    
	lduh  [ %i2 + %g1 ], %g3
        umul %g3, %i1, %g3
	sth  %g3, [ %g4 + %g1 ]

	add %g1, 2, %g1
	lduh  [ %i2 + %g1 ], %g3
        umul %g3, %i1, %g3
	sth  %g3, [ %g4 + %g1 ]
        b  def
        nop 

three:
	lduh  [ %i2 + %g1 ], %g3
        umul %g3, %i1, %g3
	sth  %g3, [ %g4 + %g1 ]

	add %g1, 2, %g1
	lduh  [ %i2 + %g1 ], %g3
        umul %g3, %i1, %g3
	sth  %g3, [ %g4 + %g1 ]
	
	add %g1, 2, %g1
	lduh  [ %i2 + %g1 ], %g3
        umul %g3, %i1, %g3
	sth  %g3, [ %g4 + %g1 ]
        nop 

def:	
     	mov  %i2, %i0
     	restore 
     	retl 
        nop 
