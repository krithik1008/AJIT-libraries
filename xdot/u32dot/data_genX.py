import random 
import struct 

f= open("datax.s",'w')
f.write(".section "".text"" \n .align 4\n .global genx \n .type genx, #function\n genx:\n \t save  %sp, -120, %sp\n \t set datax,%i0\n \t restore \n \t retl \n \t nop \n .section "".data""\n .align 8\n .global datax \n datax: \n")

for i in range(0,1000):
	f.write(".word	")
	#x=random.randrange(-500, 500, 3)
	#f.write(str(x))

	x=random.randint(1,100)
	f.write(hex(x))

	#sum+=abs(x)
	f.write('\n')

	
	
#print(sum)
#f.write('!')
#f.write(str(sum))
f.close()
