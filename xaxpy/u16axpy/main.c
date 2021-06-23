#include <stdio.h>
unsigned short int *u16axpy(int n,unsigned int alpha,unsigned short int *x,int incx,unsigned short int *y,int incy);
unsigned short int* main()
{
	int n=7,incx=1,incy=1;	
	unsigned short int x[8]={4,2,3,4,7,1};
	unsigned short int y[8]={2,4,3,4,1,2};
	unsigned int alpha=3;
	return u16axpy(n,alpha,&x[0],incx,&y[0],incy);
}
