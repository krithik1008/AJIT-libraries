#include <stdio.h>

/*
 short int u16asum(register int n,register unsigned short int *arr, int incx)
{
	register int i=0;	
	
	if (n<8)
	goto ce;
	
	register  short int l0=arr[0];	// 8 load inst
	register  short int l1=arr[1];	// and vector absolute
	i+=8;
	n-=8;
	
	while(n>=8)
	{
		sum+=arr[i];	// 8 vector load
		sum+=arr[i+1];	// vector absolute
		sum+=arr[i+2]; 
		sum+=arr[i+3];
		i+=8;
		n-=8;
	}

	l0=l0+l1; // vector reduction 
	
ce :	// 7 conditional load 
	// normal absolute addition
	
	return sum ;

}
*/

short int u8asum(int n, char *arr, int incx);

short int main()
{
	int n=24,incx=1;
	int i=1;	
	char arr[30];
	arr[0]=0;
	for (;i<n;i++)
	arr[i]=-1;

	return u8asum(n,&arr[0],incx);
}







