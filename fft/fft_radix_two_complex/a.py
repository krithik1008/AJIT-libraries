import random 
import struct 

f= open("data.s",'w')
f.write('.section ".text" \n.align 4\n.global gen \n.type gen, #function\ngen:\n\tsave  %sp, -120, %sp\n\tset data,%i0\n\trestore\n\tretl\n\tnop\n.section ".data"\n.align 8 \n.global data\ndata:\n')
i=0
while(i<32):
	f.write(".word	")
	#x=random.randrange(-1000, 100, 2)
	#f.write(str(x))

	#x=random.uniform(-2.56,0)
	#s = struct.pack('>f', x)
	#i = struct.unpack('>I', s)[0]
	#f.write(hex(i))
	x=int(i/2)
	f.write('0x3f800000')
	f.write('\n')
	f.write(".word	")
	f.write('0x3f800000')
	f.write('\n')
	i+=2
	
f.close()
