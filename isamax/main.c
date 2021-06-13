#include <stdio.h>
int isamax(int n,float *x,int incx);
/*{
	int i=1;
	float temp=x[0];
	int ans=0;
	for(;i<n;i=i+1)
		if(x[i]>temp)
		{
			temp=x[i];
			ans=i;
		}
	return ans;
}*/
int main()
{
	int n=4,incx=1;	
	float x[4]={4,7.5,-12.2,-5.3};
	return isamax(n,&x[0],incx);
}
