#include <stdio.h>
float sdot(int N,float *X,int incX,float *Y,int incY);
//normal c code for benchmarking against efficient vector implementation
/*{
	int i=0,ix=0,iy=0;
	float r=0;
	for (i = 0; i < N; i++) {
    		r += X[ix] * Y[iy];
    		ix += incX;
    		iy += incY;
  	}
	return r;
}*/
float main()
{
	int n=1000,incx=1,incy=1;	
	float x[1000];
	float y[1000];
	int i=0;
	for(;i<n;i++)
	{
		x[i]=i;
		y[i]=2;
	}
	return sdot(n,&x[0],incx,&y[0],incy);
}
