#include <stdio.h>
unsigned int  u32dot(int n,unsigned int *x,int incx,unsigned int *y,int incy);
//normal c code for benchmarking against efficient vector implementation
/*{
	int i=0;
	unsigned int ans=0;
	for(;i<n;i=i+1)
	{
		ans=ans+(x[i]*y[i]);	
	}
	return ans;
}*/
unsigned int main()
{
	int n=5,incx=1,incy=1;	
	unsigned int x[5]={5, 3, 2, 5, 10};
	unsigned int y[5]={2, 2, 3, 4, 3};
	return u32dot(n,&x[0],incx,&y[0],incy);
}

