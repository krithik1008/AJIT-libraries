import random 
import struct 

sum=0;
f= open("datax.s",'w')
f.write(".section "".text"" \n .align 4\n .global genx \n .type genx, #function\n genx:\n \t save  %sp, -120, %sp\n \t set datax,%i0\n \t restore \n \t retl \n \t nop \n .section "".data""\n .align 8\n .global datax \n datax: \n")

for i in range(0,2303):
	f.write(".byte	")

	x=random.randint(0,100)
	#x=i
	f.write(hex(x))
	f.write('\n')

f.close()
