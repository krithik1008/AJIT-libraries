import random 
import struct 

sum=0;
f= open("data.s",'w')
f.write('.section ".text" \n.align 4\n.global gen \n.type gen, #function\ngen:\n\tsave  %sp, -120, %sp\n\tset data,%i0\n\trestore\n\tretl\n\tnop\n.section ".data"\n.align 8 \n.global data\ndata:\n')

for i in range(0,1000):
	f.write(".word	")
	#x=random.randrange(-1000, 100, 2)
	#f.write(str(x))

	x=random.uniform(-2.56,0)
	s = struct.pack('>f', x)
	i = struct.unpack('>I', s)[0]
	f.write(hex(i))

	sum+=abs(x)
	f.write('\n')
	
print(sum)
f.write('!')
f.write(str(sum))
f.close()
