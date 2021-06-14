#include <stdio.h>
unsigned int *u32axpy(int n,unsigned int alpha,unsigned int *x,int incx,unsigned int *y,int incy);
/*{
	int i=0;
	if (n%2!=0)
	{
		y[0]=(alpha*x[0])+y[0];	//not 32 bit operatoin
		i=1;
	}
	for(;i<n;i=i+2)
		y[i]=(alpha*x[i])+y[i];	//implemented using vector operations 
	return y;	
	
	
}*/
unsigned int* main()
{
	int n=4,incx=1,incy=1;	
	unsigned int x[4]={4,2,3,4};
	unsigned int y[4]={2,4,3,4};
	unsigned int alpha=3;
	return u32axpy(n,alpha,&x[0],incx,&y[0],incy);
}
