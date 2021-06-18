#include <stdio.h>
#include <math.h>
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
*/

 short int u16asum(int n, short int *arr, int incx);
 short int main()
{
	int n=1,incx=1;
	int i=0;	
	short int arr[1];
	/*short int arr[0]={-100,-400,100,500,-600};
	short int arr[11]={-100,-1000,-400,-1000,-1000,-1000,-10};
	arr[7]=-100;
	arr[8]=-1589;
	arr[9]=-1000;
	arr[10]=-1000;
	//arr[8]=-1589;
	*/
	for (;i<n;i++)
	arr[i]=-100;
	return u16asum(n,&arr[0],incx);
}
