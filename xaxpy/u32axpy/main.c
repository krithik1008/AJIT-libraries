#include <stdio.h>
unsigned int *u32axpy(int n,unsigned int alpha,unsigned int *x,int incx,unsigned int *y,int incy);
//normal c code for benchmarking against efficient vector implementation
/*{
	int i=0;
	for(;i<n;i=i+1)
	{
		y[i]=(alpha*x[i])+y[i];	//implemented using vector operations 
	}
	return y;	
	
	
}*/
unsigned int* main()
{
	int n=6,incx=1,incy=1;	
	unsigned int x[6]={4,2,3,4,1,2};
	unsigned int y[6]={2,4,3,4,2,1};
	unsigned int alpha=3;
	return u32axpy(n,alpha,&x[0],incx,&y[0],incy);
}
