#include <stdio.h>
// just follow the outer structure dont bother whats written in while loop or 
// in swtich cases
/*

unsigned short int *u16scal(int n, unsigned short int alpha ,unsigned short int *arr, int incx)
{	int i=0;
	
	while (n>=4)
{
		arr[i]=arr[i]*alpha;		// vector multiplication 
		n-=4;
		i+=4;
		
}
// this code is more efficient than replacing switch statement with 
// for loop because in case of n<4 with for loop it will take 3+n branch 
//condition and in case of switch statement it will take 3 branch condition
// for case 1 and 2 and 2 branch condition for case 3  
// can be optimized with vector multiplication
switch(n)
		{
			case 1:{arr[i]+=arr[0];break;} // one multiplication
			case 2:{arr[0]*=arr[0];break;} // two multiplication
			case 3:{arr[0]-=arr[0];break;} // thee multiplication
		}
	
	return arr ;

}


unsigned short int * __attribute__((noinline)) u16scal(int n , unsigned short int alpha , unsigned short int *arr, int incx)
{
	int k=0;
	for (;k<n;k++)
	arr[k]*=alpha;
	
	return arr;
}
*/

unsigned short int *u16scal(int n , unsigned short int alpha , unsigned short int *arr, int incx);
unsigned short int* gen(void);
unsigned short int *main()
{
	int n=1000,incx=1;	
	unsigned short int *arr;
	arr=gen();
	unsigned short int alpha=5;
	return u16scal(n,alpha,&arr[0],incx);
}
