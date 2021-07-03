#include <stdio.h>
unsigned int  u32dot(int N,unsigned int *X,int incX,unsigned int *Y,int incY);
//unsigned int  u32dot_1(int N,unsigned int *X,int incX,unsigned int *Y,int incY)
//normal c code for benchmarking against efficient vector implementation
/*{
	int i=0,ix=0,iy=0;
	int r=0;
	for (i = 0; i < N; i++) {
    		r += X[ix] * Y[iy];
    		ix += incX;
    		iy += incY;
  	}
	return r;
}*/
unsigned int* genx();
unsigned int* geny();
unsigned int main()
{
	int n=100,incx=1,incy=1;	
	unsigned int* x=genx();
	unsigned int* y=geny();
	//unsigned int x[8]={1,2,3,4,5,1};
	//unsigned int y[9]={1,2,3,4,5,6};
	/*int i=0;
	for(;i<n;i++)
	{
		x[i]=i;
		y[i]=2;
	}*/
	return u32dot(n,&x[0],incx,&y[0],incy);
}


