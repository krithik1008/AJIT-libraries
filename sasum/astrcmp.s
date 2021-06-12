.section ".text"
.align 4
.global add
.type add, #function

add:	save %sp, -96, %sp
	set datak ,%g2
	set 10, %l0
	st %l0, [%g2]
	add %l0,1,%l0
	st %l0, [%g2+4]
	restore
	retl
	nop



end:	ta 0
