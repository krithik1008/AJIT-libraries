#include <stdio.h>

float *sscal(int n , float alpha , float *arr, int incx);
float* main()
{
	int n=5,incx=1;	
	float arr[5]={4,3,2,5,1};
	float alpha=1.1;
	return sscal(n,alpha,&arr[0],incx);
}
