.section ".text" 
.align 4
.global gen 
.type gen, #function
gen:
	save  %sp, -120, %sp
	set data,%i0
	restore
	retl
	nop
.section ".data"
.align 8 
.global data
data:
.word	0
.word	0
.word	0
.word	0
.word	0
.word	0
.word	0
.word	0
.word	0
.word	0
.word	0
.word	0
.word	0
.word	0
.word	0
.word	0
.word	0x3f800000
.word	0
.word	0x3f800000
.word	0
.word	0x3f800000
.word	0
.word	0x3f800000
.word	0
.word	0
.word	0
.word	0
.word	0
.word	0
.word	0
.word	0
.word	0
