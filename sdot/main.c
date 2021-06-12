#include <stdio.h>
float sdot(int n,float *x,int incx,float *y,int incy);
float main()
{
	int n=5,incx=1,incy=1;	
	float x[5]={5.1,3,2,5,1.2};
	float y[5]={2,2,3,4,2.3};
	return sdot(n,&x[0],incx,&y[0],incy);
}
