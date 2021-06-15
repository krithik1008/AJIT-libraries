#include <stdio.h>
float sdot(int n,float *x,int incx,float *y,int incy);
/*{
	int i=0;
	float ans=0;
	if (n%2!=0)
	{
		ans=ans+(x[0]*y[0]);	//using 32 bit operatoin
		i=1;
	}
	for(;i<n;i=i+2)
	{
		ans=ans+(x[i]*y[i]);	//using vector instructions
		ans=ans+(x[i+1]*y[i+1]);
	}
	return ans;
}*/
float main()
{
	int n=5,incx=1,incy=1;	
	float x[5]={5.1, 3, 2, 5, 1.2};
	float y[5]={2,	 2, 3, 4, 2.3};
	return sdot(n,&x[0],incx,&y[0],incy);
}
