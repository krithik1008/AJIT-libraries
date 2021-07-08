.section .text 
 .align 4
 .global geny 
 .type geny, #function
 geny:
 	 save  %sp, -120, %sp
 	 set datay,%i0
 	 restore 
 	 retl 
 	 nop 
 .section .data
 .align 8
 .global datay 
 datay: 
.byte	0x2
.balign 8
.byte	0x2
.balign 8
.byte	0x2
.balign 8
.byte	0x4
.balign 8
.byte	0x5
.balign 8
.byte	0x6
.balign 8
.byte	0x7
.balign 8
.byte	0x8

