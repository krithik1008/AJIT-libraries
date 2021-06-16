#include <stdio.h>
/*

unsigned char *u8scal(int n, unsigned char alpha ,unsigned char *arr, int incx)
{
int i=0;
	
while (n>=8)
{
	arr[i]=arr[i]*alpha;		// vector multiplication 
	arr[i+1]=arr[i+1]*alpha;	// vector multiplication 
	arr[i+2]=arr[i+2]*alpha;	// vector multiplication
	.
	.
	.. 
	n-=8;
	i+=8;		
}

switch(n)
{
			// one char is loaded at a time 
			// and length is checked , if it 
			// becomes 0 then we do the 
			// vector multiplication 
}

	return arr ;

}
*/
unsigned char *u8scal(int n , unsigned char alpha , unsigned char *arr, int incx);
unsigned char *main()
{
	int n=7,incx=1;	
	unsigned char arr[7]={2,9,5,7,6,8,1};
	unsigned char alpha=5;
	return u8scal(n,alpha,&arr[0],incx);
}
