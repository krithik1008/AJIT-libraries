.section .text 
 .align 4
 .global genx 
 .type genx, #function
 genx:
 	 save  %sp, -120, %sp
 	 set datax,%i0
 	 restore 
 	 retl 
 	 nop 


 .section .data
 .align 8
 .global datax 


 datax: 

.byte	0x1
.align 8
.byte	0x2
.align 8
.byte	0x3
.align 8
.byte	0x4
.align 8
.byte	0x5
.align 8
.byte	0x6
.align 8
.byte	0x7
.align 8
.byte	0x8

