!author : Ayush Mittal 
!email  : mittalayush129@gmail.com
!date   : 16th June 2021
!Note 	: Result is pointer to the input array 
!delay slot filling is performed wherever possible.
!more optimized code than compiler generates.
!every multiplication is vectorized

.section ".bss"
.common datak, 400,4

.section ".text"
.align 4
.global u8scal
.type u8scal, #function

u8scal:
      save  %sp, -104, %sp
      !st  %i0, [ %fp + 0x44 ]	!n
      !mov  %i1, %g1			!alpha
      !st  %i2, [ %fp + 0x4c ]	!arr0
      !st  %i3, [ %fp + 0x50 ]	!incx

	  mov %i2, %g4				! arr
	  !set 0x40000008, %g4

      mov %i1, %l0			! l0 l1 l2 l3 used 
	  sll %l0, 8, %g1		! for vectorization  
	  or %g1, %l0, %l0		! forming 8 alphas
	  sll %l0, 16, %g1		!
	  or %g1, %l0, %l0		!

      b  while
      mov %l0, %l1		!8 alphas delay slot filling 

body: vumuld8 %l0, %l2, %l2		  ! vector multiplication
	  std %l2, [%g4]				
      add  %i0, -8, %i0			!n-=8 remaining elements
      add %g4, 8 ,%g4
while:
      cmp  %i0, 7
      bg  body
      ldd [%g4], %l2			! can be optimized with this
 
	  cmp  %i0 ,0			! if no elements left
	  be def				! exit the function
	  

!xxxxxxxxxxxx processing remainng elements xxxxxxxxxxx! 

o:    ldub  [ %g4 ], %l2	! 7 conditional load 
      cmp  %i0 ,1			! instructions, and they
	  be,a one				! branch to corresponding 
	  umul %l2, %l0, %l2	! store instructions

tw:	  ldub  [ %g4 +1 ], %l5
	  sll  %l5, 8, %l5
	  or %l5, %l2, %l2
      cmp  %i0 ,2
	  be,a two
	  vumuld8 %l2, %l0, %l2
	
th:	  ldub  [ %g4 + 2 ], %l5
	  sll  %l5, 16, %l5
	  or %l5, %l2, %l2
      cmp  %i0 ,3
	  be,a thr
	  vumuld8 %l2, %l0, %l2

fr:	  ldub  [ %g4 + 3 ], %l5
	  sll  %l5, 24, %l5
	  or %l5, %l2, %l2
      cmp  %i0 ,4
	  be,a for
	  vumuld8 %l2, %l0, %l2

fv:	  ldub  [ %g4 + 4 ], %l3
      cmp  %i0 ,5
	  be,a fiv
	  vumuld8 %l2, %l0, %l2

sx:	  ldub  [ %g4 + 5 ], %l5
	  sll  %l5, 8, %l5
	  or %l5, %l3, %l3
      cmp  %i0 ,6
	  be,a six
	  vumuld8 %l2, %l0, %l2

sv:	  ldub  [ %g4 + 6 ], %l5
	  sll  %l5, 16, %l5
	  or %l5, %l3, %l3

	  vumuld8 %l2, %l0, %l2

sev:  srl %l3, 16, %l5			! 7 conditional store
	  stb %l5, [%g4+6]			! instructions

six:  srl %l3, 8, %l5
	  stb %l5, [%g4+5]

fiv:  stb %l3, [%g4+4]

for:  srl %l2, 24, %l5
	  stb %l5, [%g4+3] 

thr:  srl %l2, 16, %l5
	  stb %l5, [%g4+2] 

two:  srl %l2, 8, %l5
	  stb %l5, [%g4+1] 

one:  stb %l2, [%g4]  	

def:  mov  %i2, %i0			! exit
      restore 
      retl 
      nop 
