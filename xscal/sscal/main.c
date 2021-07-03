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

float * __attribute__ ((noinline)) sscal(int n , float alpha , float *arr, int incx)
{
	int i=0;	
	for (i = 0; i < n; i++) 
    		arr[i] *= alpha;

	return arr;
   
}

//float *sscal(int n , float alpha , float *arr, int incx);

float * gen(void);
float* main()
{
	int n=1000,incx=1;
	float *arr;
	arr=gen();
	float alpha=1.5;
	return sscal(n,alpha,&arr[0],incx);
}
