!author : Krithik sankar 
!email  : krithik.sankar10@gmail.com
!date   : 20th June 2021

!array y starting address is returned in i0 register
!starting address of the array must be double word aligned in order to use ldd and std insts

!.section ".bss"
!.common datak,400,4

.section ".text"
.align 4
.global u8axpy
.type u8axpy, #function

   u8axpy:	save  %sp, -104, %sp
      		st  %i0, [ %fp + 0x44 ]	!n
      		stb  %i1, [ %fp + 0x48 ]!alpha
      		st  %i2, [ %fp + 0x4c ]	!arr x
      		st  %i3, [ %fp + 0x50 ]	!incx
		st  %i4, [ %fp + 0x54 ]	!arr y
		st  %i5, [ %fp + 0x58 ] !incy

		!set  datak, %g4		!results stored in mem		
		mov 0, %l6			!i=0
		mov 8, %g2			!registers for effective traversal of array
		mov -8,%g3		
		
		mov  %i1, %l4			!alpha
		sll %l4, 8, %g1
		or %l4, %g1, %l4
		sll %l4, 16, %g1
		or %l4, %g1, %l4
      		mov %l4,%l5			!alpha

		b check	
		mov %i0, %l7			!l7=n

      loop:	ldd [%i4 + %l6], %l2	
		
		vumuld8 %l0, %l4, %l0		!multiply (x*alpha)
		vaddd8 %l2, %l0, %l2		!add (x*alpha)+y
		
		std %l2, [%i4+%l6]

		vaddd32 %l6, %g2, %l6  

		!add  %l7, -8, %l7		! n=n-8
 		!add  %l6, 8, %l6		! i=i+4	update i
	
     	check:	cmp  %l7, 7			!if i< n
     		bg,a  loop 			!go to body of for
		ldd [%i2 + %l6], %l0   		
		!add  %l6, %l6, %g1		!delay slot filling 


	!calculation of last 3 elements has to be done using 32 bit instructions

		cmp %l7, 1
		be,a one	
		ldub [%i2 + %l6], %g2

		cmp %l7, 2
		be,a two
		ldub [%i2 + %l6], %g2
	
		cmp %l7, 3
		be,a three	
		ldub [%i2 + %l6], %g2

		cmp %l7, 4
		be,a four
		ldub [%i2 + %l6], %g2
		
		cmp %l7, 5
		be,a five	
		ldub [%i2 + %l6], %g2

		cmp %l7, 6
		be,a six
		ldub [%i2 + %l6], %g2

		cmp %l7, 7
		bne,a store
		mov  %i4, %i0			! returning the same array

		ldub [%i2 + %l6], %g2
		ldub [%i4 + %l6], %g3
		umul %g2, %i1, %g2
		add %g2, %g3, %g2
		stb %g2, [%i4+%l6]
		inc %l6

		ldub [%i2 + %l6], %g2
	six:	ldub [%i4 + %l6], %g3
		umul %g2, %i1, %g2
		add %g2, %g3, %g2
		stb %g2, [%i4+%l6]
		inc %l6

		ldub [%i2 + %l6], %g2
	five:	ldub [%i4 + %l6], %g3
		umul %g2, %i1, %g2
		add %g2, %g3, %g2
		stb %g2, [%i4+%l6]
		inc %l6

		ldub [%i2 + %l6], %g2
	four:	ldub [%i4 + %l6], %g3
		umul %g2, %i1, %g2
		add %g2, %g3, %g2
		stb %g2, [%i4+%l6]
		inc %l6

		ldub [%i2 + %l6], %g2
	three:	ldub [%i4 + %l6], %g3
		umul %g2, %i1, %g2
		add %g2, %g3, %g2
		stb %g2, [%i4+%l6]
		inc %l6

		ldub [%i2 + %l6], %g2
	two:	ldub [%i4 + %l6], %g3
		umul %g2, %i1, %g2
		add %g2, %g3, %g2
		stb %g2, [%i4+%l6]
		inc %l6

		ldub [%i2 + %l6], %g2
	one:	ldub [%i4 + %l6], %g3
		umul %g2, %i1, %g2
		add %g2, %g3, %g2
		stb %g2, [%i4+%l6]
		inc %l6
     			
     		mov  %i4, %i0			! returning the same array
     	store:	restore 
     		retl 
     		nop
