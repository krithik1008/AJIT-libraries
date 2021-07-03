!author : Ayush Mittal 
!email  : mittalayush129@gmail.com
!date   : 14th June 2021
!Note 	: Result is pointer to the input array 
!delay slot filling is performed wherever possible.
!remaining elements are processed with normal 
!multiplication instruction ; can be optimized 
!with vector instructions

.section ".bss"
.common datak, 400,4

.section ".text"
.align 4
.global u16scal
.type u16scal, #function
u16scal:
       	save  %sp, -104, %sp
      	!st  %i0, [ %fp + 0x44 ]	!n
       	!st  %i2, [ %fp + 0x4c ]	!arr
      	!st  %i3, [ %fp + 0x50 ]	!incx
       	!sth %i1, [ %fp + 0x48 ]	!alpha
	!set 0x40000000, %g4
	mov %i2, %g2
	
	mov %i1, %l0
	sll %l0, 16, %g1
	or %l0, %g1, %l0	! l0 , l1 contain 
	mov %g0, %l4 		! i=0 l4

      	b  while
        mov %l0, %l1		! 4 alphas delay slot filling

body: 	vumuld16 %l0, %l2, %l2
	std %l2 ,[%g2]
	add  %g2, 8, %g2
	add  %i0, -4, %i0	! n=n-4
while:  cmp  %i0, 3
 	bg,a  body
	ldd [%g2], %l2

!xxxxxxx processing remaining 3 elements with switch case xxxxxxx!
case: 
      	cmp  %i0, 2
        be,a  two
      	ld  [ %g2 ], %l2
 
      	cmp  %i0, 3
      	be,a  three
      	ld  [ %g2 ], %l2
 
one:    cmp  %i0, 1		! one element mul
        bne,a  def
	mov  %i2, %i0

      	lduh  [ %g2 ], %g3
	umul %g3, %i1, %g3
        sth  %g3, [ %g2 ]
        b  def
        mov  %i2, %i0

two:   	vumuld16 %l0, %l2, %l2
	st  %l2, [ %g2 ]
        b  def
        mov  %i2, %i0

three:				! three element mul
        vumuld16 %l0, %l2, %l2
	st  %l2, [ %g2 ]
	lduh  [ %g2 + 4 ], %g3
        umul %g3, %i1, %g3
	sth  %g3, [ %g2 + 4 ]
	mov  %i2, %i0

def:	mov %i2, %i0
     	restore 
     	retl 
        nop 
