#programme to write the data.s file where the raw data for input to the function is generated.
#this file make sures that data is 8 byte aligned
import random 
import struct 
import math

f= open("data.s",'w')
f.write('.section ".text" \n.align 4\n.global gen \n.type gen, #function\ngen:\n\tsave  %sp, -120, %sp\n\tset data,%i0\n\trestore\n\tretl\n\tnop\n.section ".data"\n.align 8 \n.global data\ndata:\n')
i=0
while(i<2048):
	f.write(".word	")
	k=math.sin(2*3.1428*1000*(i/2047)) + math.sin(2*3.1428*350*(i/2047))
	f.write(hex(struct.unpack('<I', struct.pack('<f', k))[0]))
	f.write('\n')
	f.write(".word	")
	f.write('0x0')
	f.write('\n')
	i+=1
	
f.close()


