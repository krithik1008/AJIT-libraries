from PIL import Image
from numpy import asarray

image = Image.open('a.png')

resized_im = image.resize((400,400))

#resized_im.show()
numpydata = asarray(resized_im)
#print(numpydata.shape)


import struct 

f= open("datax.s",'w')
f.write(".section "".text"" \n .align 4\n .global genx \n .type genx, #function\n genx:\n \t save  %sp, -120, %sp\n \t set datax,%i0\n \t restore \n \t retl \n \t nop \n .section "".data""\n .align 8\n .global datax \n datax: \n")

for i in range(0,numpydata.shape[0]):
	for j in range(0,numpydata.shape[1]):
		f.write(".byte	")
		f.write(hex(numpydata[i][j]))
		f.write('\n')

f.close()


