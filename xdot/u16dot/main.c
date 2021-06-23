#include <stdio.h>
unsigned short int u16dot(int n,unsigned short int *x,int incx,unsigned short int *y,int incy);
/*{
	int i=0;	
	int ans=0;
	for(;i<n;i++)
		ans=ans+(x[i]*y[i]);

	return ans;
}*/
unsigned short int main()
{
	int n=6,incx=1,incy=1;	
	unsigned short int x[10]={4,2,3,4,7,1};
	unsigned short int y[12]={2,4,3,4,1,2};
	return u16dot(n,&x[0],incx,&y[0],incy);
}
