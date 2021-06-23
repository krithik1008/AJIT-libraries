#include <stdio.h>
int isamax(int n,float *x,int incx);

int main()
{
	int n=4,incx=1;	
	float x[4]={4,7.5,-12.2,-5.3};
	return isamax(n,&x[0],incx);
}
