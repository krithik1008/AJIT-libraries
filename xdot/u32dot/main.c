#include <stdio.h>
unsigned int  u32dot_1(int n,unsigned int *x,int incx,unsigned int *y,int incy)
{
	int i=0;
	unsigned int ans=0;
	if (n%2!=0)
	{
		ans=ans+(x[0]*y[0]);	//using 32 bit operatoin
		i=1;
	}
	for(;i<n;i=i+2)
	{
		ans=ans+(x[i]*y[i]);	//using vector instructions
	}
	return ans;
}
unsigned int main()
{
	int n=6,incx=1,incy=1;	
	unsigned int x[6]={5, 3, 2, 5, 1, 10};
	unsigned int y[6]={2, 2, 3, 4, 2, 3};
	return u32dot_1(n,&x[0],incx,&y[0],incy);
}
