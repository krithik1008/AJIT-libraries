import re
import struct
import numpy as np
from PIL import Image
p=re.compile('actual = 0x[0-9a-f]*')
f= open("main.log",'r')
s=0;
i=0;
j=0;
w, h = 198, 198;
Matrix = [[0 for x in range(w)] for y in range(h)] 
data=list()
for line in f:
	m=p.search(line)
	if m:
		x=m.group()
		y=x[11:20]
		if len(y)==1:
			
			data.append(0)
			data.append(0)
			data.append(0)
			data.append(int(y[0], 16))
		if len(y)==2:
			
			data.append(0)
			data.append(0)
			data.append(0)
			data.append(int(y[0:2], 16))
		if len(y)==3:
			
			data.append(0)
			data.append(0)
			data.append(int(y[0], 16))
			data.append(int(y[1:3], 16))
		if len(y)==4:
			
			data.append(0)
			data.append(0)
			data.append(int(y[0:2], 16))
			data.append(int(y[2:4], 16))
		if len(y)==5:
			
			data.append(0)
			data.append(int(y[0], 16))
			data.append(int(y[1:3], 16))
			data.append(int(y[3:5], 16))
		if len(y)==6:
			
			data.append(0)
			data.append(int(y[0:2], 16))
			data.append(int(y[2:4], 16))
			data.append(int(y[4:6], 16))
		if len(y)==7:

			data.append(int(y[0], 16))
			data.append(int(y[1:3], 16))
			data.append(int(y[3:5], 16))
			data.append(int(y[5:7], 16))
		if len(y)==8:

			data.append(int(y[0:2], 16))
			data.append(int(y[2:4], 16))
			data.append(int(y[4:6], 16))
			data.append(int(y[6:28], 16))
		
	#else :
	#	print("None")
f.close()
npa = np.asarray(data, dtype=np.uint8)
npa=np.reshape(npa,(-1,198))
#print(npa.shape)
pic = Image.fromarray(npa)
pic.save('trial.png')
pic.show()
#for x in range(len(data)):
#   print (data[x])

