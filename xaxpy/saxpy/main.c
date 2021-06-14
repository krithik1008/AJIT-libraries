#include <stdio.h>
float *saxpy(int n,float alpha,float *x,int incx,float *y,int incy);
float* main()
{
	int n=4,incx=1,incy=1;	
	float x[4]={4,3,2,5};
	float y[4]={1,2,3,4};
	float alpha=1.1;
	return saxpy(n,alpha,&x[0],incx,&y[0],incy);
}
