#include <stdio.h>
float *saxpy(int n,float alpha,float *x,int incx,float *y,int incy);
//normal c code for benchmarking against efficient vector implementation
/*{
	int i=0;
	for(;i<n;i=i+1)
	{
		y[i]=(x[i]*alpha)+y[i];
	}
	return y;
}*/
float* main()
{
	int n=6,incx=1,incy=1;	
	float x[6]={4,3,2,5,1,1};
	float y[6]={1,2,3,4,1,1};
	float alpha=1.1;
	return saxpy(n,alpha,&x[0],incx,&y[0],incy);
}
