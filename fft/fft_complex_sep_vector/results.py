#programme to write the main.results file according to the registers we want
import random 
import struct 

f= open("main.results",'w')
k=0
n=4096
x=0x400042f0

while(k<n):
	f.write("m[")
	f.write(hex(x))
	f.write("]=0x0000000a\n")
	f.write("asi=0x0a\n")
	x+=4
	k+=1
f.write("i0=0x0\n")	
f.write("f20=0x0\n")
f.write("f21=0x0\n")
f.write("f22=0x0\n")
f.write("f23=0x0\n")
f.write("f29=0x0\n")	
f.close()
