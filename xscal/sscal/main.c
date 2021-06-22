#include <stdio.h>
/*
float *sscal(int n , register float alpha ,register float *arr, int incx)
{
	register int i=0;
	register int x=n-1;	
	if (n%2!=0)
	{
		arr[x]*=alpha;
		n=x;
	}
	
	for (;i<n;i+=2)
	{
		arr[i]*=alpha;	//both these operations done
		arr[i+1]*=alpha;//with the help of vector inst
	}

	return arr;

}

*/
float *sscal(int n , float alpha , float *arr, int incx);
float* main()
{
	int n=100,incx=1;
	int i=0;	
	float arr[100];
	for (;i<n;i++)
	arr[i]=4;
	

	float alpha=1.1;
	return sscal(n,alpha,&arr[0],incx);
}
