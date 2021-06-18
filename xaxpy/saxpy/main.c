#include <stdio.h>
float *saxpy(int n,float alpha,float *x,int incx,float *y,int incy);
/*{
	int i=0;
	if ((n%2)!=0)
	{
		y[0]=(x[0]*alpha)+y[0];	//using 32 bit operatoin
		i=1;
	}
	for(;i<n;i=i+2)
	{
		y[i]=(x[i]*alpha)+y[i];	//using vector instructions
		//y[i+1]=(x[i+1]*alpha)+y[i+1];
	}
	return y;
}*/
float* main()
{
	int n=8,incx=1,incy=1;	
	float x[8]={4,3,2,5,1,1,1};
	float y[8]={1,2,3,4,1,1,1};
	x[7]=3;
	y[7]=1;
	float alpha=1.1;
	return saxpy(n,alpha,&x[0],incx,&y[0],incy);
}
