import re
import struct

p=re.compile('actual = 0x[0-9a-f]*')
f= open("main.log",'r')
s=0;
for line in f:
	m=p.search(line)
	if m:
		if(s%2==0):
			print('\n')
		x=m.group()
		y=x[11:20]
		if(y=='0'):
			y='00000000'
		a=struct.unpack('!f', bytes.fromhex(y))[0]
		print(a,end='  ')
		s+=1
	else :
		print("None")
f.close()
