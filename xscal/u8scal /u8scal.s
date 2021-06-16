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
      st  %i0, [ %fp + 0x44 ]	!n
      mov  %i1, %g1				!alpha
      st  %i2, [ %fp + 0x4c ]	!arr0
      st  %i3, [ %fp + 0x50 ]	!incx
      stb  %g1, [ %fp + 0x48 ]	!alpha

	  mov %i2, %g4				! arr

	  clr %l0		! vector regester
	  clr %l1		! used for 
	  clr %l2		! multiplication
	  clr %l3		!

      mov %i1, %l0			!
	  sll %l0, 8, %g1		!
	  or %g1, %l0, %l0		! forming 8 alphas
	  sll %l0, 16, %g1		!
	  or %g1, %l0, %l0		!
	  
      mov %g0, %l4	!i=0
	  
      b  while
      mov %l0, %l1		!8 alphas delay slot filling 

body: ldub  [ %g3 ], %l2	! body of while loop	

	  ldub  [ %g3 + 1 ], %l5	! 8 load instructions
	  sll %l5, 8, %l5			! proper arranged in 
	  or %l5, %l2, %l2			! l2 and l3 regesters

	  ldub  [ %g3 + 2 ], %l5
	  sll %l5, 16, %l5
	  or %l5, %l2, %l2
	  
      ldub  [ %g3 + 3 ], %l5
	  sll %l5, 24, %l5
	  or %l5, %l2, %l2

	  ldub  [ %g3 + 4 ], %l3
	  
	  ldub  [ %g3 + 5 ], %l5
	  sll %l5, 8, %l5
	  or %l5, %l3, %l3
	  
	  ldub  [ %g3 + 6 ], %l5
	  sll %l5, 16, %l5
	  or %l5, %l3, %l3
		
      ldub  [ %g3 + 7 ], %l5
	  sll %l5, 24, %l5
	  or %l5, %l3, %l3
	  
      vumuld8 %l0, %l2, %l2	  ! vector multiplication

	  stb  %l2, [ %g3 ]		  ! 8 store instructions
	  srl  %l2, 8, %l2
      stb  %l2, [ %g3 + 1 ]
      srl  %l2, 8, %l2
      stb  %l2, [ %g3 + 2 ]
      srl  %l2, 8, %l2
      stb  %l2, [ %g3 + 3 ]

      stb  %l3, [ %g3 + 4 ]
	  srl  %l3, 8, %l3
      stb  %l3, [ %g3 + 5 ]
      srl  %l3, 8, %l3
      stb  %l3, [ %g3 + 6 ]
      srl  %l3, 8, %l3
      stb  %l3, [ %g3 + 7 ]

      add  %i0, -8, %i0		!n-=8 remaining elements
      add  %l4, 8, %l4		!i+=8 address index

	  mov %g0, %l2			!l2 and l3 = 0
	  mov %g0, %l3			!

while:
      cmp  %i0, 7
      bg  body
      add %g4, %l4 ,%g3
 
	  cmp  %i0 ,0			! if no elements left
	  be def				! exit the function
	  

!xxxxxxxxxxxx processing remainng elements xxxxxxxxxxx! 

o:    ldub  [ %g3 ], %l2	! 7 conditional load
	  add  %i0, -1, %i0		! instructions, and they 
      cmp  %i0 ,0			! branch to corresponding 
	  be,a one				! store instructions
	  umul %l2, %l0, %l2

tw:	  ldub  [ %g3 +1 ], %l5
	  sll  %l5, 8, %l5
	  or %l5, %l2, %l2
	  add  %i0, -1, %i0
      cmp  %i0 ,0
	  be,a two
	  vumuld8 %l2, %l0, %l2
	
th:	  ldub  [ %g3 + 2 ], %l5
	  sll  %l5, 16, %l5
	  or %l5, %l2, %l2
	  add  %i0, -1, %i0
      cmp  %i0 ,0
	  be,a thr
	  vumuld8 %l2, %l0, %l2

fr:	  ldub  [ %g3 + 3 ], %l5
	  sll  %l5, 24, %l5
	  or %l5, %l2, %l2
	  add  %i0, -1, %i0
      cmp  %i0 ,0
	  be,a for
	  vumuld8 %l2, %l0, %l2

fv:	  ldub  [ %g3 + 4 ], %l3
	  add  %i0, -1, %i0
      cmp  %i0 ,0
	  be,a fiv
	  vumuld8 %l2, %l0, %l2

sx:	  ldub  [ %g3 + 5 ], %l5
	  sll  %l5, 8, %l5
	  or %l5, %l3, %l3
	  add  %i0, -1, %i0
      cmp  %i0 ,0
	  be,a six
	  vumuld8 %l2, %l0, %l2

sv:	  ldub  [ %g3 + 6 ], %l5
	  sll  %l5, 16, %l5
	  or %l5, %l3, %l3

	  vumuld8 %l2, %l0, %l2

sev:  srl %l3, 16, %l5			! 7 conditional store
	  stb %l5, [%g3+6]			! instructions

six:  srl %l3, 8, %l5
	  stb %l5, [%g3+5]

fiv:  stb %l3, [%g3+4]

for:  srl %l2, 24, %l5
	  stb %l5, [%g3+3] 

thr:  srl %l2, 16, %l5
	  stb %l5, [%g3+2] 

two:  srl %l2, 8, %l5
	  stb %l5, [%g3+1] 

one:  stb %l2, [%g3]  	

def:
      mov  %i2, %i0			! exit
      restore 
      retl 
      nop 
