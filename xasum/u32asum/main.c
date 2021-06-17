#include <stdio.h>
#include <math.h>
/*
int u32asum(int n, int *arr, int incx)
{	int x=n-1;
	int i=2;
	int k=1;
	int sum=arr[0];
	int sum1=arr[1];

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
		sum+=sum1;
	
	}
	else 
	{			     // conditional execution 	
			sum+=arr[k]; // vector multiplication  inefficient for
				     // arrays of size less than 4
				     // bcz vector instruction reduces 3 additions
				     // to 2 
		
		
	}
	
	return sum ;

}
*/

int u32asum(int n, int *arr, int incx);
int main()
{
	int n=2,incx=1;	
	int arr[2]={-100,-400};
	return u32asum(n,&arr[0],incx);
}
