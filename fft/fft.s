!author : Ayush Mittal 
!email  : mittalayush129@gmail.com
!date   : 5th July 2021
!Imp Note: Data has to be stored in complex first and real later fashion 
! arr[0]=real arr[1]=complex arr[2]=real arr[3]=complex .....
!bwhile = body of while loop 
!bforo  = body of outer for loop
!bfort  = body of inner for loop

.section ".data"
.align 8
const: 
.word 0x40c90fda	!2*pi in float
.word 0x3f000000	!0.5
.word 0xc0000000
.word 0x0
.word 0x0 		! wi = 0
.word 0x3f800000	! wr = 1



.section ".text"
.align 4
.global FFT
.type FFT, #function


FFT:
	save  %sp, -160, %sp
	!mov  %i0, %i5		! arr
	mov  %i1, %g1		! no of samp
	!mov  %i2, %l1		! isign
	add  %g1, %g1, %l1	! n= no of samp *2
	st  %i2, [ %fp + -48 ]


!xxxxxxxxxxxx call to bit reverse xxxxxxxxxxxxxxxxxxxxxxxxxxxx

	mov  %i0, %o0		! arr to o0
	mov  %g1, %o1		! no of samples
	call Bit_Reverse	! rearranges the data
	nop 
	mov  %o0, %i0		! returns the arr

!xxxxxxxxxxxx loading constants xxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

	!st  %f8, [ %fp + -16 ]	! 2*pi
	!st  %f8, [ %fp + -20 ]	! 0.5
	
	set const, %g1		! loading constants from mem 	
	ldd [%g1], %f20		! 2*pi in f20 and 0.5 in f21
	ld [%g1 + 0x8 ], %f22	! -2 in f22

!xxxxx Danielson-Lanzcos routine (decimation in time) xxxxxxxx

	b  while
	mov  2, %i3		! i3 = mmax
 
	!xxxxxxxxxx external loop xxxxxxxx

bwhile:	
	add  %i3, %i3, %l0	! l0=istep
	ld  [ %fp + -48 ], %f8
	fitos  %f8, %f9		! isign f9 in float
	ld  [ %fp + -52 ], %f10
	fitos  %f10, %f8	! f8 mmax float

	fdivs  %f20, %f8, %f8	! picont/mmax
	fmuls  %f9, %f8, %f31	! isign*(picont/mmax)
				! f31=theta 

	!      xxxxxx sin(theta) xxxxxx

	fstod  %f31, %f8
	std  %f8, [ %fp + -64 ]
     	ldd  [ %fp + -64 ], %o0
	call  __GI_sin
	nop 
	fdtos  %f0, %f25		!f25 =wpi

	!st  %f25, [ %fp + -36 ]	!wpi

	!xxxxxxxxxx sin(halfconst*theta) xxxxxxxx

	fmuls  %f21, %f31, %f8	! 0.5*theta
	fstod  %f8, %f8
	std  %f8, [ %fp + -64 ]
	ldd  [ %fp + -64 ], %o0

	call __GI_sin
	nop 
	fdtos  %f0, %f30	! f30=wtemp
	!st  %f30, [ %fp + -28 ]	! wtemp 

	!xxxxxxxxxxx wpr wpi wr wi xxxxxxxxx

	fmuls %f30, %f30, %f8
	fmuls %f8, %f22, %f24		! f24=wpr
	!st  %f24, [ %fp + -32 ]	! wpr

	set const, %g1		! loading constants wr and wi 	
	ldd [ %g1 + 0x10 ], %f28	! f28 = wi f29=wr 	
	fmovs %f28, %f27
	fmovs %f29, %f26
	!st  %f28, [ %fp + -4 ]		! f28 = wi
	!st  %f29, [ %fp + -8 ]		! f29 = wr

	! f26 = wr f27 = wir(initially 0 wi) f28 = wi f29=wr

	!xxxxxxxxxxxxxx loops xxxxxxxxxxxxxxxxxxx

	b  foro
	mov  1, %i1		! %i1= m

bfort:	sll %i2, 2, %g1
	add %g1 , -4, %g1
	ldd [ %i0 + %g1 ], %f10 	! f10 = arr[j-1] f11 = arr[j]

	vfmul32 %f10, %f26, %f12	!tempr=(wr*data[j-1])+(wir*data[j]); 
	fadds %f12, %f13, %f14		!tempi=(wi*data[j-1])+(wr*data[j]);
	vfmul32 %f10, %f28, %f12
	fadds %f12, %f13, %f15		! tempr= f14 , tempi=f15
	!st  %f8, [ %fp + -40 ]		! tempr
	!st  %f8, [ %fp + -44 ]		! tempi

	sll %i4, 2, %g2
	add %g2 , -4, %g2
	ldd [ %i0 + %g2 ], %f10	 	! f10 = data[i-1] f11 = data[i]
	vfsub32 %f10, %f14, %f4		! data[j-1]=data[i-1]-tempr;
	std %f4, [ %i0 + %g1 ]		! data[j]=data[i]-tempi;

	vfadd32 %f10, %f14, %f10	!data[i-1] += tempr;
	std %f10, [%i0 + %g2]		!data[i] += tempi;

	add  %i4, %l0, %i4

fort:	cmp  %i4, %l1
	ble,a  bfort
	add  %i4, %i3, %i2	! i + mmax = j  i2

	fmovs %f26, %f30	! wtemp=wr;
	vfmul32 %f26, %f24, %f4
	vfmul32 %f28, %f24, %f6
	fadds %f4, %f5, %f9
	fadds %f6, %f7, %f8
	vfadd32 %f8, %f28, %f28
	fmovs %f29, %f26
	fnegs  %f28, %f27	!wir=-wi;
	
	add  %i1, 2, %i1

foro:	cmp  %i1, %i3
	bl,a  fort
	mov  %i1, %i4		! %i4= i 

	mov  %l0, %i3
while:	cmp  %l1, %i3
	bg,a  bwhile
	st  %i3, [ %fp + -52 ]	! converting mmax from int to float

	restore 
	retl 
	nop 
