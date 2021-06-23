#include <stdio.h>
#include "CBLAS/include/cblas.h"
//void cblas_saxpy(const int N, const float alpha, const float *X,const int incX, float *Y, const int incY);
int main()
{
	int n=6,incx=1,incy=1;	
	float x[6]={4,3,2,5,1,1};
	float y[6]={1,2,3,4,1,1};
	float alpha=1.3;
	cblas_saxpy(n,alpha,x,incx,y,incy);
	return 0;
}
