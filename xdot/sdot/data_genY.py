import random 
import struct 

sum=0;
f= open("datay.s",'w')
f.write(".section "".text"" \n .align 4\n .global geny \n .type geny, #function\n geny:\n \t save  %sp, -120, %sp\n \t set datay,%i0\n \t restore \n \t retl \n \t nop \n .section "".data""\n .align 8\n .global datay \n datay: \n")

for i in range(0,1000):
	f.write(".word	")
	#x=random.randrange(-500, 500, 3)
	#f.write(str(x))

	y=random.uniform(-10.01,10.01)
	s = struct.pack('>f', y)
	i = struct.unpack('>I', s)[0]
	f.write(hex(i))

	#sum+=abs(x)
	f.write('\n')

	
	
#print(sum)
#f.write('!')
#f.write(str(sum))
f.close()
