#include <stdio.h>
unsigned int  u32dot(int n,unsigned int *x,int incx,unsigned int *y,int incy);
/*{
	int k=0,i=0;
	unsigned int ans=0;
	if (n%2==0)
		k=n;
	else
		k=n-1;
	for(;i<k;i=i+2)
		ans=ans+x[i]*y[i];
	if(n%2!=0)
		ans=ans+x[n-1]*y[n-1];
	return ans;
}*/
unsigned int main()
{
	int n=6,incx=1,incy=1;	
	unsigned int x[6]={5, 3, 2, 5, 1, 10};
	unsigned int y[6]={2, 2, 3, 4, 2, 3};
	return u32dot(n,&x[0],incx,&y[0],incy);
}
