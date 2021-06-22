!author : Ayush Mittal 
!email  : mittalayush129@gmail.com
!date   : 12th June 2021
!Note 	: Result of the addition is there in %f0
!delay slot filling is performed wherever possible.
!unoptimized for n<3
!instead of using i and then using sll , n itself has been scaled 
!n=n*4, and all the address calculation has been changed accordingly 
!istead of n%2 , n%8 has to be checked . this saves 1 sll instruction
!in every one iteration of loop. 

.section	".data"
.align 8
      ZERO: .double 0

.section ".text"
.align 4
.global sasum
.type sasum, #function

sasum:
      save  %sp, -120, %sp
      !st  %i0, [ %fp + 0x44 ]	!n
      !st  %i1, [ %fp + 0x48 ]	!arr
      !st  %i2, [ %fp + 0x4c ]	!incx

      set ZERO, %l0 
      ldd [%l0], %f0
	

      sll %i0,2,%i0    		!n*8=n
      mov  8, %l3		! i is stored in l3     
      
      cmp  %i0, 16		! n<4 branch
      bl  nm			! to normal multi
      mov  0, %l4		! k in l4


      ld  [ %i1 ], %f8		!arr[0] in f8
      fabss %f8, %f8
      ld  [ %i1 + 4 ], %f9	!arr[1] in f9
      fabss %f9, %f9		! delay slot filling

      and  %i0, 7, %g1		! if n%2==0
      cmp  %g1, 0		! branch to for
      be  for
      add  %i0, -4, %l2		!n-1 in l2 delay slot filling

				! load n-1
      add  %i1, %l2, %g3	! form address

      ld  [ %g3 ], %f6		! arr [n-1] is in f6
      fabss %f6, %f6
      fadds  %f6, %f8, %f8	! arr[0]+last odd element
      b  for
      add %l2, 0, %i0		! n=x in regester


body: 
      ld  [ %g1 ], %f10		! arr[offset1] x---- arr[2]
      fabss %f10, %f10

      ld  [ %g1+4 ], %f11		! arr[offset1+4] x---- arr[4]
      fabss %f11, %f11
      
      vfadd32  %f8, %f10, %f8
      add  %l3, 8, %l3

for:  cmp  %l3, %i0
      bl  body
      add  %i1, %l3, %g1	! arr+offset
				! first instruction of for 

      b  k
      fadds  %f9, %f8, %f0 


y:    
      ld  [ %g1 ], %f9
      fabss %f9, %f9
      fadds  %f9, %f0, %f0
      add %l4, 4, %l4
      
nm:   cmp  %l4, %i0
      bl  y
      add  %i1, %l4, %g1

k:    restore 
      retl 
      nop 