.section ".text"
.align 4
.global saxpy
.type saxpy, #function

   saxpy:	save  %sp, -104, %sp
      		st  %i0, [ %fp + 0x44 ]	!n
      		st  %i1, [ %fp + 0x48 ]	!alpha
      		st  %i2, [ %fp + 0x4c ]	!arr x
      		st  %i3, [ %fp + 0x50 ]	!incx
		st  %i4, [ %fp + 0x54 ]	!arr y
		st  %i5, [ %fp + 0x58 ] !incy
		
		set  datak, %g4			!results stored in mem

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
      		ld  [%fp+0x54],%g2		!arr &y[0]
      		add  %g2, %g1, %g2		!y=y+(i*4) d
      		ld  [ %fp + 0x4c ], %g3		!arr &x[0]
      		add  %g3, %g1, %g3		!x=x+(i*4) o
      		ld  [ %g3 ], %f8		!load[x+i*4] pair in f8 f9
		ld  [ %g3 +4 ], %f9
		ld  [ %g2 ], %f6		!load[y+i*4] pair in f6 f7
		ld  [ %g2 +4 ], %f7
      		vfmul32 %f8, %f10, %f12		!multiply (x*alpha)
		vfadd32 %f6, %f12, %f12		!add (x*alpha)+y
      		st  %f12, [ %g2 ]		!storing back into y
		st  %f13, [ %g2 +4 ]		!storing back into y
		add  %g4, %g1, %g1		!mp=mp+(i*4) d => adjusting memory location	
		st  %f12, [ %g1 ]		!storing f12 to memory
		st  %f13, [ %g1 +4 ]		!storing f13 to memory
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
		ld  [%fp+0x54],%g2		!arr &y[0]
      		add  %g2, %g1, %g2		!y=y+(i*4) d
      		ld  [ %fp + 0x4c ], %g3		!arr &x[0]
      		add  %g3, %g1, %g3		!x=x+(i*4) o

     		ld  [%g3], %f9		!last element of x
		ld  [%g2], %f8		!last element of y
     		fmuls %f9, %f10, %f11	!last multiplication 
		fadds %f11, %f8, %f11	!last addition
     		st  %f11, [%g2]		! storing the last element
		add  %g4, %g1, %g1	!mp=mp+(i*4) d => adjusting memory location	
		st  %f11, [%g1]		!storing f11 to memory
		
     fd:	set  datak, %g1 	! ld arr 
     		mov  %g1, %i0		! returning the same array
     		restore 
     		retl 
     		nop
