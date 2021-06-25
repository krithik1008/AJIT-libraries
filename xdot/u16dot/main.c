#include <stdio.h>
unsigned short int u16dot(int N,unsigned short int *X,int incX,unsigned short int *Y,int incY);
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
unsigned short int main()
{
	int n=1000,incx=1,incy=1;	
	unsigned short int x[1000];
	unsigned short int y[1000];
	int i=0;
	for(;i<n;i++)
	{
		x[i]=i;
		y[i]=2;
	}
	return u16dot(n,&x[0],incx,&y[0],incy);
}


