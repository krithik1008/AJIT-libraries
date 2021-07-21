import re
import struct
import math
import numpy as np
import matplotlib.pyplot as plt
from scipy.fft import fft
# reading the log file extracting the hex ans , finding the abs value and plotting
# the graph
p=re.compile('actual = 0x[0-9a-f]*')
f= open("main.log",'r')
s=0;
data=[]
arr=[]
for line in f:
	m=p.search(line)
	if m and s<2048:
		x=m.group()
		y=x[11:20]
		if(y=='0'):
			y='00000000'
		a=struct.unpack('!f', bytes.fromhex(y))[0]
		data.append(float(a))
		s+=1
	else :
		print("None")
		s+=1
p=0

while(p<2048):
	t=math.sqrt((data[p]*data[p]) + (data[p+1]*data[p+1]))
	arr.append(t)
	p+=2
  
plt.plot(arr[0:350])
plt.ylabel('some numbers')
plt.savefig('chart.png')
plt.grid()
plt.show()

m=[]
i=0
# using the same signal , finding the fft with scipy
while(i<1024):
    k=math.sin(2*3.1428*300*(i/1023)) + math.sin(2*3.1428*200*(i/1023))
    m.append(k)
    i+=1
m = np.array(m)
m = fft(m)
d=np.abs(m)

# finding the mean square error
print(d[500])
print(arr[500])
diff= np.subtract(d, arr)
diff = np.square(diff)
print( diff.mean())


f.close()

'''
#programme to read the log file , extract the floating hex value and convert it into the human readable format and display it on the screen. 
import re
import struct
import math

p=re.compile('actual = 0x[0-9a-f]*')
f= open("main.log",'r')
s=0;
data=[]
arr=[]
for line in f:
	m=p.search(line)
	if m and s<32:
		x=m.group()
		if (s%2==0):
			print('\n')
		y=x[11:20]
		if(y=='0'):
			y='00000000'
		a=struct.unpack('!f', bytes.fromhex(y))[0]
		print(float(a),end=' ')
		s+=1
	else :
		s+=1
p=0


f.close()
'''
