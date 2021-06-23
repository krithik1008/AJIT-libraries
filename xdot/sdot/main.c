#include <stdio.h>
float sdot(int n,float *x,int incx,float *y,int incy);
//normal c code for benchmarking against efficient vector implementation
/*{
	int i=0;
	float ans=0;
	for(;i<n;i=i+1)
	{
		ans=ans+(x[i]*y[i]);	
	}
	return ans;
}*/
float main()
{
	int n=5,incx=1,incy=1;	
	float x[5]={5.1, 3, 2, 5, 2};
	float y[5]={2,	 2, 3, 4, 1};
	return sdot(n,&x[0],incx,&y[0],incy);
}
