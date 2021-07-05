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

char u8asum(int n, char *arr, int incx)
{
	
	int i=0;
	char sum=0;
	 for (;i<n; ++i)
          {
            
            if (arr[i] >= 0)
              sum +=arr[i];
            else
              sum += -arr[i];
          }

	return sum;

}


//char u8asum(int n, char *arr, int incx);
char *gen(void);

char main()
{
	int n=1000,incx=1;	
	char *arr;
	arr=gen();
	return u8asum(n,&arr[0],incx);
}







