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
.byte	0x01
.byte	0x02
.byte	0x01
.byte	0x00
.byte	0x01
.byte	0x02
.byte	0x01
.byte	0x00
.byte	0x01
.byte	0x02
.byte	0x01
.byte	0x00



