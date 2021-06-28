#include <stdio.h>

/*
unsigned short int u16asum(register int n,register unsigned short int *arr, int incx)
{
	register int i=0;	
	
	if (n<4)
	goto ce;
	
	register unsigned short int sum=arr[0];		// 4 load inst
	register unsigned short int sum1=arr[1];
	i+=4;
	n-=4;
	
	while(n>=4)
	{
		sum+=arr[i];
		sum+=arr[i+1];
		sum+=arr[i+2]; // vector addition
		sum+=arr[i+3];
		i+=4;
		n-=4;
	}

	sum=sum+sum1; // vector reduction 
	
ce :	if (n>0)
	{
		sum+=arr[0]; // load the element and dec n 
		n=n-1;	     // add only when branching
		
		if (n>0)
		{
			sum+=arr[1];// same as above comment
			n=n-1;
			
			if (n>0)
			{
				sum+=arr[2];// same as above comment
				n=n-1;
			}
		}
	
	}
	
	
	
	return sum ;

}

short int u16asum(int n, short int *arr, int incx)
{
	int i=0;
	short int sum=0;
	 for (;i <n; ++i)
          {
            
            if (arr[i] >= 0)
              sum +=arr[i];
            else
              sum += -arr[i];
          }

	return sum;
}

*/

short int u16asum(int n, short int *arr, int incx);
short int *gen(void);
 
short int main()
{
	int n=1000,incx=1;
	short int *arr;
	arr=gen();
	return u16asum(n,&arr[0],incx);
}
