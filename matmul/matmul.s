.section ".text"
.align 4
.global matmul
.type matmul, #function

matmul:		save %sp, -96, %sp
		
		restore
		retl
		nop

data:		

end:		ta 0
