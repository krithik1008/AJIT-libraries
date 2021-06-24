#include <stdio.h>
#include <stdlib.h>
float *saxpy(int N,float alpha,float *X,int incX,float *Y,int incY);
/*float *saxpy_1(int N,float alpha,float *X,int incX,float *Y,int incY)
//normal c code for benchmarking against efficient vector implementation
{
	if (incX == 1 && incY == 1)
	{
    		const int m = N % 4;
		int i=0;
    		for (; i < m; i++){
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
float* main()
{
	int n=1000,incx=1,incy=1;	
	
	//float* x=(float*)os_malloc(5*sizeof(float));
	//float* y=(float*)os_malloc(5*sizeof(float));

	float x[1000];
	float y[1000];
	int i=0;
	for(;i<n;i++)
	{
		x[i]=2;
		y[i]=1;
	}
	float alpha=1.1;
	return saxpy(n,alpha,&x[0],incx,&y[0],incy);
}
