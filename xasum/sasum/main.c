#include <stdio.h>
#include<math.h>
/*
float sasum(int n, float *arr, int incx)
{	int x=n-1;
	int i=2;
	int k=1;
	float sum=arr[0];
	float sum1=arr[1];

	if (n>=4)
	{
		if (n%2!=0)
		{
			sum+=arr[x];
			n=x;
		}

		for (;i<n;i+=2)
		{
			// proper vector multiplication 
		}
		sum_lower+=sum_upper;
	
	}
	else 
	{	
		for (;k<n;k++)
		{
			sum+=arr[k]; // vector multiplication  inefficient for
				     // arrays of size less than 4
				     // bcz vector instruction reduces 3 additions
				     // to 2 
		}
		
	}
	
	return sum ;

}


 float __attribute__ ((noinline)) sasum(int n, float *arr, int incx)
{
	int i=0;
	float r=0;
	for (; i < n; i++) {
    	r += fabs(arr[i]);
  	}
	
  	return r;
}
*/

float sasum(int n, float *arr, int incx);
float *gen(void);


float main()
{
	int n=1000,incx=1;	
	float *arr;
	arr=gen();	
	return sasum(n,&arr[0],incx);
}
