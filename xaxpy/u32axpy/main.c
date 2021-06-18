#include <stdio.h>
unsigned int *u32axpy(int n,unsigned int alpha,unsigned int *x,int incx,unsigned int *y,int incy);
/*{
	int i=0;
	if ((n%2)!=0)
	{
		y[0]=(alpha*x[0])+y[0];	//using 32 bit operatoin
		i=1;
	}
	for(;i<n;i=i+2)
	{
		y[i]=(alpha*x[i])+y[i];	//implemented using vector operations 
		y[i+1]=(alpha*x[i+1])+y[i+1];
	}
	return y;	
	
	
}*/
unsigned int* main()
{
	int n=5,incx=1,incy=1;	
	unsigned int x[5]={4,2,3,4, 1};
	unsigned int y[5]={2,4,3,4, 2};
	unsigned int alpha=3;
	return u32axpy(n,alpha,&x[0],incx,&y[0],incy);
}
