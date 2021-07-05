#include <stdio.h>
unsigned int *u32axpy(int N,unsigned int alpha,unsigned int *X,int incX,unsigned int *Y,int incY);
/*unsigned int *u32axpy_1(int N,unsigned int alpha,unsigned int *X,int incX,unsigned int *Y,int incY)
//normal c code for benchmarking against efficient vector implementation
{
	if (incX == 1 && incY == 1)
	{
    		const int m = N % 4;
		int i;
    		for (i = 0; i < m; i++){
      		Y[i] += alpha * X[i];
    		}

    		for (i = m; i + 3 < N; i += 4) {
      			Y[i] += alpha * X[i];
      			Y[i + 1] += alpha * X[i + 1];
      			Y[i + 2] += alpha * X[i + 2];
      			Y[i + 3] += alpha * X[i + 3];
    		}
  	}
	return Y;	
	
	
}*/
unsigned int* genx();
unsigned int* geny();
unsigned int* main()
{
	int n=1000,incx=1,incy=1;	
	unsigned int* x=genx();
	unsigned int* y=geny();
	//unsigned int x[8]={1,2,3,4,5,6};
	//unsigned int y[8]={1,1,1,1,1,1};
	unsigned int alpha=3;
	//int i=0;
	/*for(;i<n;i++)
	{
		x[i]=i;
		y[i]=2;
	}*/
	return u32axpy(n,alpha,&x[0],incx,&y[0],incy);
}
