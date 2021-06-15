#include <stdio.h>
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
switch(n)
		{
			case 1:{arr[i]+=arr[0];break;}
			case 2:{arr[0]*=arr[0];break;}
			case 3:{arr[0]-=arr[0];break;}
		}
	
	return arr ;

}
*/
unsigned short int *u16scal(int n , unsigned short int alpha , unsigned short int *arr, int incx);
unsigned short int *main()
{
	int n=4,incx=1;	
	unsigned short int arr[4]={2,1,1,100};
	unsigned short int alpha=100;
	return u16scal(n,alpha,&arr[0],incx);
}
