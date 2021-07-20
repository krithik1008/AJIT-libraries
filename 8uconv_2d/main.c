#include <stdio.h>
unsigned char* u8dot(int nx, int ny, unsigned char *X,unsigned char *Y, unsigned char *res);
//naive implementation for testing
/*unsigned char* conv(int nx, int ny, unsigned char *x, unsigned char *y, unsigned char *res)
{
	int i=0,j=0,h,w;
	for (; i<nx-2 ; i++)
            for (; j<ny-2 ; j++)
                for (h=i ; h<i+3 ; h++)
                    for (w=j ; w<j+3 ; w++)
                        res[i*3+j] = res[i*3+j] + (y[(h-i)*3+(w-j)]*x[3*h+w]);

	return &res[0];
}*/
unsigned char* genx();
unsigned char* main()
{
	int nx=5,ny=8;	
	//for a 3x3 kernal, create a 3x4 matrix and put 4th col. values as 0
		
	unsigned char y[12];
	y[0]=1;y[4]=1;y[8]=1;
	y[1]=1;y[5]=2;y[9]=1;
	y[2]=1;y[6]=1;y[10]=1;
	y[3]=0;y[7]=0;y[11]=0;

	
	unsigned char res[64];	//result will be stores here
	unsigned char x[64];	//input array
	int i=0;
	for(;i<64;i++)
		x[i]=i;		//assigning value to input array
	
	//unsigned char *x=genx();		//assigning input from datax.s file
	return u8dot(nx,ny,&x[0],&y[0],&res[0]);
}


