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
      !st  %i0, [ %fp + 0x44 ]	!n
      !st  %i1, [ %fp + 0x48 ]	!alpha	
      !st  %i2, [ %fp + 0x4c ]	!arr
      !st  %i3, [ %fp + 0x50 ]	!incx
      sll %i0, 2, %i0
      mov %i1,%l0		! alpha
      				!mov %i1,%l1

      mov %i0, %l4		! l4=n-1
      add  %l4, -4, %l4
				! i=0
      mov %g0, %l5		! l5=0

      and  %i0, 7, %g1		! if (n%2==0)
      cmp  %g1, 0
      be  for
      mov %i1,%l1		! alpha delay slot filling
 
      ld  [ %i2 + %l4 ], %g2
      umul  %i1, %g2, %g2	!arr[x]*=alpha
      mov %l4, %i0
      b  for 
      st  %g2, [ %i2 + %l4 ]		! delay slot filling
 
body: vumuld32  %l2,%l0,%l2
      std %l2, [%i2 + %l5]
      add  %l5, 8, %l5
for:  cmp  %l5, %i0
      bl,a  body
      ldd [%i2 + %l5], %l2

      mov  %i2, %i0
      restore 
      retl 
      nop 
