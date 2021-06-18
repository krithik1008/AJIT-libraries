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
unsigned int *u32scal(int n , unsigned int alpha , unsigned int *arr, int incx);
unsigned int *main()
{
	int n=7,incx=1;	
	unsigned int arr[7]={4,3,2,5,1,7,8};
	unsigned int alpha=100;
	return u32scal(n,alpha,&arr[0],incx);
}
