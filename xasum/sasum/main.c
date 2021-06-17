#include <stdio.h>
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
*/
float sasum(int n, float *arr, int incx);
float main()
{
	int n=3,incx=1;	
	float arr[3]={-4.781002,3.457821,-2.457896};
	return sasum(n,&arr[0],incx);
}
