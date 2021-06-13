#include <stdio.h>
float sdot(int n,float *x,int incx,float *y,int incy);
/*{
	int k=0,i=0;
	float ans=0;
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
float main()
{
	int n=5,incx=1,incy=1;	
	float x[5]={5.1, 3, 2, 5, 1.2};
	float y[5]={2,	 2, 3, 4, 2.3};
	return sdot(n,&x[0],incx,&y[0],incy);
}
