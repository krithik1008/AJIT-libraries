#include <stdio.h>
unsigned char u8dot(int N,unsigned char *X,int incX,unsigned char *Y,int incY);

//normal c code for benchmarking against efficient vector implementation
/*unsigned char u8dot_1(int N,unsigned char *X,int incX,unsigned char *Y,int incY)
{
	int i=0,ix=0,iy=0;
	int r=0;
	for (i = 0; i < N; i++) {
    		r += X[ix] * Y[iy];
    		ix += incX;
    		iy += incY;
  	}
	return r;
}*/
unsigned char* genx();
unsigned char* geny();
unsigned char main()
{
	int n=1000,incx=1,incy=1;	
	//unsigned char x[10]={1,2,3,4,5,6};
	//unsigned char y[10]={1,2,3,4,5,6};
	
	unsigned char* x = genx();
	unsigned char* y = geny();
	/*int i=0;
	for(;i<n;i++)
	{
		x[i]=i;
		y[i]=2;
	}*/
	return u8dot(n,&x[0],incx,&y[0],incy);
}


