#include <stdio.h>
//unsigned char* u8dot(int nx, int ny, unsigned char *X,unsigned char *Y, unsigned char *res);
//naive implementation for testing
unsigned char* conv(int nx, int ny, unsigned char *x, unsigned char *y, unsigned char *res)
{
	int k=3,compi=nx-k+1,compj=ny-k+1;
	int temp,temp1,w,h;
	int i,j,pos=0;
	for (i=0; i<compi ; i++)
        {
	    temp=ny*i;
	    for (j=0; j<compj ; j++)
            {	
		temp1=temp+j;
		for (h=0 ; h<k ; h++)
                    for (w=0 ; w<k ; w++)
                        res[pos] = res[pos] + (y[k*h+w])*x[ny*h+temp1+w];		//y[k*(h-i)+(w-j)]
		pos++;
	    }
	}
	return &res[0];
}
unsigned char* genx();
unsigned char* geny();
unsigned char* main()
{
	int nx=48,ny=48;	
	//for a 3x3 kernal, create a 3x4 matrix and put 4th col. values as 0
		
	/*
	unsigned char y[12];
	y[0]=1;y[4]=1;y[8]=1;
	y[1]=1;y[5]=2;y[9]=1;
	y[2]=1;y[6]=1;y[10]=1;
	y[3]=0;y[7]=0;y[11]=0;
	*/

	
	unsigned char res[2304];	//result will be stores here
	/*unsigned char x[64];	//input array
	int i=0;
	for(;i<64;i++)
		x[i]=i;		//assigning value to input array
	*/
	unsigned char *x=genx();		//assigning input from datax.s file
	unsigned char *y=geny();		//assigning kernal values from datay.s file
	return conv(nx,ny,&x[0],&y[0],&res[0]);
}


