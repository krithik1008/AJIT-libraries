import random 
import struct 

sum=0;
f= open("datax.s",'w')
f.write(".section "".text"" \n .align 4\n .global genx \n .type genx, #function\n genx:\n \t save  %sp, -120, %sp\n \t set datax,%i0\n \t restore \n \t retl \n \t nop \n .section "".data""\n .align 8\n .global datax \n datax: \n")

for i in range(0,1000):
	f.write(".word	")
	#x=random.randrange(-500, 500, 3)
	#f.write(str(x))

	x=random.uniform(-10.01,10.01)
	s = struct.pack('>f', x)
	i = struct.unpack('>I', s)[0]
	f.write(hex(i))

	#sum+=abs(x)
	f.write('\n')

	
	
#print(sum)
#f.write('!')
#f.write(str(sum))
f.close()
