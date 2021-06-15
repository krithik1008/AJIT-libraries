!author : Ayush Mittal 
!email  : mittalayush129@gmail.com
!date   : 14th June 2021
!Note 	: Result is same as provided to the function
!delay slot filling is performed wherever possible.
!more optimized code than compiler generated.


.section ".bss"
.common datak, 400,4

.section ".text"
.align 4
.global u32scal
.type u32scal, #function

u32scal:
      save  %sp, -104, %sp
      st  %i0, [ %fp + 0x44 ]	!n
      st  %i1, [ %fp + 0x48 ]	!alpha	
      st  %i2, [ %fp + 0x4c ]	!arr
      st  %i3, [ %fp + 0x50 ]	!incx
      
      mov %i1,%l0		! alpha
      				!mov %i1,%l1
      
      mov %i0, %l4		! l4=n-1
      add  %l4, -1, %l4
 
				! i=0
      mov %g0, %l5		! l5=0

      and  %i0, 1, %g1		! if (n%2==0)
      cmp  %g1, 0
      be  for
      mov %i1,%l1		! alpha delay slot filling
 
      sll  %l4, 2, %g1		! l4 =n-1
      add  %i2, %g1, %g1	! arr+(n-1)
      ld  [ %g1 ], %g2
      umul  %i1, %g2, %g2	!arr[x]*=alpha
      				!st  %g2, [ %g1 ]
      mov %l4, %i0
      b  for 
      st  %g2, [ %g1 ]		! delay slot filling
 
body:    
      add  %i2, %g1, %g1	! arr+i
      ld  [ %g1 ], %l2
      ld  [ %g1+4], %l3
      vumuld32  %l2,%l0,%l2
      st   %l2, [ %g1 ]
      st   %l3, [ %g1+4 ]
      add  %l5, 2, %l5
for:  cmp  %l5, %i0
      bl,a  body
      sll  %l5, 2, %g1		! i*4 delay slot filling

      mov  %i2, %i0
      restore 
      retl 
      nop 
