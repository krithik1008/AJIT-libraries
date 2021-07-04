#include <stdio.h>
unsigned char *u8axpy(int n,unsigned char alpha,unsigned char *x,int incx,unsigned char *y,int incy);
/*unsigned char *u8axpy_1(int N,unsigned char alpha,unsigned char *X,int incX,unsigned char *Y,int incY)
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
unsigned char* genx();
unsigned char* geny();
unsigned char* main()
{
	int n=1000,incx=1,incy=1;	
	unsigned char* x=genx();
	unsigned char* y=geny();
	//unsigned char x[9]={1,2,3,4,5,6,7};
	//unsigned char y[9]={1,1,1,1,1,1,1};
	unsigned char alpha=3;
	//int i=0;
	/*for(;i<n;i++)
	{
		x[i]=i;
		y[i]=2;
	}*/
	return u8axpy(n,alpha,&x[0],incx,&y[0],incy);
}
