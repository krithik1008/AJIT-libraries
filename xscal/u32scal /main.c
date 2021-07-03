#include <stdio.h>
/*
unsigned int *u32scal(int n , unsigned int alpha , unsigned int *arr, int incx)
{
	int i=0;
	int x=n-1;	
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
unsigned int * __attribute__((noinline)) u32scal(int n , unsigned int alpha , unsigned int *arr, int incx)
{
	int k=0;
	for (;k<n;k++)
	arr[k]*=alpha;
	
	return arr;
}

//unsigned int *u32scal(int n , unsigned int alpha , unsigned int *arr, int incx);
unsigned int* gen(void);
unsigned int *main()
{
	int n=1000,incx=1;	
	unsigned int *arr;
	arr=gen();
	unsigned int alpha=100;
	return u32scal(n,alpha,&arr[0],incx);
}
